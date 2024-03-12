<<<<<<< HEAD
=======
// import 'package:android_id/android_id.dart';
>>>>>>> refs/remotes/origin/master
import 'package:http/http.dart' as http;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:test/core/shared/secure_storage.dart';

class TestService {
  Future getTestResults() async {
    final Uri _apiUrl = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var res = await http.get(_apiUrl);
    return res;
  }

  Future getDeviceInfo() async {
    final info = DeviceInfoPlugin();
    // final androidInfo = await info.androidInfo;
    print(await info.iosInfo);
    print(await PlatformDeviceId.getDeviceId);
    // SecureStorageManager.instance.setStorage('deneme', 'ilk değer');
    print(await SecureStorageManager.instance.getStorage('deneme'));
    // print(androidInfo);

    // const _androidIdPlugin = AndroidId();

    // final String? androidId = await _androidIdPlugin.getId();
    // print(androidId);
  }
}
