part of 'theme_bloc.dart';

@immutable
sealed class ThemeState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ThemeInitial extends ThemeState {}

final class ThemeLoadedState extends ThemeState {
  final String theme;

  ThemeLoadedState({required this.theme});

  @override
  List<Object?> get props => [theme];
}
