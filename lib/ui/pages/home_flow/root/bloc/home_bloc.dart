

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_interview/bloc/mec_page_bloc.dart';
import 'package:flutter_app_interview/ui/pages/home_flow/root/bloc/home_event.dart';
import 'package:flutter_app_interview/ui/pages/home_flow/root/bloc/home_state.dart';

class HomeBloc extends MECPageBloc<HomeEvent, HomeState> {
  HomeBloc(BuildContext context) : super(context, const HomeState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeTabChangedEvent) {
      yield HomeState(tabIndex: event.index ?? 0);
    }
  }

}