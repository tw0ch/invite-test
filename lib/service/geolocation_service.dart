import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationService {
  String? _currentAddress;
  Position? _currentPosition;
  static final g = GeolocationService();

  Future<String?> getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) {
      return null;
    }
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      _currentPosition = position;
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      print(e);
      return null;
    });
    return _currentAddress;
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled. Please enable the services');
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      print(
          'Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }
    return true;
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      _currentAddress = '${place.street} ${place.subAdministrativeArea}';
    }).catchError((e) {
      print(e);
    });
  }
}
