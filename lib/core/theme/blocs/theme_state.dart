part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  final ThemeData themeData;

  const ThemeState(this.themeData);

  @override
  List<Object> get props => [themeData];
}

class LightThemeState extends ThemeState {
  LightThemeState() : super(AppTheming().getLightTheme());
}

class DarkThemeState extends ThemeState {
  DarkThemeState() : super(AppTheming().getLightTheme());
}
