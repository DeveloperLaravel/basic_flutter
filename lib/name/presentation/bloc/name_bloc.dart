import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_new/name/domain/usecases/add_name_usecase.dart';

import '../../domain/entities/name_entity.dart';
import '../../domain/usecases/delete_name_usecase.dart';
import '../../domain/usecases/get_names_usecase.dart';
import '../../domain/usecases/update_name_usecase.dart';
import 'name_event.dart';
import 'name_state.dart';

class NameBloc extends Bloc<NameEvent, NameState> {
  final AddNameUsecase addNameUsecase;
  final GetNamesUsecase getNamesUsecase;
  final UpdateNameUsecase updateNameUsecase;
  final DeleteNameUsecase deleteNameUsecase;

  NameBloc({
    required this.addNameUsecase,
    required this.getNamesUsecase,
    required this.deleteNameUsecase,
    required this.updateNameUsecase,
  }) : super(
          const NameState(
            names: [],
          ),
        ) {
    // Load
    on<LoadNamesEvent>((event, emit) async {
      final names = await getNamesUsecase.execute();

      emit(
        state.copyWith(
          names: names,
        ),
      );
    });

    add(LoadNamesEvent());

    // Start Edit
    on<StartEditEvent>((event, emit) async {
      final name = state.names[event.index];

      emit(
        state.copyWith(
          editIndex: event.index,
          editName: name.name,
        ),
      );
    });

    // Toggle Hidden
    on<ToggleHiddenEvent>((event, emit) async {
      final name = state.names[event.index];

      final updatedName = name.copyWith(
        isHidden: !name.isHidden,
      );

      await updateNameUsecase.execute(updatedName);

      final names = await getNamesUsecase.execute();

      emit(
        state.copyWith(
          names: names,
        ),
      );
    });

    // Toggle Complete
    on<ToggleCompleteEvent>((event, emit) async {
      final name = state.names[event.index];

      final updatedName = name.copyWith(
        completed: !name.completed,
      );

      await updateNameUsecase.execute(updatedName);

      final names = await getNamesUsecase.execute();

      emit(
        state.copyWith(
          names: names,
        ),
      );
    });

    // Update
    on<UpdateNameEvent>((event, emit) async {
      final oldName = state.names[event.index];

      final updatedName = oldName.copyWith(
        name: event.name,
      );

      await updateNameUsecase.execute(updatedName);

      final names = await getNamesUsecase.execute();

      emit(
        state.copyWith(
          names: names,
          editIndex: null,
          editName: null,
        ),
      );
    });

    // Delete
    on<DeleteNameEvent>((event, emit) async {
      final name = state.names[event.index];

      final id = name.id;

      await deleteNameUsecase.execute(id);

      final names = await getNamesUsecase.execute();

      emit(
        state.copyWith(
          names: names,
        ),
      );
    });

    // Add
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

      emit(
        state.copyWith(
          names: names,
          editIndex: null,
          editName: null,
        ),
      );
    });
  }
}