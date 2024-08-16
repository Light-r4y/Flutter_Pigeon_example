import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:aaa/aaa.dart';
import 'package:aaa/src/Aaa_api.g.dart';

void main() {
  runApp(const MyApp());
  // setup callback form native
  AaaFlutterApi.setUp(AaaFlutter());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  // final _aaaPlugin = Aaa();

  final _aaaPluginApi = AaaApi();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          // await _aaaPlugin.getPlatformVersion() ?? 'Unknown platform version';
      await _aaaPluginApi.bbb('Name Value!');
    } on PlatformException {
      platformVersion = 'Failed native call bbb()';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
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
          child: Text('Return: $_platformVersion\n'),
        ),
      ),
    );
  }
}
