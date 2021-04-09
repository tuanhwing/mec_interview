

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_interview/bloc/authentication/mec_authentication_bloc.dart';
import 'package:flutter_app_interview/repository/mec_authentication_repository.dart';
import 'package:flutter_app_interview/repository/repository_factory.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/login/bloc/login_bloc.dart';
import 'package:flutter_app_interview/ui/pages/authen_flow/register/bloc/register_bloc.dart';
import 'package:flutter_app_interview/ui/pages/home_flow/add/bloc/home_add_bloc.dart';
import 'package:flutter_app_interview/ui/pages/home_flow/root/bloc/home_bloc.dart';

class BlocFactory {
  static T of<T>({BuildContext context}) {
    switch(T) {
      case MECAuthenticationBloc:
        MECAuthenticationRepository authenticationRepository = RepositoryFactory.of<MECAuthenticationRepository>();
        return MECAuthenticationBloc(authenticationRepository) as T;

      case LoginBloc:
        MECAuthenticationRepository authenticationRepository = RepositoryFactory.of<MECAuthenticationRepository>();
        return LoginBloc(context, authenticationRepository) as T;
      case RegisterBloc:
        MECAuthenticationRepository authenticationRepository = RepositoryFactory.of<MECAuthenticationRepository>();
        return RegisterBloc(context, authenticationRepository) as T;

      case HomeBloc:
        return HomeBloc(context) as T;
      case HomeAddBloc:
        return HomeAddBloc(context) as T;
      default:
        throw('MECBlocFactory can not found $T');
    }
  }
}