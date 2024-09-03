// // import 'dart:io';
// // import 'dart:typed_data';
// // import 'dart:ui' as ui;
// // import 'package:flutter/material.dart';
// // import 'package:flutter/rendering.dart';
// // import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
// // import 'package:path_provider/path_provider.dart';
// // import 'package:print/printpage.dart';
// //
// // class HtmlToImageExample extends StatefulWidget {
// //   final String htmlContent; // Pass HTML content from JS
// //
// //   HtmlToImageExample({required this.htmlContent});
// //
// //   @override
// //   _HtmlToImageExampleState createState() => _HtmlToImageExampleState();
// // }
// //
// // class _HtmlToImageExampleState extends State<HtmlToImageExample> {
// //   GlobalKey _repaintKey = GlobalKey();
// //
// //   // Future<Uint8List?> _captureWidgetAsImage() async {
// //   //   try {
// //   //     RenderRepaintBoundary boundary = _repaintKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
// //   //     ui.Image image = await boundary.toImage(pixelRatio: 3.0);
// //   //     ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
// //   //     Uint8List pngBytes = byteData!.buffer.asUint8List();
// //   //     return pngBytes;
// //   //
// //   //   } catch (e) {
// //   //     print("Error capturing widget as image: $e");
// //   //     return null;
// //   //   }
// //   // }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('HTML to Image'),
// //       ),
// //       body: RepaintBoundary(
// //         key: _repaintKey,
// //         child: SingleChildScrollView(
// //           child: HtmlWidget(widget.htmlContent),
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () async {
// //           Uint8List? imageBytes = await _captureWidgetAsImage();
// //           if (imageBytes != null) {
// //             print("Image captured as Uint8List");
// //             // You can use imageBytes as needed, e.g., save or display it
// //             _saveImage(imageBytes);
// //           }
// //         },
// //         tooltip: 'Capture Image',
// //         child: Icon(Icons.camera),
// //       ),
// //     );
// //   }
// //
// //   Future<void> _saveImage(Uint8List imageBytes) async {
// //     final directory = await getApplicationDocumentsDirectory();
// //     final file = File('${directory.path}/output_image.png');
// //     await file.writeAsBytes(imageBytes);
// //     print('Image saved to ${file.path}');
// //   }
// // }
//
//
//
//
//
//
// import 'dart:core';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class dta extends ChangeNotifier
// {
//   String? _jsmessage;
//   get String jsmessage=>_jsmessage;
//
//
// }