import '../entities/name_entity.dart';

abstract class NameRepository {
  Future<void> add(NameEntity name);

  Future<List<NameEntity>> getAll();

  Future<void> update(NameEntity name);

  Future<void> delete(int id);
}