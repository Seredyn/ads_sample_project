import 'package:ads_sample_project/screens/get_ads_id.dart';
import 'package:ads_sample_project/screens/screen_one.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: GetAdsId(),
      home: ScreenOne(),
    );
  }
}
