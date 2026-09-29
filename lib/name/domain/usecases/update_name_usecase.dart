import 'package:home_new/name/domain/repositories/name_repository.dart';

import '../entities/name_entity.dart';

class UpdateNameUsecase {
  final NameRepository repository;
  UpdateNameUsecase({
    required this.repository,
  });
  Future<void> execute(NameEntity name) async {
  await repository.update(name);
}

  
}
