
abstract class NameEvent  {
}
class LoadNamesEvent extends NameEvent {}
class AddNameEvent extends NameEvent {
  final String name;
  AddNameEvent(this.name);
  
}
class ToggleCompleteEvent extends NameEvent {
  final int index;

  ToggleCompleteEvent(this.index);
}

class ToggleHiddenEvent extends NameEvent {
  final int index;

  ToggleHiddenEvent(this.index);
}
class StartEditEvent extends NameEvent {
  final int index;

  StartEditEvent(this.index);
}
class UpdateNameEvent extends NameEvent {
  final int index;
  final String name;

  UpdateNameEvent(this.index, this.name);
}

class DeleteNameEvent extends NameEvent {
  final int index;

  DeleteNameEvent(this.index);
}