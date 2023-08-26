import 'dart:convert';

import 'package:jokes_app/home/network/home_api_provider.dart';
import 'package:jokes_app/home/network/model/response/jokes_res_model.dart';
import 'package:jokes_app/utils/app_logger.dart';
import 'package:jokes_app/utils/common/network/service/status.dart';
import 'package:jokes_app/utils/common/services/navigation_service.dart';
import 'package:jokes_app/utils/common/services/shared_preference_service.dart';
import 'package:jokes_app/utils/common_widgets/custom_theme.dart';
import 'package:rxdart/rxdart.dart';

class HomeScreenBloc {
  bool? theme = false;
  List<JokesResModel> jokesList = [];
  BehaviorSubject<bool> _loadingController =
      BehaviorSubject<bool>.seeded(false);

  BehaviorSubject<bool> get loadingController => _loadingController;

  BehaviorSubject<List<JokesResModel>> _jokeListController =
      BehaviorSubject<List<JokesResModel>>.seeded([]);

  BehaviorSubject<List<JokesResModel>> get jokeConListtroller =>
      _jokeListController;

  void changeTheme(MyThemeKeys key) {
    CustomTheme.instanceOf(appNavigationService.currentContext)
        .changeTheme(key);
  }

  Future<void> fetchJokesPeriodically() async {
    jokesList = sharedPreferenceService.getJokesList();
    while (true) {
      await fetchJokeApi();
      if (jokesList.length > 10) {
        jokesList.removeAt(0);
      }
      await Future.delayed(Duration(minutes: 1));
    }
  }

  Future<void> fetchJokeApi() async {
    if (jokesList.isEmpty) {
      _loadingController.add(true);
    } else {
      _jokeListController.add(jokesList);
    }

    final resp = await HomeApiProvider().jokesApi();
    if (resp.status == ApiStatus.SUCCESS) {
      AppLogger.printLog(resp.data.toString());
      JokesResModel jokesResModel =
          JokesResModel.fromJson(json.decode(resp.data.toString()));
      jokesList.add(jokesResModel);
      sharedPreferenceService.setJokesList(jokesList: jokesList);
      sharedPreferenceService.getJokesList();
      _jokeListController.add(jokesList);
      _loadingController.add(false);
    }
  }
}

final homeScreenBloc = HomeScreenBloc();
