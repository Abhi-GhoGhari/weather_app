import 'package:weather_app/headers.dart';
import 'package:weather_app/view/screen/pages/home_page/home_page.dart';
import 'package:weather_app/view/screen/pages/splash_screen/splash_screen.dart';

class AppRoute {
  // static String splashscreen = "/";
  static String homepage = "/";

  static Map<String, WidgetBuilder> routes = {
    // splashscreen: (context) => const SplashScreen(),
    homepage: (context) => HomePage(),
  };
}
