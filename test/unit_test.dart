import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:test/core/service/test_service.dart';

enum SharedKeys { ssl, fcmToken }

void main() {
  late TestService testService;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testService = TestService();
  });
  test('Api test', () async {
    var res = await testService.getTestResults();
    var check = (json.decode(res.body) as List).isNotEmpty;
    expect(check, true);
  });

  test('Final initialize test', () {
    final map = {};
    map['platform'] = 'merhaba';
    final List list = [];
    list.add('1');
    list.add('1');
    list.add('1');
    print(map);
    print(list);
  });

  test('try catch', () async {});

  test('enum', () {
    var x;
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
}

class BasicShared {
  String variable = '1998';
  String get deger => variable;

  set deger(String? value) {
    variable = 'merhabalr';
  }
}
