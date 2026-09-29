
class NameState {

List<int> id;
List<String> names;
List<bool> completed;
List <bool> isHidden;
int? editIndex;
String? editName;
  NameState({
    required this.id,
    required this.names,
    required this.completed,
    required this.isHidden,
    this.editIndex,
    this.editName,
  });
}
class NameInitial extends NameState {
  NameInitial()
      : super(
          id: [],
          names: [],
          completed: [],
          isHidden: [],
          editIndex: null,
          editName:null,
        );
}