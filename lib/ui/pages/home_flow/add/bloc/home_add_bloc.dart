

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_interview/bloc/mec_page_bloc.dart';
import 'package:flutter_app_interview/ui/pages/home_flow/add/bloc/home_add_event.dart';
import 'package:flutter_app_interview/ui/pages/home_flow/add/bloc/home_add_state.dart';

class HomeAddBloc extends MECPageBloc<HomeAddEvent, HomeAddState> {
  HomeAddBloc(BuildContext context) : super(context, const HomeAddState());

  @override
  Stream<HomeAddState> mapEventToState(HomeAddEvent event) {
    throw UnimplementedError();
  }

}