import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class ApiOSRM {
  Future<List<LatLng>?> getRoutes(
      String longini, String latini, String longend, String latend) async {
    List<LatLng> routepoints = [];
    var url = Uri.parse(
        'https://router.project-osrm.org/route/v1/driving/$longini,$latini;$longend,$latend?geometries=geojson');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var routeData =
          jsonDecode(response.body)["routes"][0]["geometry"]["coordinates"];
      for (var point in routeData) {
        double longitude = point[0];
        double latitude = point[1];
        routepoints.add(LatLng(latitude, longitude));
      }
      return routepoints;
    } else {
      print(
          'Error: Failed to fetch route data. Status code: ${response.statusCode}');
      return null;
    }
  }
}
