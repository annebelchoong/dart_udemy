// mixin is more of like the behaviour of the class
mixin Breathing {
  void breathe() => print('breathing');
}

mixin Swimming {
  void swim() => print('swimming');
}

// Both animal and plant can breath as well as fish and human
class Animal with Breathing {}

class Plant with Breathing {}

// Adding mixins allow fish and human able to swim because not all animal can swim
class Fish extends Animal with Swimming {}

class Human extends Animal with Swimming {}

void main() {
  // Mixin cannot be instantiated
  // final breating = Breathing(); -> error
  // final swimming = Swimming(); -> error

  // final fish = Fish();
  // fish.swim();
  // final human = Human();
  // human.swim();
}
