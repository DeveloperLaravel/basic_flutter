import '../../domain/entities/name_entity.dart';
import '../../domain/repositories/name_repository.dart';
import '../datasource/name_local_datasource.dart';
import '../mappers/name_mapper.dart';

class NameRepositoryImpl implements NameRepository {
  // هنا لاحقًا نضع Isar
final NameLocalDatasource datasource;
  NameRepositoryImpl({
    required this.datasource,
  });
  @override
  Future<void> add(NameEntity name) async {
    // حفظ في Isar
     final model = name.toModel();
     await datasource.addName(model);
  }

  @override
  Future<List<NameEntity>> getAll() async {
    // جلب من Isar
     final models = await datasource.getAll();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> update(NameEntity name) async {
    // تعديل في Isar
    final model = name.toModel();
    await datasource.updateName(model);
  }

  @override
  Future<void> delete(int id) async {
    // حذف من Isar
    await datasource.deleteName(id);
  }
}
