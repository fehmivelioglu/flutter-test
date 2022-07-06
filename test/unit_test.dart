import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:test/core/service/test_service.dart';


void main() {
  late TestService testService;

  setUp(() {
    testService = TestService();
  });
  test('Api test', () async{
    var res = await testService.getTestResults();
    var check = (json.decode(res.body) as List).isNotEmpty;
    expect(check, true);
  }); 
}
