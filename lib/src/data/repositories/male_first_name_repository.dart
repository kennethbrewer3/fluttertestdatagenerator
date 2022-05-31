import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_data_generator/src/data/loaders/json_loader.dart';

class MaleFirstNameRepository {
  List<String>? _maleFirstNames;

  Future<List<String>?> getMaleFirstNameList() async {
    _maleFirstNames ??= await loadStringListFromJson("assets/json/male_first_names.json");
    return _maleFirstNames;
  }
}

final maleFirstNameRepositoryProvider = Provider<MaleFirstNameRepository>((ref) {
  return MaleFirstNameRepository();
});

final maleFirstNameListFutureProvider = FutureProvider<List<String>?>((ref)  {
  final maleFirstNameRepository = ref.watch(maleFirstNameRepositoryProvider);
  return maleFirstNameRepository.getMaleFirstNameList();
});
