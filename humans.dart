import 'cats.dart';

class _Human {
  _Human(this.firstName, this.lastName, [this.parents]) {
    if(parents.length != 0 && parents.length != 2) {
      throw FormatException("$fullName's parent(s) are/is $parents, there should be 2 parents");
    }
  }

  final List<_Human> parents;

  String lastName;
  
  int health = 10;

  void notifyScratch(Human owner) {
    health--;
    if(health <= 0) {
      print("$this died.");
      owner._dispose();
    }
  }

  List<Cat> catsOwned = [];
  bool owns(Cat cat) => catsOwned.contains(cat);
  void assign(Cat cat, Human owner) {
    if(cat.ownerIs(owner)) {
      catsOwned.add(cat);
      return;
    }
    throw FormatException("${cat.fullName}, whose owner is not $fullName, was assigned to $fullName.");
  }

  String firstName;

  String get fullName => "$firstName $lastName";
  Human makeBaby(Human owner, Human withy, {String named = "Baby"}) {
    if(withy == null) throw FormatException("'with' argument to _Human.makeBaby cannot be null.");
    return Human(named, withy.lastName, [owner, withy]);
  }

  String toString() => fullName;
}

class Human {
  Human(String firstName, String lastName, [List<Human> parents = const []]):this._from(_Human(firstName, lastName, parents.map((Human h) => h._this).toList()));
  Human._from(this._this);
  _Human _this;
  operator ==(Human other) => _this == other._this;
  int get hashCode => _this.hashCode;
  List<Human> get parents => _this.parents.toList().map((_Human h) => Human._from(h)).toList();
  String get lastName => _this.lastName;
  String get firstName => _this.firstName;
  String get fullName => _this.fullName;
  String toString() => "$_this";
  void notifyScratch() => _this.notifyScratch(this);
  bool owns(Cat cat) => _this.owns(cat);
  void assign(Cat cat) => _this.assign(cat, this);
  void _dispose() => _this = _DeadHuman(_this);
  Human makeBaby(Human h, {String named}) => _this.makeBaby(this, h, named: named);
}

class _DeadHuman extends _Human {
  _DeadHuman(_Human old): super(old.firstName, old.lastName, old.parents);
  bool owns(Cat cat) {
    throw "$fullName is dead, so does not own ${cat.name}. You may have called the Cat.owner getter, the Cat.fullName getter, Cat.toString, Cat.scratch, or Human.owns (if you did something else, )";
  }
}