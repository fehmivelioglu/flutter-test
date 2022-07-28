import 'package:flutter/material.dart';
import 'package:test/core/extension/device_size_extension.dart';

import '../easy-localization/easylocalization_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Uygulaması'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
