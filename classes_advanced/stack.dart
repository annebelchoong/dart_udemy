//Composition
class Stack<T> {
  final List<T> _items = [];

  // function to pass argument and then add it to the list
  void push(T item) => _items.add(item);

  // return/perform type T (method)
  T pop() => _items.removeLast();
}

void main() {
  final stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  print(stack.pop());
  print(stack.pop());
  final names = Stack<String>();
  names.push('Andrea');
  names.push('Annebel');
  // print(names._items);
}
