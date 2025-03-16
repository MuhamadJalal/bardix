class Country {
  String name;
  String arName;

  final String flagUri;

  final String code;

  final String dialCode;

  Country(
      {this.name = "", this.arName = "", this.code = "", this.flagUri = "", this.dialCode = ""});

  @override
  String toString() => dialCode;

  String toLongString(String locale) => "$dialCode ${toCountryStringOnly(locale)}";

  String toCountryStringOnly(String locale) {
    return '${locale == 'en' ? _cleanName : _cleanArName}';
  }

  String? get _cleanName {
    return name.replaceAll(RegExp(r'[[\]]'), '').split(',').first;
  }

  String? get _cleanArName {
    return arName.replaceAll(RegExp(r'[[\]]'), '').split(',').first;
  }

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        name: json['en_short_name'],
        arName: json['ar_name'],
        code: json['alpha_2_code'],
        dialCode: json['dial_code'],
        flagUri: 'assets/flags/${json['alpha_2_code'].toLowerCase()}.png');
  }

  Country copyWith({
    String? code,
    String? name,
    String? arName,
    String? dialCode,
    String? flagUri,
  }) {
    return Country(
      code: code ?? this.code,
      name: name ?? this.name,
      arName: arName ?? this.arName,
      dialCode: dialCode ?? this.dialCode,
      flagUri: flagUri ?? this.flagUri,
    );
  }
}
