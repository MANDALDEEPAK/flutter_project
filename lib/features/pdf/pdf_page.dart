import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfPage extends StatelessWidget {
  final String pdfUrl;
  const PdfPage({super.key,required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SfPdfViewer.network(
        pdfUrl
      ),
    );
  }
}
