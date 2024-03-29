import 'package:flutter/material.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Merhaba'),
      ),
      body: Container(
        // color: Colors.red,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(5),),
              child: const Row(
                children: [
                  Expanded(child: Center(child: Text('1.sutun'))),
                  Expanded(child: Center(child: Text('2.sutun uzun'))),
                  Expanded(child: Center(child: Text('3.sutun'))),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    rowContainer(Colors.white),
                    rowContainer(Colors.grey[100]),
                    rowContainer(Colors.white),
                    rowContainer(Colors.grey[100]),
                    rowContainer(Colors.white),
                    if (index == 1)
                      Column(
                        children: [
                          rowContainer(Colors.grey[100]),
                          rowContainer(Colors.white),
                          rowContainer(Colors.grey[100]),
                          rowContainer(Colors.white),
                          rowContainer(Colors.grey[100]),
                          rowContainer(Colors.white),
                          rowContainer(Colors.grey[100]),
                          rowContainer(Colors.white),
                          rowContainer(Colors.grey[100]),
                          rowContainer(Colors.white),
                          rowContainer(Colors.grey[100]),
                        ],
                      ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 18,),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5),),
                      child: const Row(
                        children: [
                          Expanded(child: Center(child: Text('1.sutun'))),
                          Expanded(child: Center(child: Text('2.sutun uzun'))),
                          Expanded(child: Center(child: Text('3.sutun'))),
                        ],
                      ),
                    ),
                    if (index == 0)
                      TextButton(
                          onPressed: () {
                            setState(() {
                              index++;
                            });
                          },
                          child: const Text('Eylül ayı ve öncesi'),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container rowContainer(Color? color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
      color: color,
      child: const Row(
        children: [
          Expanded(child: Center(child: Text('1.sutun'))),
          Expanded(child: Center(child: Text('2.sutun uzun'))),
          Expanded(child: Center(child: SelectableText('3.sutun'))),
        ],
      ),
    );
  }
}
