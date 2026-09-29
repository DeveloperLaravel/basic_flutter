import 'package:home_new/name/domain/repositories/name_repository.dart';

import '../entities/name_entity.dart';

class GetNamesUsecase {
  final NameRepository repository;
  GetNamesUsecase({
    required this.repository,
  });
  Future<List<NameEntity>> execute() async {
  return await repository.getAll();
}
}
