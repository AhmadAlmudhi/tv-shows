part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCurrentThemeEvent extends ThemeEvent {}

class ThemeChangedEvent extends ThemeEvent {
  final String theme;

  ThemeChangedEvent({required this.theme});

  @override
  List<Object?> get props => [theme];
}
