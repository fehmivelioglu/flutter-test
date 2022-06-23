import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:test/core/extension/lang_extension.dart';
import 'package:test/core/extension/locale_keys.g.dart';
import 'package:test/core/extension/locale_keys_help.g.dart';

class EasyLocalizationScreen extends StatefulWidget {
  const EasyLocalizationScreen({Key? key}) : super(key: key);

  @override
  State<EasyLocalizationScreen> createState() => _EasyLocalizationScreenState();
}

class _EasyLocalizationScreenState extends State<EasyLocalizationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        if (context.locale.toString().substring(0, 2) == 'en') {
          await context.setLocale(const Locale('tr', 'TR'));
        } else {
          await context.setLocale(const Locale('en', 'US'));
        }
      }),
      appBar: AppBar(title: const Text('Easy localization')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(LocaleKeys.merhaba.locale),
            Text(LocaleKeysHelp.nasilsin.locale),
            Text(LocaleKeys.gender.tr(gender: 'male')),
            Text(LocaleKeys.sayi.tr(args: ['2'])) 
          ],
        ),
      ),
    );
  }
}
