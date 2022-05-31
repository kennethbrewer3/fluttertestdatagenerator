import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_data_generator/src/data/loaders/json_loader.dart';

class StreetNameRepository {
  List<String>? _streetNames;

  Future<List<String>?> getStreetNameList() async {
    _streetNames ??= await loadStringListFromJson("assets/json/us_commonstreetnames.json");
    return _streetNames;
  }
}

final streetNameRepositoryProvider = Provider<StreetNameRepository>((ref) {
  return StreetNameRepository();
});

final streetNameListFutureProvider = FutureProvider<List<String>?>((ref)  {
  final streetNameRepository = ref.watch(streetNameRepositoryProvider);
  return streetNameRepository.getStreetNameList();
});