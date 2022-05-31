import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_data_generator/src/data/loaders/json_loader.dart';

class DomainNameRepository {
  List<String>? _domainNames;

  Future<List<String>?> getDomainNameList() async {
    _domainNames ??= await loadStringListFromJson("assets/json/domain_names.json");
    return _domainNames;
  }
}

final domainNameRepositoryProvider = Provider<DomainNameRepository>((ref) {
  return DomainNameRepository();
});

final domainNameListFutureProvider = FutureProvider<List<String>?>((ref)  {
  final domainNameRepository = ref.watch(domainNameRepositoryProvider);
  return domainNameRepository.getDomainNameList();
});