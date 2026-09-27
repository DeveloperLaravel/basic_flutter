import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_new/name/name_bloc.dart';
import 'package:home_new/name/name_event.dart';

import 'name/name_state.dart';

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
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<NameBloc>().add(
                    AddNameEvent(nameController.text),
                    
                  );
                },
                child: const Text('Save'),
              ),
              // ElevatedButton(onPressed: update, child: const Text('تعديل ')),
            ],
          ),
          SizedBox(height: 20),
  
              Expanded(
                  child: BlocBuilder<NameBloc, NameState>(
                    builder: (context, state) {
                      
                      if(state.names.isEmpty){
                        
                        return Expanded(child: Center(child: Text('لا يوجد اسم')));

                      }
                      
                      
                      
                      
                      return ListView.builder(
                        itemCount: state.names.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: state.isHidden[index]
                                ? const SizedBox.shrink()
                                : Text(
                                    state.names[index],
                                    style: TextStyle(
                                      decoration: state.completed[index]
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                    ),
                                  ),

                            leading: Checkbox(
                              value: state.completed[index],
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
                                    // editName(index);
                                    // editIndex = index;
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
                                    state.isHidden[index]
                                        ? Icons.visibility_off
                                        : Icons.visibility,
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
        ],
      ),
    );
  }
}
