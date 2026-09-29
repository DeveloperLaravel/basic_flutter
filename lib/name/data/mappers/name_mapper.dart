import 'package:home_new/name/domain/entities/name_entity.dart';

import '../models/name_model.dart';

extension NameModelMapper on NameModel{
NameEntity toEntity(){
  return NameEntity(id: id, name: name, completed: completed, isHidden: isHidden);

}
}

extension NameEntityMapper on NameEntity{
  NameModel toModel(){
    final model = NameModel()
    ..name = name
    ..completed = completed
    ..isHidden = isHidden;
    if (id != 0) {
      model.id = id;
    }

    return model;
  }
}