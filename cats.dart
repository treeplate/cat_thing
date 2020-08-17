import 'humans.dart';
export 'humans.dart';

class Cat {
  Cat(this._name, this._owner);
  
  String _name;
  String get name => _name;
  
  void purr() => print("$this purrs.");
  
  void scratch(Human h) {
    print("$this scratches $h");
    h.notifyScratch();
  }

  Human _owner;
  Human get owner {
    if(_owner.owns(this))
     return _owner;
    throw FormatException("The owner of Cat $name, ${_owner.fullName}, does not own Cat $name.");
  }
  bool ownerIs(Human human) => _owner == human;

  String get fullName => "Cat $name ${owner.lastName}";

  String toString() => fullName;
}