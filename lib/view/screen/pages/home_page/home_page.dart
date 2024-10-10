import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/app_controller.dart';
import 'package:weather_app/globalclass.dart';
import 'package:weather_app/helper/app_helper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    WeatherapiController mutable = Provider.of<WeatherapiController>(context);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/summer.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SearchBar(
                    shadowColor: const WidgetStatePropertyAll(Colors.white38),
                    backgroundColor:
                        const WidgetStatePropertyAll(Colors.white54),
                    shape: const WidgetStatePropertyAll(StadiumBorder()),
                    leading: const Icon(Icons.search),
                    hintText: "Search",
                    onSubmitted: (val) async {
                      Global.instance.city6 = val;
                      await mutable.getWeather2();
                    },
                  ),
                  const SizedBox(height: 40),
                  GlassContainer(
                    height: size.height * 0.75,
                    width: size.width * 0.8,
                    blur: 10,
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white10,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        // Check if allweatherdata is not empty before accessing it
                        mutable.allweatherdata.isNotEmpty
                            ? SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                child: Column(
                                  children: [
                                    Text(
                                      mutable.allweatherdata[0]['name'],
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GlassContainer(
                                          height: 120,
                                          width: 120,
                                          blur: 30,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white38,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                const Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Temperature",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "${WeatherHelper.instance.weatherapi[1]['temp_c']} °C ",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        GlassContainer(
                                          height: 120,
                                          width: 120,
                                          color: Colors.white38,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          blur: 30,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                const Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Temperature (F)",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  '${WeatherHelper.instance.weatherapi[1]['temp_f']} °F',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GlassContainer(
                                          height: 120,
                                          width: 120,
                                          blur: 30,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white38,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                const Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "UV",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "${WeatherHelper.instance.weatherapi[1]['uv']}",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        GlassContainer(
                                          height: 120,
                                          width: 120,
                                          blur: 30,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white38,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                const Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Visibility",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "${WeatherHelper.instance.weatherapi[1]['vis_km']} Km",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GlassContainer(
                                          height: 120,
                                          width: 120,
                                          blur: 30,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white38,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                const Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Wind kph",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "${WeatherHelper.instance.weatherapi[1]['wind_kph']} km/h",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        GlassContainer(
                                          height: 120,
                                          width: 120,
                                          blur: 30,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white38,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                const Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Feelslike",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "${WeatherHelper.instance.weatherapi[1]['feelslike_c']} \u2103",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GlassContainer(
                                          height: 120,
                                          width: 120,
                                          blur: 30,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white38,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                const Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Humidity",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "${WeatherHelper.instance.weatherapi[1]['humidity']} %",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        GlassContainer(
                                          height: 120,
                                          width: 120,
                                          blur: 30,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white38,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                const Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Wind Direction",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "${WeatherHelper.instance.weatherapi[1]['wind_dir']}",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : const Text(
                                "Search City"), // Show loader or fallback when data is not available
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
