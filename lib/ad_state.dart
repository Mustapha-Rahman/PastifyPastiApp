
import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdState{
  late Future<InitializationStatus> initialization;

  AdState(this.initialization);

  String get bannerAdUnitId=>Platform.isAndroid
      ?'ca-app-pub-7039001693169695/3968089037'
      :'ca-app-pub-7039001693169695/3968089037';

  final BannerAdListener listener = BannerAdListener(
    // Called when an ad is successfully received.
    onAdLoaded: (Ad ad) => print('Ad loaded.'),
    // Called when an ad request failed.
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      // Dispose the ad here to free resources.
      ad.dispose();
      print('Ad failed to load: $error');
    },
    // Called when an ad opens an overlay that covers the screen.
    onAdOpened: (Ad ad) => print('Ad opened.'),
    // Called when an ad removes an overlay that covers the screen.
    onAdClosed: (Ad ad) => print('Ad closed.'),
    // Called when an impression occurs on the ad.
    onAdImpression: (Ad ad) => print('Ad impression.'),
  );








}
/*
class AdInterstitial{
  late Future<InitializationStatus> initializationInterstitial;

  AdInterstitial(this.initializationInterstitial);

  String get InterstitialAd=>Platform.isAndroid
      ?'ca-app-pub-7039001693169695/5442088276'
      :'ca-app-pub-7039001693169695/5442088276';
}

 */

