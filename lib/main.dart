import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test/core/provider.dart';
import 'package:test/views/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BasketProvider()),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('tr', 'TR'), Locale('en', 'US')],
        path: 'assets/lang',
        useFallbackTranslations: true,
        fallbackLocale: const Locale('tr', 'TR'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Uygulaması',
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      home: const HomeScreen(),
    );
  }
}
