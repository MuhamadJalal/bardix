class AppRepoAssets {
  AppRepoAssets._internal();

  static final AppRepoAssets _instance = AppRepoAssets._internal();

  factory AppRepoAssets() => _instance;

  final String logoImage = 'assets/images/baredex_logo.jpeg';
  final String dropdownArrowImage = 'assets/images/dropdown_arrow.svg';
  final String errorImage = 'assets/images/error.svg';
  final String locationImage = 'assets/images/location.svg';
  final String searchImage = 'assets/images/search.svg';
  final String userImage = 'assets/images/user.svg';
  final String verticalLineImage = 'assets/images/vertical_line.svg';
  final String typeImage = 'assets/images/select_type.svg';
}
