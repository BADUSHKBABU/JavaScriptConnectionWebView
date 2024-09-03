// import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
// import 'package:flutter/services.dart' show Uint8List, rootBundle;
//
// class HtmlToPdfConverter extends StatefulWidget {
//   @override
//   _HtmlToPdfConverterState createState() => _HtmlToPdfConverterState();
// }
//
// class _HtmlToPdfConverterState extends State<HtmlToPdfConverter> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("HTML to PDF")),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _convertHtmlToPdf,
//           child: Text("Convert HTML to PDF"),
//         ),
//       ),
//     );
//   }
//
//   // Function to convert HTML to PDF
//   Future<void> _convertHtmlToPdf() async {
//     // Load the HTML file from assets
//     String htmlContent = await rootBundle.loadString('assets/sample.html');
//
//     // Generate PDF from HTML
//     Uint8List pdfData = await _generatePdfFromHtml(htmlContent);
//
//     // Print or save the generated PDF
//     await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdfData);
//   }
//
//   // Generate PDF from HTML content
//   Future<Uint8List> _generatePdfFromHtml(String htmlContent) async {
//     final pdfDoc = pw.Document();
//
//     // Create a page in the PDF document
//     pdfDoc.addPage(
//       pw.Page(
//         build: (pw.Context context) {
//           return pw.Center(
//             child: pw.Text("Your PDF Content Goes Here"),
//           );
//         },
//       ),
//     );
//
//     // Use the 'Printing' package to convert HTML to PDF (for complex HTML)
//     final pdfBytes = await Printing.convertHtml(
//       format: PdfPageFormat.a4,
//       html: htmlContent,
//     );
//
//     return pdfBytes;
//   }
// }
