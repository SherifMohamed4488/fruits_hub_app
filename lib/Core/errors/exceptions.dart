class CustomExceptions implements Exception {
String message ;
  CustomExceptions({ required this.message});

  @override
  String toString(){

    return message;
  }
}