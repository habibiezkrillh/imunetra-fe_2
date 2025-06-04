import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/models/event_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadEvents>(_onLoadEvents);
    on<NavigateToEventDetails>(_onNavigateToEventDetails);
  }

  Future<void> _onLoadEvents(
    LoadEvents event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    try {
      // ToDo: Replace with actual data fetching logic
      final events = [
        Event(
          id: '1',
          title: 'Desa Sehat Ta',
          startDate: DateTime(2025, 6, 20),
          endDate: DateTime(2025, 6, 22),
          timeRange: '10.00 - 16.00',
          location: 'Desa Kanjilo',
          imagePath: 'assets/images/event_card1.jpg',
        ),
        // Add more event (todo)
      ];
      emit(HomeLoaded(events: events));
    } catch (e) {
      emit(HomeError(message: 'Failed to load events'));
    }
  }

  void _onNavigateToEventDetails(
    NavigateToEventDetails event,
    Emitter<HomeState> emit,
  ) {
    // Navigation logic will be handled in the view
  }
}