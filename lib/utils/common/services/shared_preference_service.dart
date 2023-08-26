import 'dart:convert';

import 'package:jokes_app/home/network/model/response/jokes_res_model.dart';
import 'package:jokes_app/utils/app_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  //TAG
  final tag = "SHARED_PREFERENCE_SERVICE";

  late SharedPreferences _prefs;

  Function get clearAllData => _clearAllData;

  Future<bool> getSharedPreferencesInstance() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      return true;
    } catch (e) {
      return false;
    }
  }

  List<JokesResModel> getJokesList() {
    String? pref = _prefs.getString("joke_list");
    if (pref != null) {
      // convert string data to jsonMap
      var jsonMap = json.decode(pref);
      AppLogger.printLog('getJokesList -- ${jsonMap}');

// convert json map list to object model lis
      List<JokesResModel> sampleListFromPreferance = List<JokesResModel>.from(
          jsonMap.map((x) => JokesResModel.fromJson(x)));
      return sampleListFromPreferance;
    } else {
      return [];
    }
  }

  Future setJokesList({List<JokesResModel>? jokesList}) async {
    String? listJson = json.encode(jokesList);
    await _prefs.setString('joke_list', listJson);
  }

  Future _clearAllData() async {
    await _prefs.clear();
  }
}

final SharedPreferenceService sharedPreferenceService =
    SharedPreferenceService();
