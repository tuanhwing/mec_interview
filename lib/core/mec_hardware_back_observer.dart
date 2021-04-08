
abstract class MECHardwareBackListener {
  void onTapBackPlatform();
}

class MECHardwareBackObserver {
  static final MECHardwareBackObserver _singleton = MECHardwareBackObserver._internal();
  factory MECHardwareBackObserver() {
    return _singleton;
  }
  MECHardwareBackObserver._internal();

  List<MECHardwareBackListener> _listeners = [];

  void addListener(MECHardwareBackListener listener) => _listeners.add(listener);

  void removeListener(MECHardwareBackListener listener) => _listeners.remove(listener);

  ///Notify to last listener
  void notify() {
    if (_listeners.isEmpty) return;

    MECHardwareBackListener listener = _listeners.last;
    listener.onTapBackPlatform();
  }
}