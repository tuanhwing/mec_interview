

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_interview/bloc/mec_page_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MECPageBloc<Event, State> extends Bloc<Event, State>{
  MECPageBloc(this._context, State state) : super(state);
  BuildContext _context;

  BuildContext get context => _context;

  StreamController<MECPageEvent> _pageSTC = StreamController<MECPageEvent>.broadcast();

  StreamController<MECPageEvent> get pageSTC => _pageSTC;
  Stream<MECPageEvent> get pageStream => _pageSTC.stream;

  void dispose() {
    _pageSTC.close();
  }
}