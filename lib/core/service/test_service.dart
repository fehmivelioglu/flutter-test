import 'package:http/http.dart' as http;
import 'package:device_info_plus/device_info_plus.dart';

class TestService {
  Future getTestResults() async {
    final Uri _apiUrl = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var res = await http.get(_apiUrl);
    return res;
  }

  Future getDeviceInfo() async {
    final info = DeviceInfoPlugin();
    final androidInfo = await info.androidInfo;
    // print(await info.iosInfo);
    print(androidInfo);
  }
}
