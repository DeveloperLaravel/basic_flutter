
import 'package:isar_community/isar.dart';

part 'name_model.g.dart';

@collection
class NameModel {
  Id id = Isar.autoIncrement;

  late String name;

  bool completed = false;

  bool isHidden = false;
}