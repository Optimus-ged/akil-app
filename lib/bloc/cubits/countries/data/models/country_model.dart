import 'dart:convert';

List<CountryData> countriesFromJson(String str) =>
    List<CountryData>.from(jsonDecode(str).map((x) => CountryData.fromJson(x)));

CountryData countryDataFromJson(String str) =>
    CountryData.fromJson(jsonDecode(str));

class CountryData {
  Flags? flags;
  Name? name;
  String? cca2;
  List<String>? capital;
  String? region;
  String? subregion;
  dynamic area;
  dynamic population;
  List<String>? timezones;

  CountryData({
    this.flags,
    this.name,
    this.cca2,
    this.capital,
    this.region,
    this.subregion,
    this.area,
    this.population,
    this.timezones,
  });

  CountryData.fromJson(Map<String, dynamic> json) {
    flags = json['flags'] != null ? Flags.fromJson(json['flags']) : null;
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    if (json['capital'] != null) {
      capital = json['capital'].cast<String>();
    }
    region = json['region'];
    cca2 = json['cca2'];
    subregion = json['subregion'];
    area = json['area'];
    population = json['population'];
    if (json['timezones'] != null) {
      timezones = json['timezones'].cast<String>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (flags != null) {
      data['flags'] = flags!.toJson();
    }
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['capital'] = capital;
    data['region'] = region;
    data['cca2'] = cca2;
    data['subregion'] = subregion;
    data['area'] = area;
    data['population'] = population;
    data['timezones'] = timezones;
    return data;
  }
}

class Flags {
  String? png;
  String? svg;
  String? alt;

  Flags({this.png, this.svg, this.alt});

  Flags.fromJson(Map<String, dynamic> json) {
    png = json['png'];
    svg = json['svg'];
    alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['png'] = png;
    data['svg'] = svg;
    data['alt'] = alt;
    return data;
  }
}

class Name {
  String? common;
  String? official;
  NativeName? nativeName;

  Name({this.common, this.official, this.nativeName});

  Name.fromJson(Map<String, dynamic> json) {
    common = json['common'];
    official = json['official'];
    nativeName =
        json['nativeName'] != null
            ? NativeName.fromJson(json['nativeName'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['common'] = common;
    data['official'] = official;
    if (nativeName != null) {
      data['nativeName'] = nativeName!.toJson();
    }
    return data;
  }
}

class NativeName {
  Eng? eng;

  NativeName({this.eng});

  NativeName.fromJson(Map<String, dynamic> json) {
    eng = json['eng'] != null ? Eng.fromJson(json['eng']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (eng != null) {
      data['eng'] = eng!.toJson();
    }
    return data;
  }
}

class Eng {
  String? official;
  String? common;

  Eng({this.official, this.common});

  Eng.fromJson(Map<String, dynamic> json) {
    official = json['official'];
    common = json['common'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['official'] = official;
    data['common'] = common;
    return data;
  }
}
