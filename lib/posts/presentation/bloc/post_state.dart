import '../../domain/entities/post_entity.dart';

abstract class PostState {}
class PostLoading extends PostState {}

class PostSuccess extends PostState {
  final List<PostEntity> posts;

  PostSuccess(this.posts);
}
class PostError extends PostState {
  final String message;

  PostError(this.message);
}