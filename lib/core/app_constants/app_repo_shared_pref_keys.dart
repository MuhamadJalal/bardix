class AppRepoSharedPrefKeys {
  AppRepoSharedPrefKeys._internal();

  static final AppRepoSharedPrefKeys _instance =
      AppRepoSharedPrefKeys._internal();

  factory AppRepoSharedPrefKeys() => _instance;

  final String appLocaleSharedPref = "appLocaleSharedPref";
}
