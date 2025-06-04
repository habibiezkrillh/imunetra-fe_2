// lib/features/home/bloc/home_state.dart
part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Event> events;

  HomeLoaded({required this.events});
}

class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}