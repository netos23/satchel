import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

class ReportView extends StatefulWidget {
  const ReportView({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  @override
  Widget build(BuildContext context) {

    return InteractiveViewer(
      child: Text(widget.text),
    );
  }
}
