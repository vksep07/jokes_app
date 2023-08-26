

import 'package:jokes_app/utils/common/routes/routes.dart';
import 'package:jokes_app/utils/common/services/navigation_service.dart';

class SplashBloc {
  redirectToHomeScreen() {
    Future.delayed(const Duration(seconds: 3), () async {
     appNavigationService.pushReplacementNamed(Routes.home_screen);
    });
  }
}

final splashBloc = SplashBloc();
