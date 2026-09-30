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
  if (state.editIndex != null) {
   final event = UpdateNameEvent(
  state.editIndex!,
  nameController.text,
);
context.read<NameBloc>().add(event);
  }else {
  context.read<NameBloc>().add(
    AddNameEvent(nameController.text),
  );
}
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
                     if (state.editName != null) {
                       nameController.text = state.editName!;
                     }
                   },
                      child: BlocBuilder<NameBloc, NameState>(
                        builder: (context, state) {
                              // if(state.editName != null){
                              //   nameController.text = state.editName!;
                              // }
                  
                          
                          if(state.names.isEmpty){
                            
                            return  Center(child: Text('لا يوجد اسم'));
                  
                          }
                          
                          return ListView.builder(
                            itemCount: state.names.length,
                            itemBuilder: (context, index) {
                              final name = state.names[index];
                  
                              
                  
                  
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
                                        // nameController.text = name.name;
                                        context.read<NameBloc>().add(
                                        StartEditEvent(index),
                                          );
                                      },
                                      icon: Icon(Icons.edit),
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
                                      icon: Icon(
                                        Icons.remove
                                           
                                      ),
                                    ),
                                    // IconButton(
                                    //   onPressed: () {
                                    //     remove(index);
                                    //   },
                                    //   icon: Icon(Icons.remove),
                                    // ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                ),
        ],
      ),
    );
  }
}
