import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ssl_pinning_plugin/ssl_pinning_plugin.dart';

import '../../core/extension/lang_extension.dart';
import '../../core/extension/locale_keys.g.dart';
import '../../core/extension/locale_keys_help.g.dart';

class EasyLocalizationScreen extends StatefulWidget {
  const EasyLocalizationScreen({Key? key}) : super(key: key);

  @override
  State<EasyLocalizationScreen> createState() => _EasyLocalizationScreenState();
}

class _EasyLocalizationScreenState extends State<EasyLocalizationScreen> {
  Future getData() async {
    // var res = await http.get(Uri.parse('http://192.168.1.101/php/nk_v2/deneme.php'));
    var url = 'https://www.fehmivelioglu.com';
    var allowedSHA = [
      'CA 3B 3B CE 05 27 6D BC 7D A9 BC 80 D0 C2 0B D3 3A 38 AB 91'
    ];
    await SslPinningPlugin.check(
            serverURL: url,
            httpMethod: HttpMethod.Get,
            headerHttp: Map(),
            sha: SHA.SHA1,
            allowedSHAFingerprints: allowedSHA,
            timeout: 50)
        .then((value) => print(value));
    // print(res.body);
  }

  Future getDataWithDio() async {
  //    SecureHttpClient getClient(List<String> allowedSHAFingerprints){
  //     final secureClient = SecureHttpClient.build(certificateSHA256Fingerprints);
  //     return secureClient;
  // }

  // myRepositoryMethod(){ 
  //   secureClient.get("myurl.com");
  // }    
    try {
      var response = await Dio().get('http://www.google.com');
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
