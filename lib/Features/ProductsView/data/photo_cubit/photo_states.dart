import '../../../auth/domain/entities/user_entity.dart';

class PhotoStates{}
class PhotoInitial extends PhotoStates{}
class PhotoLoading extends PhotoStates{}
class PhotoSuccess extends PhotoStates {
  final String downloadUrl;
  PhotoSuccess(this.downloadUrl);
}

class PhotoFailure extends PhotoStates{

  final String message ;

  PhotoFailure({required this.message});

}