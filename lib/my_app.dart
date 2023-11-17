import 'package:flutter/material.dart';

import 'package:coins_list/router/router.dart';
import 'package:coins_list/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      theme: darkTheme,
      routes: routes,
    );
  }
}
