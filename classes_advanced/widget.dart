abstract class Widget {}

//Text is a Widget (Inheritance)
class Text extends Widget {
  Text(this.text);
  final String text;
}

// Button is a Widget (Inheritance)
class Button extends Widget {
  Button({required this.child, this.onPressed});
  //Specify a child widget (Composition)
  final Widget child;
  //? => Nullable function property
  final void Function()? onPressed;
}

void main() {
  final button = Button(
    //because all widgets have the same base Widget class, so can pass all the different subclasses (widgets) as an argument
    child: Text('Hello'),
    onPressed: () => print('button pressed!'),
  );
}
