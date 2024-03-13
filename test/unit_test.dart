import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

enum SharedKeys { ssl, fcmToken }

void main() {
  // late TestService testService;

  // setUp(() {
  //   TestWidgetsFlutterBinding.ensureInitialized();
  //   testService = TestService();
  // });
  // test('Api test', () async {
  //   var res = await testService.getTestResults();
  //   var check = (json.decode(res.body) as List).isNotEmpty;
  //   expect(check, true);
  // });

  test('Final initialize test', () {
    final map = <String, String>{};
    map['platform'] = 'merhaba';
    final list = <String>[];
    // list.add('1');
    // list.add('1');
    // list.add('1');
    print(map);
    print(list);
  });

  test('try catch', () async {});

  test('enum', () {
    final x = <String,String>{'merhaba': 'ss'};
    try {
      if (x['merhaba'] == 'sadjklas') {
        print('sdadsa');
      }
    } catch (e) {
      print('hata');
      rethrow;
    } finally {
      print('sss');
    }
  });

  test('setter', () {
    final share = BasicShared();
    print(share.deger);
    share.deger = '12321321321';
    print(share.deger);
  });

  test('List Types', () {
    // List list = [0, 1, 2, 3];
    // Map map = {
    //   0: ['index0'],
    //   1: 'index1'
    // };
    final  json = <String,String>{'ilk': 'son'};
    final encodedJson = jsonEncode(json);
    final jsonResponse = jsonDecode(encodedJson);
    print(jsonResponse.runtimeType);
  });

  test('super class', () {
    NormalClass();
  });
}

class BasicShared {
  String variable = '1998';
  String get deger => variable;

  set deger(String? value) {
    variable = 'merhabalr';
  }
}

class NormalClass extends ExtendedClass {
  NormalClass() : super(2) {
    print('normal constructor');
  }
}

class ExtendedClass {
  ExtendedClass(int parameter) {
    print(parameter);
  }
}
