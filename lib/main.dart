import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_new/posts/domain/entities/post_entity.dart';
import 'package:isar_community/isar.dart';

import 'core/theme/app_theme.dart';
import 'name/data/datasource/name_local_datasource.dart';
import 'name/data/models/name_model.dart';
import 'name/data/repository/name_repository_impl.dart';
import 'name/domain/usecases/add_name_usecase.dart';
import 'name/domain/usecases/delete_name_usecase.dart';
import 'name/domain/usecases/get_names_usecase.dart';
import 'name/domain/usecases/update_name_usecase.dart';
import 'package:path_provider/path_provider.dart';

import 'posts/data/datasources/post_remote_data_source.dart';
import 'posts/data/repositories/post_repository_impl.dart';
import 'posts/domain/usecases/get_posts_use_case.dart';
import 'posts/presentation/bloc/post_bloc.dart';
import 'posts/presentation/bloc/post_event.dart';
import 'widget_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

 final dir = await getApplicationDocumentsDirectory();

  final isar = await Isar.open(
    [NameModelSchema], directory: dir.path, 
  );
// await isar.writeTxn(() async {
//   await isar.nameModels.clear();
// });
  final datasource = NameLocalDatasource(
    isar: isar,
  );
    final repository = NameRepositoryImpl(
    datasource: datasource,
  );
  final addNameUsecase = AddNameUsecase(
  repository: repository,
);
  final getNamesUsecase = GetNamesUsecase(
  repository: repository,
);
final updateNameUsecase = UpdateNameUsecase(
  repository: repository,
);
  final deleteNameUsecase = DeleteNameUsecase(
  repository: repository,
);

 
  runApp( MyApp(addNameUsecase: addNameUsecase, getNamesUsecase: getNamesUsecase, deleteNameUsecase: deleteNameUsecase, updateNameUsecase: updateNameUsecase,));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.addNameUsecase, required this.getNamesUsecase, required this.deleteNameUsecase, required this.updateNameUsecase});
  final AddNameUsecase addNameUsecase;
  final GetNamesUsecase getNamesUsecase;
  final UpdateNameUsecase updateNameUsecase;
  final   DeleteNameUsecase deleteNameUsecase;
  

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = true;
  void changeTheme(){
    setState(() {
      isDark =! isDark;
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
    theme: AppTheme.lightTheme,
    darkTheme: AppTheme.darkTheme,
    themeMode: isDark
      ?  ThemeMode.light : 
         ThemeMode.dark,
      home: 
      
        MyHomePage(press: changeTheme, isDark: isDark,  addNameUsecase: widget.addNameUsecase, getNamesUsecase: widget.getNamesUsecase, deleteNameUsecase: widget.deleteNameUsecase, updateNameUsecase: widget.updateNameUsecase,),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.press, required this.isDark, required this.addNameUsecase, required this.getNamesUsecase, required this.deleteNameUsecase, required this.updateNameUsecase});
  final VoidCallback press;
  final bool isDark;
  final AddNameUsecase addNameUsecase;
  final GetNamesUsecase getNamesUsecase;
  final UpdateNameUsecase updateNameUsecase;
  final DeleteNameUsecase deleteNameUsecase;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PostEntity> post=[

  ];
   int index = 0;
 

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('الاسماء',style: TextStyle(color: Theme.of(context).colorScheme.primary),),
        actions: [
          IconButton(onPressed: widget.press, icon: Icon(
            widget.isDark ?
            Icons.dark_mode 
            :  Icons.light_mode ,
            ))
        ],
      ),
      body: 
      // WidgetPage(),


      BlocProvider(
  create: (context) => PostBloc( GetPostsUseCase(
    PostRepositoryImpl(
      PostRemoteDataSource(),
    ),
  ),)..add(LoadPosts()),
  child: WidgetPage(),
)
      // BlocProvider(create: (_)=>NameBloc(addNameUsecase: addNameUsecase, getNamesUsecase: getNamesUsecase, deleteNameUsecase: deleteNameUsecase, updateNameUsecase: updateNameUsecase),
      // child:  NameBlocPage(),)
      
// const  NamePage(),
        
   
    );
  }
}
