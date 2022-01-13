import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io' show Platform; // нужно для Platform.isIOS ?

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {

  late BannerAd myBanner;

  @override
  void initState() {

    myBanner = BannerAd(
      adUnitId: Platform.isIOS ? "ca-app-pub-3940256099942544/6300978111" : "ca-app-pub-3940256099942544/2934735716",
      size: AdSize.mediumRectangle,
      listener: BannerAdListener(),
      request: AdRequest(),
    )..load();
    super.initState();
  }

  @override
  void dispose() {
    myBanner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: AdWidget(ad: myBanner,),
              width: myBanner.size.width.toDouble(),
              height: myBanner.size.height.toDouble(),
            ),
            SizedBox(height: 5,),

          ],
        ),
      ),
    );
  }
}
