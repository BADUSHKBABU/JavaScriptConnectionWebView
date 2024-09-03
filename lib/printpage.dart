import 'dart:io';



import 'dart:typed_data';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';


import 'dart:async';


import 'package:image/image.dart' as img;









import 'package:html/parser.dart' as html_parser;

import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';

import 'package:flutter/services.dart' show Uint8List, rootBundle;








import 'package:flutter/cupertino.dart';

import 'package:webview_flutter/webview_flutter.dart';



class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();


}

class _WebViewPageState extends State<WebViewPage> {
  List<BluetoothDevice> _devices = [];
  BluetoothDevice? _selectedDevice;
  bool _connected = false;
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;
  String ms = "";
  Uint8List imagetoprint=Uint8List(10000);
  GlobalKey _repaintKey = GlobalKey();
  String bodyresponse = "";
  late WebViewController controller;
  WebViewController _controller = WebViewController();
String plaintext="";
String data="";
  Uint8List imageBytes=Uint8List(0);
  Uint8List  ?screenshot;




  void initState() {
    super.initState();

    _initializeBluetooth();


    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(

          "FlutterChannel",
          onMessageReceived: (JavaScriptMessage message) async {
            print("Message from JS: ${message.message}");
           setState(() {
             plaintext=message.message;
           });

            // HtmlToImageConverter converter = HtmlToImageConverter(htmlContent: message.message);
            // Uint8List imageBytes = await converter.convertHtmlToImage(message.message);

            //  imagetoprint=imageBytes;
            //
            print("image at main page is: $imageBytes");


            //print after press print button on web
// bluetooth.printCustom(plaintext, 0, 10);
        //  _captureAndProcessImage();//8/30/2024








          })
      ..loadRequest(Uri.parse("https://prerelease.codexerp.com/login.php"));

    controller.setNavigationDelegate(
      NavigationDelegate(
        onNavigationRequest: (NavigationRequest request) {
          print("Navigation request: ${request.url}");

          //--
          if (request.url.endsWith("print.php")) {
            print("injected");
            _injectJavaScriptListener();
            return NavigationDecision.prevent;
          }

          // Decide whether to allow or block the navigation
          return NavigationDecision.navigate; // Allow navigation
        },
        onPageFinished: (String url) {
          print("url is : $url");
          //_injectJavaScriptListener();
        },
      ),
    );
  }


  void _initializeBluetooth() async {
    bool isAvailable = await bluetooth.isAvailable ?? false;
    if (isAvailable) {
      // Get connected device
      bluetooth.onStateChanged().listen((state) {
        if (state == BlueThermalPrinter.CONNECTED) {
          setState(() {
            _connected = true;
          });
        } else {
          setState(() {
            _connected = false;
          });
        }
      });

      // Get list of paired devices
      _getDevices();
    }
  }

  // Get the list of paired devices
  void _getDevices() async {
    List<BluetoothDevice> devices = await bluetooth.getBondedDevices();
    setState(() {
      _devices = devices;
    });
  }

  // Connect to a Bluetooth device
  void _connectToDevice() {
    if (_selectedDevice != null) {
      print("connected device :  $_selectedDevice");
      bluetooth.connect(_selectedDevice!);
    }
  }

  // Disconnect from the Bluetooth device
  void _disconnect() {
    bluetooth.disconnect();
  }
  // Function to inject JavaScript listener
  void _injectJavaScriptListener() {
    controller.runJavaScript("""
      // Check if the print button exists
      var printButton = document.getElementById('printbutton');
      if (printButton) {
        // Add event listener if the button exists
        printButton.addEventListener('click', function() {
          // Send a message to Flutter when the print button is clicked
          FlutterChannel.postMessage('Print button was clicked');
        });
      } else {
        // Optional: Send a message to Flutter if the button does not exist
        FlutterChannel.postMessage('Print button does not exist');
      }
    """);
  }
  Future<bool> _requestPermissions() async {
    var locationPermission = await Permission.location.request();
    return locationPermission.isGranted;
  }


  final ScreenshotController _screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(


        ),
        body: ListView(
            children: [
              DropdownButton<BluetoothDevice>(
                hint: Text('Select Device'),
                value: _selectedDevice,
                onChanged: (BluetoothDevice? device) {
                  setState(() {
                    _selectedDevice = device;
                  });
                },
                items: _devices.map((device) {
                  return DropdownMenuItem(
                    child: Text(device.name!),
                    value: device,
                  );
                }).toList(),
              ),
              ElevatedButton(
                onPressed: _connected ? _disconnect : _connectToDevice,
                child: Text(_connected ? 'Disconnect' : 'Connect'),
              ),
              Container(
                width: MediaQuery
                    .of(context).size.width,
                height: 400,
                child: WebViewWidget(controller: controller),
              ),

              Screenshot(
                controller: _screenshotController,
                child:
                   Container(color: Colors.white,
                     child:Text(plaintext)

                     // child: Html(shrinkWrap: true,
                     //  data: plaintext, // Render HTML
                     //                   ),
                   ),

              ),
              ElevatedButton(onPressed: ()
              {
                setState((){

                  _captureAndProcessImage();
                  //bluetooth.printCustom(_screenshotController.toString(), 2, 0);
                });
              }, child: Text("print")),
if(screenshot!=null)...[  Container(height: 300,
  child: Image.memory(screenshot!,),)]else...[CircularProgressIndicator()]


            ]
        )
    );
  }







///if needed

  Future<Uint8List?> _captureAndProcessImage() async {
    try {
      // Capture the screenshot
      final Uint8List? capturedImage = await _screenshotController.capture();

      if (capturedImage != null){

        // Convert the image to a format we can manipulate (using the image package)
        img.Image originalImage = img.decodeImage(capturedImage)!;

        // Convert to grayscale
        img.Image grayscaleImage = img.adjustColor(originalImage);

        // Resize the image to the printer's width (e.g., 384px for many thermal printers)
        img.Image resizedImage = img.copyResize(grayscaleImage, width: 650,);

        // Encode the image back to Uint8List for printing
        Uint8List processedImage = Uint8List.fromList(img.encodePng(resizedImage));


        // Save the processed image locally if needed
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = '${directory.path}/processed_image.png';
        final imageFile = File(imagePath);
        await imageFile.writeAsBytes(processedImage);
         _printCapturedImage(imagePath);
         setState(()
         {
           screenshot=capturedImage;
         });

return processedImage;

        // Return the processed image
       // return processedImage;
      }
      return null;
    } catch (e) {
      print('Error processing image: $e');
      return null;
    }
  }

// Print the processed image using blue_thermal_printer
  void _printCapturedImage(String imagepath) async {
    if (imagepath != null) {
      print("path of image is : $imagepath");
      // Check if the printer is connected
      final isConnected = await bluetooth.isConnected;
      if (isConnected == true)
      {
        // Send the processed image to the printer for printing
        bluetooth.printImage(imagepath);
      }
      else
      {
        print("Printer is not connected");
      }
    }
    else
    {
      print("No image captured to print");
    }
  }

}
