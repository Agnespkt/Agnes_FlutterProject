import 'package:http/http.dart' as http;
import 'carparks.dart';

class HttpService {
  static const String url =
      'http://datamall2.mytransport.sg/ltaodataservice/EstTravelTimes';
  static Future<List<Value>> getCarparks() async {
    try {
      final response = await http.get(url, headers: {
        'AccountKey': 'LqQNJETiTdGDAAYy66worw==',
        'accept': 'application/json'
      });
      if (response.statusCode == 200) {
        final Welcome cp = welcomeFromJson(response.body);
        return cp.value;
      } else {
        return List<Value>();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return List<Value>();
    }
  }
}
