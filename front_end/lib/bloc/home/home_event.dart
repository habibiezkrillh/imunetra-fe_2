part of 'home_bloc.dart';

abstract class HomeEvent {}

class LoadEvents extends HomeEvent {}

class NavigateToEventDetails extends HomeEvent {
  final String eventId;

  NavigateToEventDetails(this.eventId);
}