import '../features/data/models/model/asset.dart';
import '../features/data/models/response/item_details_reponse.dart';

class AppConstants {
  static String ip = "";
  static String baseUrl = 'http://$ip/fa/';
  //static String baseUrl = 'http://localhost/fa/';
  static String jwtToken = '';
  static List<Asset> historyItems = [];

  //user login
  static String firstname = "";
  static String lastname = "";
  static String email = "";
}