extension NumberParsing on String {
  // put (this) is because this is an extension of the string hence it will pass the string variable
  int? toIntOrNull() => int.tryParse(this);
}

// To use the extension multiple time
// put it in a different file and remember to add a name (NumberParsing)
