import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/profile_model.dart';
import '../../services/profile_service.dart';

// Events
abstract class ProfileEvent {}

class LoadProfile extends ProfileEvent {}

class UpdateProfile extends ProfileEvent {
  final ProfileModel profile;
  UpdateProfile(this.profile);
}

class LogoutProfile extends ProfileEvent {}

// States
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileModel profile;
  ProfileLoaded(this.profile);
}

class ProfileUpdated extends ProfileState {
  final ProfileModel profile;
  ProfileUpdated(this.profile);
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}

class ProfileLoggedOut extends ProfileState {}

// BLoC
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileService _profileService;

  ProfileBloc(this._profileService) : super(ProfileInitial()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);
    on<LogoutProfile>(_onLogoutProfile);
  }

  Future<void> _onLoadProfile(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final profile = await _profileService.getProfile();
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> _onUpdateProfile(
    UpdateProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final success = await _profileService.updateProfile(event.profile);
      if (success) {
        emit(ProfileUpdated(event.profile));
      } else {
        emit(ProfileError('Failed to update profile'));
      }
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> _onLogoutProfile(
    LogoutProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final success = await _profileService.logout();
      if (success) {
        emit(ProfileLoggedOut());
      } else {
        emit(ProfileError('Failed to logout'));
      }
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}