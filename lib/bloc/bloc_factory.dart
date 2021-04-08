

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_interview/bloc/authentication/mec_authentication_bloc.dart';
import 'package:flutter_app_interview/repository/mec_authentication_repository.dart';
import 'package:flutter_app_interview/repository/repository_factory.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/login/bloc/login_bloc.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/register/bloc/register_bloc.dart';

class BlocFactory {
  static T of<T>({BuildContext context}) {
    switch(T) {
      case MECAuthenticationBloc:
        MECAuthenticationRepository authenticationRepository = RepositoryFactory.of<MECAuthenticationRepository>();
        return MECAuthenticationBloc(authenticationRepository) as T;

      case LoginBloc:
        return LoginBloc(context) as T;
      case RegisterBloc:
        return RegisterBloc(context) as T;
      default:
        throw('MECBlocFactory can not found $T');
    }
  }
}