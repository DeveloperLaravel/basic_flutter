import 'package:home_new/name/data/models/name_model.dart';
import 'package:isar_community/isar.dart';

class NameLocalDatasource {
  final Isar isar;
  NameLocalDatasource({
    required this.isar,
  });
  Future<void> addName(NameModel model) async{
      print('MODEL ID BEFORE PUT: ${model.id}');
  print('MODEL NAME BEFORE PUT: ${model.name}');
    await isar.writeTxn(() async{
      await isar.nameModels.put(model);
      // final newId = await isar.nameModels.put(model);
      // print('ID RETURNED FROM ISAR: $newId');
  //     final testModel = NameModel()
  // ..name = 'TEST';

// final newId = await isar.nameModels.put(testModel);

// print('TEST ID: $newId');

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
