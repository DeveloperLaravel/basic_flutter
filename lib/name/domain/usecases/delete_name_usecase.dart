import 'package:home_new/name/domain/repositories/name_repository.dart';

class DeleteNameUsecase {
  final NameRepository repository;
  DeleteNameUsecase({
    required this.repository,
  });
  Future<void> execute(int id) async {
  await repository.delete(id);
}
  
}
