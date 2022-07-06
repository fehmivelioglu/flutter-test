import 'package:http/http.dart' as http;

class TestService {
  Future getTestResults() async {
    final Uri _apiUrl = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var res = await http.get(_apiUrl);
    return res;
  }
}
