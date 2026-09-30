import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_new/name/presentation/bloc/name_bloc.dart';
import 'package:home_new/name/presentation/bloc/name_event.dart';

import '../bloc/name_state.dart';

class NameBlocPage extends StatefulWidget {
  const NameBlocPage({super.key});

  @override
  State<NameBlocPage> createState() => _NameBlocPageState();
}

class _NameBlocPageState extends State<NameBlocPage> {
  final TextEditingController nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(controller: nameController),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
           
               ElevatedButton(
                onPressed: () {

  final state = context.read<NameBloc>().state;

state.when(
  initial: () {},

  loading: () {},

  loaded: (names, editIndex, editName) {
    if (editIndex != null) {
    context.read<NameBloc>().add(
      UpdateNameEvent(
        editIndex!,
        nameController.text,
      ),
    );
  }
  else {
  context.read<NameBloc>().add(
    AddNameEvent(
      nameController.text,
    ),
  );
}
  },

  error: (message) {},
);
    nameController.clear();
  },
                child: const Text('Save'),
              ),
              // ElevatedButton(onPressed: update, child: const Text('تعديل ')),
            ],
          ),
          SizedBox(height: 20),
  
  Expanded(
    child: BlocListener<NameBloc, NameState>(
    listener: (context, state) {
      state.when(
        initial: () {},

        loading: () {},

        loaded: (names, editIndex, editName) {
          if (editName != null) {
            nameController.text = editName;
          }
        },

        error: (message) {},
      );
    },

     child: BlocBuilder<NameBloc, NameState>(
    builder: (context, state) {
      return state.when(
        initial: () {
          return const Center(
            child: Text('البداية'),
          );
        },
    
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
    
        loaded: (names, editIndex, editName) {
          if (names.isEmpty) {
            return const Center(
              child: Text('لا يوجد اسم'),
            );
          }
    
          return ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
              final name = names[index];
    
              return ListTile(
                title: name.isHidden
                    ? const SizedBox.shrink()
                    : Text(
                        name.name,
                        style: TextStyle(
                          decoration: name.completed
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
    
                leading: Checkbox(
                  value: name.completed,
                  onChanged: (_) {
                    context.read<NameBloc>().add(
                      ToggleCompleteEvent(index),
                    );
                  },
                ),
    
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<NameBloc>().add(
                          StartEditEvent(index),
                        );
                      },
                      icon: const Icon(Icons.edit),
                    ),
    
                    IconButton(
                      onPressed: () {
                        context.read<NameBloc>().add(
                          ToggleHiddenEvent(index),
                        );
                      },
                      icon: Icon(
                        name.isHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
    
                    IconButton(
                      onPressed: () {
                        context.read<NameBloc>().add(
                          DeleteNameEvent(index),
                        );
                      },
                      icon: const Icon(Icons.remove),
                    ),
                  ],
                ),
              );
            },
          );
        },
    
        error: (message) {
          return Center(
            child: Text(message),
          );
        },
      );
    },
    ),
      
    ),
  )
        ]
               ),
    );
  }
}
