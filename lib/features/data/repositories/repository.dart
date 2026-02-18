import 'dart:convert';
import 'package:fixed_assets_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/history_asset.dart';
import '../models/model/asset.dart';
import '../models/response/item_details_reponse.dart';

class Repository {

  static Future<List<Asset>> getItems() async {
    final assetDao = HistoryAsset();

    // Get all
    return await assetDao.getAssets();
  }

  static Future<void> saveItem(Asset item) async {
    final assetDao = HistoryAsset();

    // Insert
    await assetDao.saveAsset(item);
  }

}
