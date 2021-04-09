

import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];

}

class RegisterUsernameChangedEvent extends RegisterEvent {
  RegisterUsernameChangedEvent({this.username});
  final String username;

  @override
  List<Object> get props => [username];
}


class RegisterSubmitEvent extends RegisterEvent {
}