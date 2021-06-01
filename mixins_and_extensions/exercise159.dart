// the on what type depend on the value infront of the dot 1.rangeTo(5) where 1 is int
extension Range on int {
  // return a list
  List<int> rangeTo(int other) {
    if (other < this) {
      return [];
    }
    var list = [this];
    for (var i = this + 1; i <= other; i++) {
      list.add(i);
    }
    return list;
  }
}

void main() {
  for (var i in 1.rangeTo(5)) {
    print(i);
  }
}
