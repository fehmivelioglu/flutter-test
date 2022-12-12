import 'package:flutter/material.dart';

class LazyLoadingScreen extends StatefulWidget {
  const LazyLoadingScreen({Key? key}) : super(key: key);

  @override
  State<LazyLoadingScreen> createState() => _LazyLoadingScreenState();
}

class _LazyLoadingScreenState extends State<LazyLoadingScreen> {
  late ScrollController _scrollController;
  final GlobalKey _globalKey = GlobalKey();
  int index = 3;

  @override
  void initState() {
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      print(_scrollController.position.extentAfter);
      if (_scrollController.position.maxScrollExtent == 0) {}
      print('Amount: '+(MediaQuery.of(context).size.height / 200 + 1).toString());
      // print(MediaQuery.of(context).size.height /
      //     _scrollController.position.viewportDimension);
    });
    _scrollController.addListener(() {
      print(_scrollController.position.extentAfter);
      // print(_scrollController.offset);
      // print(_scrollController.position.maxScrollExtent);
      if (_scrollController.position.extentAfter == 0) {
        print('get new items');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Lazy Loading Example'),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        key: _globalKey,
        child: Column(
          children: [
            Container(
              color: Colors.red,
              height: 200,
            ),
            if (index > 0)
              Container(
                color: Colors.blue,
                height: 200,
              ),
            if (index > 1)
              Container(
                color: Colors.yellow,
                height: 200,
              ),
            if (index > 2)
              Container(
                color: Colors.green,
                height: 200,
              ),
            if (index > 3)
              Container(
                color: Colors.pink,
                height: 200,
              ),
          ],
        ),
      ),
    );
  }
}
