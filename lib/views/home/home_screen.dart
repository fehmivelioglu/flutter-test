import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test/core/extension/device_size_extension.dart';
import 'package:test/core/provider.dart';
import 'package:test/views/bloc/bloc_screen.dart';
import 'package:test/views/lazy-loading/lazyload_screen.dart';
import 'package:test/views/webview_request/webview_request_screen.dart';

import '../../core/service/test_service.dart';
import '../bloc/cubit.dart';
import '../easy-localization/easylocalization_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TestService _service = TestService();
    _service.getDeviceInfo();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Uygulaması'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(Provider.of<BasketProvider>(context).basket.toString()),
          TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider(
                          create: (_) => CounterCubit(),
                          child: const BlocTestScreen()))),
              child: const Text('Cubit')),
          TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WebViewRequestScreen())),
              child: const Text('Webview Request')),
          TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LazyLoadingScreen())),
              child: const Text('LazyLoad')),
          TextButton.icon(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EasyLocalizationScreen())),
              icon: const Icon(Icons.language),
              label: const Text('Easy Localization')),
          DataTable(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(10.0),
                ),
                color: Colors.grey[350],
              ),
              border: TableBorder.symmetric(
                  inside: const BorderSide(color: Colors.black)),
              headingRowColor: MaterialStateProperty.all(Colors.grey),
              columns: [
                DataColumn(
                    label: SizedBox(
                  child: const Text(
                    'AY',
                    textAlign: TextAlign.center,
                  ),
                  width: context.width / 3 - 110,
                )),
                DataColumn(
                    label: SizedBox(
                  child: const Text('SATILAN ÜRÜN\n ADEDİ',
                      textAlign: TextAlign.center, softWrap: true),
                  width: context.width / 3 - 50,
                )),
                DataColumn(
                    label: Container(
                  color: Colors.red,
                  child: const Text('TOPLAM SATIŞ',
                      textAlign: TextAlign.center, softWrap: true),
                  width: context.width / 3 - 50,
                )),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('#100', textAlign: TextAlign.center)),
                  DataCell(Text('Flutter Basics', textAlign: TextAlign.center)),
                  DataCell(Text('David John', textAlign: TextAlign.center))
                ]),
                DataRow(cells: [
                  DataCell(Text('#101', textAlign: TextAlign.center)),
                  DataCell(Text('Dart Internals', textAlign: TextAlign.center)),
                  DataCell(Text('Alex Wick', textAlign: TextAlign.center))
                ])
              ])
        ],
      )),
    );
  }
}
