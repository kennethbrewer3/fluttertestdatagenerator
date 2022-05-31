import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_data_generator/src/data/loaders/json_loader.dart';

class StreetDesignationRepository {
  List<String>? _streetDesignations;

  Future<List<String>?> getStreetDesignationList() async {
    _streetDesignations ??= await loadStringListFromJson("assets/json/us_commonstreetdesignations.json");
    return _streetDesignations;
  }
}

final streetDesignationRepositoryProvider = Provider<StreetDesignationRepository>((ref) {
  return StreetDesignationRepository();
});

final streetDesignationListFutureProvider = FutureProvider<List<String>?>((ref)  {
  final streetDesignationRepository = ref.watch(streetDesignationRepositoryProvider);
  return streetDesignationRepository.getStreetDesignationList();
});