import 'package:coins_list/repositories/coins/abstract_coin_repository.dart';
import 'package:coins_list/repositories/coins/coins_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:coins_list/my_app.dart';
import 'package:get_it/get_it.dart';


void main() {
  GetIt.I.registerSingleton<AbstractCoinRepository>(CryptoCoinsRepository(dio: Dio()));
  
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

