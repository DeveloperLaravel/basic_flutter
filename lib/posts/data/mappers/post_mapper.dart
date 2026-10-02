import '../../domain/entities/post_entity.dart';
import '../models/post_model.dart';

extension PostMapper on PostModel{
  PostEntity toEntity(){
    return PostEntity(id: id, title: title, body: body);
    
  }

}