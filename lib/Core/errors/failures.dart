abstract class Failure{

  String message ;
  Failure({required this.message});
}

class ServerFailure extends Failure{

  ServerFailure({required super.message}) ;
}