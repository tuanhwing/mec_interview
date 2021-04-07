
abstract class MECPageEvent {

}

class MECPageLoadingEvent extends MECPageEvent {
}

class EOCPageErrorEvent extends MECPageEvent {
  EOCPageErrorEvent({this.message});
  final String message;
}
