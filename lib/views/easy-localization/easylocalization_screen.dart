import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ssl_pinning_plugin/ssl_pinning_plugin.dart';

import 'package:test/core/extension/lang_extension.dart';
import 'package:test/core/extension/locale_keys.g.dart';
import 'package:test/core/extension/locale_keys_help.g.dart';

class EasyLocalizationScreen extends StatefulWidget {
  const EasyLocalizationScreen({super.key});

  @override
  State<EasyLocalizationScreen> createState() => _EasyLocalizationScreenState();
}

class _EasyLocalizationScreenState extends State<EasyLocalizationScreen> {
  Future<dynamic> getData() async {
    // var res = await http.get(Uri.parse('http://192.168.1.101/php/nk_v2/deneme.php'));
    const url = 'https://www.fehmivelioglu.com';
    const allowedSHA = [
      'CA 3B 3B CE 05 27 6D BC 7D A9 BC 80 D0 C2 0B D3 3A 38 AB 91',
    ];
    await SslPinningPlugin.check(
      serverURL: url,
      headerHttp: <String, String>{},
      sha: SHA.SHA1,
      allowedSHAFingerprints: allowedSHA,
      timeout: 50,
    ).then(print);
    // print(res.body);
  }

  Future<dynamic> getDataWithDio() async {
    //    SecureHttpClient getClient(List<String> allowedSHAFingerprints){
    //     final secureClient = SecureHttpClient.build(certificateSHA256Fingerprints);
    //     return secureClient;
    // }

    // myRepositoryMethod(){
    //   secureClient.get("myurl.com");
    // }
    try {
      // ignore: inference_failure_on_function_invocation
      final response = await Dio().get('http://www.google.com');
      print(response.data);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    // getData();
    getDataWithDio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        if (context.locale.toString().substring(0, 2) == 'en') {
          await context.setLocale(const Locale('tr', 'TR'));
        } else {
          await context.setLocale(const Locale('en', 'US'));
        }
      },),
      appBar: AppBar(title: const Text('Easy localization')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(LocaleKeys.merhaba.locale),
            Text(LocaleKeysHelp.nasilsin.locale),
            Text(LocaleKeys.gender.tr(gender: 'male')),
            Text(LocaleKeys.sayi.tr(args: ['2'])),
          ],
        ),
      ),
    );
  }
}
