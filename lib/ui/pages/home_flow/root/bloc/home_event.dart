
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeTabChangedEvent extends HomeEvent {
  const HomeTabChangedEvent({this.index});
  final int index;

  @override
  List<Object> get props => [index];
}