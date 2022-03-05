
import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdStateInterstitial{
  late Future<InitializationStatus> initialization;

  AdStateInterstitial(this.initialization);

  String get InterstitialAd=>Platform.isAndroid
      ?'ca-app-pub-7039001693169695/3968089037'
      :'ca-app-pub-7039001693169695/3968089037';





}