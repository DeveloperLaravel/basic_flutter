import 'package:home_new/name/domain/repositories/name_repository.dart';

import '../entities/name_entity.dart';

class AddNameUsecase {
  final NameRepository repository; 
  AddNameUsecase({
    required this.repository,
  });
  Future<void> execute(NameEntity name) async {
  await repository.add(name);
}
  
}
