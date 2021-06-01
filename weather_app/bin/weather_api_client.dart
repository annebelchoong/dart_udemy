import 'dart:convert';

import 'package:http/http.dart' as http;

import 'weather.dart';

class WeatherApiException implements Exception {
  WeatherApiException(this.message);
  final String message;
}

class WeatherApiClient {
  // All api request should be make to one specific url that identifies the metadata api
  static const baseUrl = 'http://www.metaweather.com/api';

  Future<int> getLocationId(String city) async {
    // $baseUrl/location/search/ -> location search endpoint
    // ?query=$city -> sending request (query parameters) for the city that we are looking for
    // Uri.parse -> converting this string literal into a uri object which will be used to request with the http package
    final locationUrl = Uri.parse('$baseUrl/location/search/?query=$city');
    final locationResponse = await http.get(locationUrl);
    // 200 is the status code of when the client request is valid and able to fethc data
    if (locationResponse.statusCode != 200) {
      throw WeatherApiException('Error getting locationId for city: $city');
    }
    // take the response.body which is a string and convert it to an object that can extract data that we need
    final locationJson = jsonDecode(locationResponse.body) as List;
    // Do a check first to check whether the country got a not then throw and exception
    if (locationJson.isEmpty) {
      throw WeatherApiException('No location found for: $city');
    }
    // Since the locationJson is a list and inside is a map. Use.first to access the map and then from there use ['woeid'] to get the id
    // put as int because the return type is Future<int>
    return locationJson.first['woeid'] as int;
  }

  Future<Weather> fetchWeather(int locationId) async {
    final weatherUrl = Uri.parse('$baseUrl/location/$locationId');
    final weatherResponse = await http.get(weatherUrl);
    if (weatherResponse.statusCode != 200) {
      throw WeatherApiException(
          'Error getting weather for location: $locationId');
    }
    // print(weatherResponse.body);
    final weatherJson = jsonDecode(weatherResponse.body);
    final consolidatedWeather = weatherJson['consolidated_weather'] as List;
    // Add a check to chack if the first item is empty
    if (consolidatedWeather.isEmpty) {
      throw WeatherApiException(
          'Weather data not available for locationId: $locationId');
    }
    // For today weather. first item in the map
    return Weather.fromJson(consolidatedWeather[0]);
  }

  // Combining the getLocationId and fetchWeather to one function
  Future<Weather> getWeather(String city) async {
    final locationId = await getLocationId(city);
    return fetchWeather(locationId);
  }
}
