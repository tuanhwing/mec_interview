
import 'package:flutter_app_interview/repository/firebase/firebase_authenticaiton_repository.dart';
import 'package:flutter_app_interview/repository/mec_authentication_repository.dart';

class RepositoryFactory {
  static T of<T>() {
    switch(T) {
      case MECAuthenticationRepository: return FirebaseAuthenticationRepository() as T;
      default: throw Exception("TPBlocFactory can't find $T");
    }
  }
}