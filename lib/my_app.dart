import 'package:coins_list/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'package:coins_list/router/router.dart';
import 'package:coins_list/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('en'),
      supportedLocales: S.delegate.supportedLocales,      
      title: 'MyApp',
      theme: darkTheme,
      routes: routes,
    );
  }
}
