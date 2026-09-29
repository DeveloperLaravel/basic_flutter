import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:home_new/name/domain/usecases/add_name_usecase.dart';

import '../../domain/entities/name_entity.dart';
import '../../domain/usecases/delete_name_usecase.dart';
import '../../domain/usecases/get_names_usecase.dart';
import '../../domain/usecases/update_name_usecase.dart';
import 'name_event.dart';
import 'name_state.dart';

class NameBloc extends Bloc<NameEvent,NameState> {
  final AddNameUsecase addNameUsecase;
  final GetNamesUsecase getNamesUsecase;
  final UpdateNameUsecase updateNameUsecase;
  final DeleteNameUsecase deleteNameUsecase;
  NameBloc({
    required this.addNameUsecase,
    required this.getNamesUsecase,
    required this.deleteNameUsecase, required this.updateNameUsecase,
  }) : super( NameInitial()){
on<LoadNamesEvent>((event, emit) async {
 final names = await getNamesUsecase.execute();
  final nameList = names.map((e) => e.name).toList();
        final completedList = names.map((e) => e.completed).toList();
        final isHiddenList = names.map((e) => e.isHidden).toList();
        final idList = names.map((e) => e.id).toList();
        emit(
  NameState(
    id: idList,
    names: nameList,
    completed: completedList,
    isHidden: isHiddenList,
  ),
);
});

add(LoadNamesEvent());












on<StartEditEvent>((event, emit) async {
    print('EDIT INDEX: ${event.index}');
final name = state.names[event.index];
emit(
  NameState(
    id: state.id,
    names: state.names,
    completed: state.completed,
    isHidden: state.isHidden,
    editIndex: event.index,
    editName: name,
  ),
);

});


on<ToggleHiddenEvent>((event, emit) async {
final id = state.id[event.index];
  final isHidden = !state.isHidden[event.index];
 final name = NameEntity(
  id: id,
  name: state.names[event.index],
  completed:  state.completed[event.index],
  isHidden:isHidden,
);
await updateNameUsecase.execute(name);
final names = await getNamesUsecase.execute();

  final nameList = names.map((e) => e.name).toList();
        final completedList = names.map((e) => e.completed).toList();
        final isHiddenList = names.map((e) => e.isHidden).toList();
        final idList = names.map((e) => e.id).toList();
        emit(
  NameState(
    id: idList,
    names: nameList,
    completed: completedList,
    isHidden: isHiddenList,
  ),
);
});


on<ToggleCompleteEvent>((event, emit) async {
  final id = state.id[event.index];
  final completed = !state.completed[event.index];
  final name = NameEntity(
  id: id,
  name: state.names[event.index],
  completed: completed,
  isHidden: state.isHidden[event.index],
);
await updateNameUsecase.execute(name);
 final names = await getNamesUsecase.execute();

  final nameList = names.map((e) => e.name).toList();
        final completedList = names.map((e) => e.completed).toList();
        final isHiddenList = names.map((e) => e.isHidden).toList();
        final idList = names.map((e) => e.id).toList();
        emit(
  NameState(
    id: idList,
    names: nameList,
    completed: completedList,
    isHidden: isHiddenList,
  ),
);
});






on<UpdateNameEvent>((event, emit) async {
   print('🔥 UPDATE EVENT RECEIVED');

  print('UPDATE INDEX: ${event.index}');
  print('UPDATE ID: ${state.id[event.index]}');
final id = state.id[event.index];
final name = NameEntity(
  id: id, name:event.name, completed: state.completed[event.index], isHidden: state.isHidden[event.index],
);
 await updateNameUsecase.execute(name);
 final names = await getNamesUsecase.execute();
        final nameList = names.map((e) => e.name).toList();
        final completedList = names.map((e) => e.completed).toList();
        final isHiddenList = names.map((e) => e.isHidden).toList();
        final idList = names.map((e) => e.id).toList();
        emit(
  NameState(
    id: idList,
    names: nameList,
    completed: completedList,
    isHidden: isHiddenList,
     editIndex: null,
     editName: null,

  ),
);
});



on<DeleteNameEvent>((event, emit)async {
 final id = state.id[event.index];
     await deleteNameUsecase.execute(id);
       final names = await getNamesUsecase.execute();
        final nameList = names.map((e) => e.name).toList();
        final completedList = names.map((e) => e.completed).toList();
        final isHiddenList = names.map((e) => e.isHidden).toList();
        final idList = names.map((e) => e.id).toList();
emit(
  NameState(
    id: idList,
    names: nameList,
    completed: completedList,
    isHidden: isHiddenList,
  ),
);


});


on<AddNameEvent>((event, emit) async { 
await addNameUsecase.execute(
    NameEntity(
      id: 0,
      name: event.name,
      completed: false,
      isHidden: false,
    ),
  );
 final names = await getNamesUsecase.execute();
   print('NAMES FROM ISAR: ${names.map((e) => '${e.id}:${e.name}').toList()}');

final nameList = names.map((e) => e.name).toList();
final completedList = names.map((e) => e.completed).toList();
final isHiddenList = names.map((e) => e.isHidden).toList();
final idList = names.map((e) => e.id).toList();

emit(
  NameState(
    id:idList,
    names: nameList,
    completed: completedList,
    isHidden: isHiddenList,
  ),
);
});
    


  }
}
