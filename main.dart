import 'cats.dart';
void main() {
  Human human = Human("Carey", "Rasmus").makeBaby(Human("Ian", "Hickson"), named: "Eli");
  Cat cat = Cat("Hedral", human);
  human.assign(cat);
  print("$human's cat is named $cat.");
  cat.purr();
  cat.purr();
  repeat(11, times: (int _) {
    cat.scratch(human);
    return true;
  });
}

void repeat(int n, {bool Function(int i) times}) {
  for(int i = 0; i < n; i++) {
    if(times(i)) continue; break;
  }
}