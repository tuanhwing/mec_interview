
import 'dart:async';

abstract class MECBloc<Event, State> {
  MECBloc(this._state) : assert(_state != null);

  State _state;

  State get state => _state;

  // StreamController<Event> _pageSTC = StreamController<Event>.broadcast();
  //
  // StreamController<MECPageEvent> get pageSTC => _pageSTC;
  // Stream<MECPageEvent> get pageStream => _pageSTC.stream;

  // void dispose() {
  //   _pageSTC.close();
  // }
}