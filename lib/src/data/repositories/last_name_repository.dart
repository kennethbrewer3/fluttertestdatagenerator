import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_data_generator/src/data/loaders/json_loader.dart';

class LastNameRepository {
  List<String>? _lastNames;

  Future<List<String>?> getLastNameList() async {
    _lastNames ??= await loadStringListFromJson("assets/json/last_names.json");
    return _lastNames;
  }
}

final lastNameRepositoryProvider = Provider<LastNameRepository>((ref) {
  return LastNameRepository();
});

final lastNameListFutureProvider = FutureProvider<List<String>?>((ref)  {
  final lastNameRepository = ref.watch(lastNameRepositoryProvider);
  return lastNameRepository.getLastNameList();
});