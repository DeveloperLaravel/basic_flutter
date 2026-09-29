import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_new/name/presentation/bloc/name_bloc.dart';
import 'package:home_new/name/presentation/pages/name_bloc_page.dart';
import 'package:isar/isar.dart';

import 'core/theme/app_theme.dart';
import 'name/data/datasource/name_local_datasource.dart';
import 'name/data/models/name_model.dart';
import 'name/data/repository/name_repository_impl.dart';
import 'name/domain/usecases/add_name_usecase.dart';
import 'name/domain/usecases/delete_name_usecase.dart';
import 'name/domain/usecases/get_names_usecase.dart';
import 'name/domain/usecases/update_name_usecase.dart';
import 'package:path_provider/path_provider.dart';

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
      title: 'Flutter Demo',
      
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


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.press, required this.isDark, required this.addNameUsecase, required this.getNamesUsecase, required this.deleteNameUsecase, required this.updateNameUsecase});
  final VoidCallback press;
  final bool isDark;
  final AddNameUsecase addNameUsecase;
  final GetNamesUsecase getNamesUsecase;
  final UpdateNameUsecase updateNameUsecase;
  final DeleteNameUsecase deleteNameUsecase;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBar(
        
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('الاسماء',style: TextStyle(color: Theme.of(context).colorScheme.primary),),
        actions: [
          IconButton(onPressed: press, icon: Icon(
            isDark ?
            Icons.dark_mode 
            :  Icons.light_mode ,
            ))
        ],
      ),
      body: 
      BlocProvider(create: (_)=>NameBloc(addNameUsecase: addNameUsecase, getNamesUsecase: getNamesUsecase, deleteNameUsecase: deleteNameUsecase, updateNameUsecase: updateNameUsecase),
      child:  NameBlocPage(),)
      
// const  NamePage(),
        
   
    );
  }
}
