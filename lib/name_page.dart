import 'package:flutter/material.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  final TextEditingController nameController = TextEditingController();
List<String> names = [];
List<bool> completed= [];
List <bool> isHidden = [];
int? editIndex;
// final bool comple = false;

void addPro(){
     setState(() {
        names.add(nameController.text);     
            });
            completed.add(false);
            isHidden.add(false);
            nameController.clear();
}
void editName(int index){
  setState(() {
   nameController.text = names[index] ;
  });
}

void update(){
  setState(() {
    names[editIndex!] = nameController.text;
      nameController.clear();
  });
}
void remove(int index){
   setState(() {
      names.removeAt(index);
    });
}
void complet (int index){
            setState(() {
  completed[index] =! completed[index];
});

}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          TextField(
            controller: nameController,
          ),
          Row(
            children: [
              ElevatedButton(onPressed: addPro, child: const Text('Save')),
              ElevatedButton(onPressed: update, child: const Text('تعديل ')),
            ],
          ),
          SizedBox(height: 20,),
          names.isEmpty
          ? Expanded(child: Center(child:  Text('لا يوجد اسم')))
          :

          Expanded(
            child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (context,index){
              return ListTile(
                title: 
                isHidden[index]
                  ? const SizedBox.shrink()
                  : Text(names[index] ,style: TextStyle(
                  decoration: completed[index]
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
                ),),
                
                
               
                leading: Checkbox(value: completed[index], onChanged: (value){
                  setState(() {
                    completed[index] = value!;
                  });
                }),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: (){
                      editName(index);
                       editIndex = index;
                    }, icon: Icon(Icons.edit)),
                    IconButton(onPressed: (){
                         setState(() {
      isHidden[index] = !isHidden[index];
    });
                    }, icon: Icon(isHidden[index]
                       ? Icons.visibility_off
                       : Icons.visibility,
                    )),
                    IconButton(onPressed:(){
                      remove(index);

                    } , icon: Icon(Icons.remove)),
                    
                  ],
                ),
                );
            }),
          )
          
        ],
        

      ),

    );
  }
}