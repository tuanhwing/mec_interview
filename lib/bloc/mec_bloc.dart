

abstract class MECBloc<Event, State> {
  MECBloc(this._state) : assert(_state != null);

  State _state;

  State get state => _state;
}