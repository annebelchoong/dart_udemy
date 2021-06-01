import 'dart:io';

import 'weather_api_client.dart';

Future<void> main(List<String> arguments) async {
  // defensive code to check that the input must have
  if (arguments.length != 1) {
    print('Syntax: dart bin/main.dart <city>');
    return;
  }
  final city = arguments.first;
  final api = WeatherApiClient();
  try {
    final weather = await api.getWeather(city);
    print(weather);
  } on WeatherApiException catch (e) {
    print(e.message);
    // Use _ when don't intend to use the argument
    // SocketException is to handle error when offline
  } on SocketException catch (_) {
    print('Could not fetch data. Check your connection');
  } catch (e) {
    // fallback to catch all the error besides WeatherApiException and SocketException
    print(e);
  }
}
