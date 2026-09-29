import 'package:home_new/name/data/models/name_model.dart';
import 'package:isar/isar.dart';

class NameLocalDatasource {
  final Isar isar;
  NameLocalDatasource({
    required this.isar,
  });
  Future<void> addName(NameModel model) async{
    await isar.writeTxn(() async{
      await isar.nameModels.put(model);

    });
  }
  
  Future<List<NameModel>> getAll() async {
  return await isar.nameModels.where().findAll();
}
Future<void> updateName(NameModel model) async {
  await isar.writeTxn(() async{
      await isar.nameModels.put(model);

    });

}
Future<void> deleteName(int id) async {
  await isar.writeTxn(() async {
    await isar.nameModels.delete(id);
  });
}
}
