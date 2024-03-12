import 'package:flutter/material.dart';
import 'package:flash/flash.dart';
import 'package:provider/provider.dart';
import 'package:test/core/provider.dart';

class FlashDialogView extends StatelessWidget {
  const FlashDialogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _showTopFlash({FlashBehavior style = FlashBehavior.floating}) {
      showFlash(
        context: context,
        duration: const Duration(seconds: 2),
        persistent: true,
        builder: (_, controller) {
          return Flash(
            controller: controller,
            backgroundColor: Colors.white,
            brightness: Brightness.light,
            boxShadows: const [BoxShadow(blurRadius: 4)],
            barrierBlur: 3.0,
            barrierColor: Colors.black38,
            barrierDismissible: true,
            behavior: style,
            position: FlashPosition.top,
            child: FlashBar(
              title: const Text('Title'),
              content: const Text('Hello world!'),
              showProgressIndicator: true,
              primaryAction: TextButton(
                onPressed: () => controller.dismiss(),
                child: const Text('DISMISS', style: TextStyle(color: Colors.amber)),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flash-Bar'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Provider.of<BasketProvider>(context,listen: false).refreshBasket();
        _showTopFlash();
      }),
    );
  }
}
