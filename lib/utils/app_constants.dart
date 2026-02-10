import '../features/data/models/response/item_details_reponse.dart';

class AppConstants {
  static String ip = "192.168.87.34";
  static String baseUrl = 'http://$ip/fa/';
  //static String baseUrl = 'http://localhost/fa/';
  static String jwtToken = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJzdXJ2ZXlpbmciLCJhdWQiOiJ1c2VyIiwiaWF0IjoxNzE2Mjk5NDc4LCJuYmYiOjAsImV4cCI6MTcxODg5MTQ3OCwiZGF0YSI6eyJpZCI6IjEiLCJmaXJzdG5hbWUiOiJmaXJzdCB1c2VyIiwibGFzdG5hbWUiOiJzZWNvbmQgdXNlciIsImVtYWlsIjoiZW1haWwifX0.McRi1M_cZtXNvS2w0aNhC89f49bubAnfKQxtZXSFOXA';
  static List<Datum> historyItems = [];

  //user login
  static String firstname = "";
  static String lastname = "";
  static String email = "";
}