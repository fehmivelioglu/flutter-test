import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('tr', 'TR'), Locale('en', 'US')],
        path: 'assets/lang',
        useFallbackTranslations: true,
        fallbackLocale: const Locale('tr', 'TR'),
        saveLocale: true,
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Uygulaması',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test Uygulaması'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
