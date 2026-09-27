
class NameState {
List<String> names;
List<bool> completed;
List <bool> isHidden;
  NameState({
    required this.names,
    required this.completed,
    required this.isHidden,
  });
}
class NameInitial extends NameState {
  NameInitial()
      : super(
          names: [],
          completed: [],
          isHidden: [],
        );
}