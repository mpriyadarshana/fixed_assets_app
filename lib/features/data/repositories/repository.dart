import 'dart:convert';
import 'package:fixed_assets_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/model/asset.dart';
import '../models/response/item_details_reponse.dart';

class Repository {
  static const String key = 'items';

  static Future<List<Asset>> getItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? itemsJson = prefs.getString(key);
    if (itemsJson == null) return [];
    List<dynamic> decoded = jsonDecode(itemsJson).reversed;
    return decoded.map((e) => Asset.fromJson(e)).toList();
  }

  static Future<void> saveItem(Asset item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Asset> items = AppConstants.historyItems;
    items.add(item);
    AppConstants.historyItems = items;

    String itemsJson = jsonEncode(items.map((e) => e.toJson()).toList());
    await prefs.setString(key, itemsJson);
  }

}
