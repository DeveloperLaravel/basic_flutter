import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_new/posts/domain/entities/post_entity.dart';

import 'posts/presentation/bloc/post_bloc.dart';
import 'posts/presentation/bloc/post_state.dart';


class WidgetPage extends StatefulWidget {
  const WidgetPage({super.key});

  @override
  State<WidgetPage> createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocBuilder<PostBloc, PostState>(
  builder: (context, state) {
  if (state is PostLoading) {
  return CircularProgressIndicator();
}

if (state is PostSuccess) {
    return ListView.builder(
  itemCount: state.posts.length,
  itemBuilder: (context, index) {
    return PostCard(
      post: state.posts[index],
    );
  },
);
}
            if (state is PostError) {
            return Center(
              child: Text(state.message),
            );
          }
      return const SizedBox();

  },
  
),

    );
  }
}


class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post,});
  final PostEntity  post;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            // border: Border.all()
            borderRadius: BorderRadius.circular(20)
          ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                   child: 
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                 post.title
                                ,style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              SizedBox(height: 7,),
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Text(
                                    post.body
                                    ,maxLines: 
                                    // isExpanded 
                                    // ? 9
                                    // : 
                                    2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.bodyLarge,),
                                 ),
                                   SizedBox(height: 7,),
                                 ElevatedButton(onPressed:(){}, child: Text( 
                                  // isExpanded ? 
                                  // 'عرض أقل' 
                                  // :
                                   'قراءة المزيد',))
                            ],
                                ),
                        ),
                    ),
                  ),
    );
  }
}