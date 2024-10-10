import 'package:weather_app/headers.dart';
import 'package:weather_app/helper/app_helper.dart';

Widget airPresureGrid({required Size size}) => Container(
      height: size.height * 0.18,
      width: size.width * 0.43,
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.15),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.air),
            const Text(
              "Air Pressure",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "${WeatherHelper.instance.weatherapi[1]['pressure_mb']} Md",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
