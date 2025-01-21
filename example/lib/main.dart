import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_operator_info/mobile_operator_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _operatorInfo = 'Unknown';
  final _mobileOperatorInfoPlugin = MobileOperatorInfo();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    MobileOperatorInfoData info;
    try {
      info = await _mobileOperatorInfoPlugin.getMobileOperatorInfo();
    } on PlatformException {
      info = MobileOperatorInfoData();
    }

    if (!mounted) return;

    setState(() {
      _operatorInfo = info.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_operatorInfo\n'),
        ),
      ),
    );
  }
}
