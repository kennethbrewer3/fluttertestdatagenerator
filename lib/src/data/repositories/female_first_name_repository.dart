import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_data_generator/src/data/loaders/json_loader.dart';

class FemaleFirstNameRepository {
  List<String>? _femaleFirstNames;

  Future<List<String>?> getFemaleFirstNameList() async {
    _femaleFirstNames ??= await loadStringListFromJson("assets/json/female_first_names.json");
    return _femaleFirstNames;
  }
}

final femaleFirstNameRepositoryProvider = Provider<FemaleFirstNameRepository>((ref) {
  return FemaleFirstNameRepository();
});

final femaleFirstNameListFutureProvider = FutureProvider<List<String>?>((ref)  {
  final femaleFirstNameRepository = ref.watch(femaleFirstNameRepositoryProvider);
  return femaleFirstNameRepository.getFemaleFirstNameList();
});