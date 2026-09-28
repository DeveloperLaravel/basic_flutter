import 'package:flutter_bloc/flutter_bloc.dart';

import 'name_event.dart';
import 'name_state.dart';


class NameBloc extends Bloc<NameEvent,NameState>{
  NameBloc() : super( NameInitial()){






on<DeleteNameEvent>((event, emit) {
  final names = List<String>.from(state.names);
  final completed = List<bool>.from(state.completed);
  final isHidden = List<bool>.from(state.isHidden);

  names.removeAt(event.index);
  completed.removeAt(event.index);
  isHidden.removeAt(event.index);

  emit(
    NameState(
      names: names,
      completed: completed,
      isHidden: isHidden,
    ),
  );
});







on<UpdateNameEvent>((event, emit) {
  final names = List<String>.from(state.names);

  names[event.index] = event.name;

  emit(
    NameState(
      names: names,
      completed: state.completed,
      isHidden: state.isHidden,
    ),
  );
});


    on<ToggleHiddenEvent>((event, emit) {
        final isHidden = List<bool>.from(state.isHidden);

  isHidden[event.index] = !isHidden[event.index];
   emit(
    NameState(
      names: state.names,
      completed: state.completed,
      isHidden: isHidden,
    ),
  );
});

      on<ToggleCompleteEvent>((event, emit) {
        final completed = List<bool>.from(state.completed);
        completed[event.index] = !completed[event.index];
        emit(
            NameState(names: state.names, completed: completed, isHidden: state.isHidden)

        );

});

    on<AddNameEvent>(((event, emit) {
      final names = List<String>.from(state.names);
      final completed = List<bool>.from(state.completed);
        final isHidden = List<bool>.from(state.isHidden);

      names.add(event.name);
      completed.add(false);
       isHidden.add(false);
      emit(
        NameState(names: names, completed: completed, isHidden: isHidden)
      );


    })
    );
    
  }
}