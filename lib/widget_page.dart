import 'package:flutter/material.dart';

import 'posts/data/data/post_api_service.dart';
import 'posts/data/models/post_model.dart';


class WidgetPage extends StatefulWidget {
  const WidgetPage({super.key});

  @override
  State<WidgetPage> createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
final PostApiService api = PostApiService();
  @override
  Widget build(BuildContext context) {
    final posts =api.getPosts();
    return  Scaffold(
      body: FutureBuilder<List<PostModel>>(
  future: posts,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

if (snapshot.hasError) {
  return Center(
    child: Text('حدث خطأ: ${snapshot.error}'),
  );
}
    return ListView.builder(
  itemCount: snapshot.data!.length,
  itemBuilder: (context, index) {
    return PostCard(
      post: snapshot.data![index],
    );
  },
);
  },
),

    );
  }
}


class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post,});
  final PostModel  post;
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
                                 Text(
                                  post.body
                                  ,
                                  style: Theme.of(context).textTheme.bodyLarge,),
                                   SizedBox(height: 7,),
                                 ElevatedButton(onPressed: (){}, child: Text('قراءة المزيد'))
                            ],
                                ),
                        ),
                    ),
                  ),
    );
  }
}