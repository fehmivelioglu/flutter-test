import 'package:flutter/material.dart';

import '../easy-localization/easylocalization_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

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
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>const EasyLocalizationScreen())),
                icon: const Icon(Icons.language),
                label: const Text('Easy Localization'))
          ],
        )),
      );
  }
}