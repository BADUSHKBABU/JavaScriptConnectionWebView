// // //import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';
// //
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart' show Uint8List, rootBundle;



import 'dart:typed_data';
// import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
// import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:print/print_service.dart';
import 'dart:ui' as ui;
import 'package:print/service/daraprovider.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:htmltopdfwidgets/htmltopdfwidgets.dart'as pdf;
import 'package:pdf/widgets.dart' as pdfwidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'dart:ui' as ui;
// // // class HtmlToImageConverter extends StatefulWidget {
// // //   final String htmlContent;
// // //   HtmlToImageConverter({required this.htmlContent});
// // //   @override
// // //   _HtmlToImageConverterState createState() => _HtmlToImageConverterState();
// // // }
// // //
// // // class _HtmlToImageConverterState extends State<HtmlToImageConverter> {
// // //   GlobalKey _repaintBoundaryKey = GlobalKey();
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     // Wait for the widget to be built and then capture the image
// // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // //       _capturePng(BuildContext);
// // //     });
// // //   }
// // //
// // //   Future<void> _capturePng(BuildContext) async {
// // //     final _provider = Provider.of<ImageconProvider>(context, listen: false);
// // //     try {
// // //       final RenderRepaintBoundary boundary =
// // //       _repaintBoundaryKey.currentContext!
// // //           .findRenderObject() as RenderRepaintBoundary;
// // //       if (boundary != null) {
// // //         ui.Image image = await boundary.toImage(pixelRatio: 3.0);
// // //         ByteData? byteData = await image.toByteData(
// // //             format: ui.ImageByteFormat.png);
// // //         Uint8List pngBytes = byteData!.buffer.asUint8List();
// // //
// // //         // Do something with the image, like saving it or returning it
// // //         print("Image captured!");
// // //         print(pngBytes);
// // //         _provider.imageconverter(pngBytes);
// // //       }
// // //     } catch (e) {
// // //       print("Error capturing HTML as image: $e");
// // //     }
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final _provider = Provider.of<ImageconProvider>(context, listen: false);
// // //     return Scaffold(
// // //       body: Center(
// // //         child: RepaintBoundary(
// // //           key: _repaintBoundaryKey,
// // //           child: SingleChildScrollView(
// // //             child: HtmlWidget(widget.htmlContent),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// //
// //
// import 'dart:async';
// import 'dart:typed_data';
// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
//
// class HtmlToImageConverter {
//   final String htmlContent;
//
//   HtmlToImageConverter({required this.htmlContent});
//
//   Future<Uint8List> convertHtmlToImage(String html) async {
//     print("HTML content: $html");
//
//     // GlobalKey to access the RepaintBoundary
//     final GlobalKey repaintBoundaryKey = GlobalKey();
//
//     // Completer to wait for the widget to render
//     final completer = Completer<Uint8List>();
//
//     // Create a Flutter widget that renders the HTML content
//     Widget htmlWidget = MaterialApp(
//       home: Scaffold(
//         body: RepaintBoundary(
//           key: repaintBoundaryKey,
//           child: HtmlWidget(html),
//         ),
//       ),
//     );
//
//     // Run the widget and capture the image once it's built
//
//      runApp(MaterialApp(
//        home: Scaffold(backgroundColor: Colors.white,
//          body: Builder(
//            builder: (context) {
//              return htmlWidget;
//            },
//          ),
//        ),
//      ));
//
//
//     // Wait for the widget to render
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       try {
//         RenderRepaintBoundary boundary = repaintBoundaryKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
//
//         // Capture the widget's rendered output as an image
//         ui.Image image = await boundary.toImage(pixelRatio: 3.0);
//         ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//         Uint8List pngBytes = byteData!.buffer.asUint8List();
//
//         // Complete the future with the image data
//        completer.complete(pngBytes);
//         print("image is :$pngBytes");
//       }
//       catch (e)
//       {
//         print("Error capturing HTML as image: $e");
//         completer.completeError(e);
//       }
//     });
//
//     return completer.future;
//   }
// }

//
//
//
//
//
// //
// //
// //
