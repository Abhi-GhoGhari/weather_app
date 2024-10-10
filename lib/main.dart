import 'package:provider/provider.dart';
import 'package:weather_app/controller/app_controller.dart';

import 'headers.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherapiController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
