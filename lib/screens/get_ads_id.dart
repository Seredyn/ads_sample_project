import 'package:advertising_id/advertising_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GetAdsId extends StatefulWidget {

  @override
  _GetAdsIdState createState() => _GetAdsIdState();
}

class _GetAdsIdState extends State<GetAdsId> {
  String? _advertisingId = '';
  bool? _isLimitAdTrackingEnabled;

  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    String? advertisingId;
    bool? isLimitAdTrackingEnabled;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      advertisingId = await AdvertisingId.id(true);
      print("$_advertisingId");
    } on PlatformException {
      advertisingId = 'Failed to get platform version.';
    }

    print("$_advertisingId");

    try {
      isLimitAdTrackingEnabled = await AdvertisingId.isLimitAdTrackingEnabled;
    } on PlatformException {
      isLimitAdTrackingEnabled = false;
    }



    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _advertisingId = advertisingId;
      _isLimitAdTrackingEnabled = isLimitAdTrackingEnabled;
    });
  }



  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Advertising Id: $_advertisingId'),
              Text('isLimitAdTrackingEnabled : $_isLimitAdTrackingEnabled'),
            ],
          ),
        ),
      ),
    );
  }
}