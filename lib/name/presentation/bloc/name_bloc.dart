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
          const NameState.initial(),
        ) {
    // Load
// Load
on<LoadNamesEvent>((event, emit) async {
  try {
    emit(
      const NameState.loading(),
    );

    final names = await getNamesUsecase.execute();

    emit(
      NameState.loaded(
        names,
        null,
        null,
      ),
    );
  } catch (e) {
    emit(
      NameState.error(
        e.toString(),
      ),
    );
  }
});
  // تحميل تلقائي
  add(LoadNamesEvent());
    // Start Edit
    on<StartEditEvent>((event, emit) async {
    state.when(
    initial: () {},
    loading: () {},
    loaded: (names, editIndex, editName) {
       final name = names[event.index];

      emit(
        NameState.loaded(
          names,
          event.index,
          name.name,
        ),
      );
    },
    error: (message) {},
  );
    });

    // Toggle Hidden
on<ToggleHiddenEvent>((event, emit) async {

 await state.when(
    initial: () {},

    loading: () {},

    loaded: (names, editIndex, editName) async {

      final name = names[event.index];
      final updatedName = name.copyWith(
        isHidden: !name.isHidden,
      );
      await updateNameUsecase.execute(updatedName);
      final updatedNames =
          await getNamesUsecase.execute();
      emit(
        NameState.loaded(
          updatedNames,
          editIndex,
          editName,
        ),
      );
    },

    error: (message) {},
  );
});
    // Toggle Complete
    on<ToggleCompleteEvent>((event, emit) async {
    await    state.when(
    initial: () {},

    loading: () {},

    loaded: (names, editIndex, editName) async {
      final name = names[event.index];
 final updatedName = name.copyWith(
    completed: !name.completed,
  );
   await updateNameUsecase.execute(updatedName);
final updatedNames = await getNamesUsecase.execute();
      emit(
        NameState.loaded(
          updatedNames,
          editIndex,
          editName,
        ),
      );
    },

    error: (message) {},
  );
    });

    // Update
    on<UpdateNameEvent>((event, emit) async {
    await  state.when(
    initial: () {},

    loading: () {},

    loaded: (names, editIndex, editName) async {
        final oldName = names[event.index];

  final updatedName = oldName.copyWith(
        name: event.name,
      );
    await updateNameUsecase.execute(updatedName);

final updatedNames = await getNamesUsecase.execute();
      emit(
        NameState.loaded(
          updatedNames,
          null,
          null,
        ),
      );
    },

    error: (message) {},
  );
    });

    // Delete
    on<DeleteNameEvent>((event, emit) async {
     await  state.when(
    initial: () {},

    loading: () {},

    loaded: (names, editIndex, editName) async {
             // 1️⃣ نأخذ الاسم من القائمة
      final name = names[event.index];
      // 2️⃣ نحذفه من قاعدة البيانات باستخدام id
       await deleteNameUsecase.execute(name.id);
        // 3️⃣ نقرأ القائمة الجديدة
          final updatedNames =
          await getNamesUsecase.execute();

      emit(
        NameState.loaded(
          updatedNames,
          editIndex,
         editName,
        ),
      );
    },

    error: (message) {},
  );
    });

    // Add
    on<AddNameEvent>((event, emit) async {
     await  state.when(
    initial: () {},

    loading: () {},

    loaded: (names, editIndex, editName) async {
       await addNameUsecase.execute(
        NameEntity(
          id: 0,
          name: event.name,
          completed: false,
          isHidden: false,
        ),
      );
  final updatedNames =
          await getNamesUsecase.execute();

      emit(
        NameState.loaded(
          updatedNames,
          null,
          null,
        ),
      );
    },

    error: (message) {},
  );
    });
  }
}