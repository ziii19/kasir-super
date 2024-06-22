part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.user,
    this.status = Status.initial,
    this.error,
    this.image,
  });

  factory ProfileState.initial() {
    return const ProfileState();
  }

  final UserModel? user;
  final Status status;
  final String? error;
  final String? image;

  ProfileState copyWith({
    UserModel? user,
    Status? status,
    String? error,
    String? image,
  }) {
    return ProfileState(
      error: error,
      status: status ?? this.status,
      user: user ?? this.user,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [error, status, user, image];
}
