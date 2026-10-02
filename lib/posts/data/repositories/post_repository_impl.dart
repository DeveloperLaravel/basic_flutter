import 'package:home_new/posts/domain/entities/post_entity.dart';

import '../../domain/repositories/post_repository.dart';
import '../datasources/post_remote_data_source.dart';
import '../mappers/post_mapper.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  PostRepositoryImpl(this.remoteDataSource);
  @override
  Future<List<PostEntity>> getPosts() async {
   final models = await remoteDataSource.getPosts();
   final entities = models.map((model) {
  return model.toEntity();
}).toList();
return entities;
  }

}