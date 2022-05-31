import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_data_generator/src/data/entities/entities.dart';
import 'package:test_data_generator/src/data/loaders/json_loader.dart';

class CityRepository {
  List<UsCity>? _cities;

  Future<List<UsCity>?> getCityList() async {
    _cities ??= await loadUsCitiesListFromJson("assets/json/us_cities.json");
    return _cities;
  }
}

final cityRepositoryProvider = Provider<CityRepository>((ref) {
  return CityRepository();
});

final cityListFutureProvider = FutureProvider<List<UsCity>?>((ref)  {
  final cityRepository = ref.watch(cityRepositoryProvider);
  return cityRepository.getCityList();
});