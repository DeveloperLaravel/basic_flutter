import 'package:bloc/bloc.dart';

import '../../domain/usecases/get_posts_use_case.dart';
import 'post_event.dart';
import 'post_state.dart';


class PostBloc extends Bloc<PostEvent, PostState> {
final GetPostsUseCase useCase;
  PostBloc(this.useCase) : super(PostLoading()) {
    on<LoadPosts>((event, emit)async  {
      emit(PostLoading());

       try {
    final posts = await useCase.getPosts();

    emit(PostSuccess(posts));
  }catch (e) {
  emit(PostError(e.toString()));
}

    });
  }
}
