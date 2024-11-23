import 'dart:convert';

List<Country> countryFromJson(String str) => List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

String countryToJson(List<Country> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Country {
    final Name name;
    final List<String> tld;
    final String cca2;
    final String ccn3;
    final String cca3;
    final bool independent;
    final String status;
    final bool unMember;
    final Map<String, Currency> currencies;
    final Idd idd;
    final List<String> capital;
    final List<String> altSpellings;
    final String region;
    final Map<String, String> languages;
    final Map<String, Translation> translations;
    final List<double> latlng;
    final bool landlocked;
    final double area;
    final Demonyms demonyms;
    final String flag;
    final Maps maps;
    final int population;
    final Car car;
    final List<String> timezones;
    final List<String> continents;
    final Flags flags;
    final CoatOfArms coatOfArms;
    final String startOfWeek;
    final CapitalInfo capitalInfo;
    final String cioc;
    final String subregion;
    final String fifa;
    final List<String> borders;
    final Map<String, double> gini;
    final PostalCode postalCode;

    Country({
        required this.name,
        required this.tld,
        required this.cca2,
        required this.ccn3,
        required this.cca3,
        required this.independent,
        required this.status,
        required this.unMember,
        required this.currencies,
        required this.idd,
        required this.capital,
        required this.altSpellings,
        required this.region,
        required this.languages,
        required this.translations,
        required this.latlng,
        required this.landlocked,
        required this.area,
        required this.demonyms,
        required this.flag,
        required this.maps,
        required this.population,
        required this.car,
        required this.timezones,
        required this.continents,
        required this.flags,
        required this.coatOfArms,
        required this.startOfWeek,
        required this.capitalInfo,
        required this.cioc,
        required this.subregion,
        required this.fifa,
        required this.borders,
        required this.gini,
        required this.postalCode,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: Name.fromJson(json["name"]),
        tld: List<String>.from(json["tld"].map((x) => x)),
        cca2: json["cca2"],
        ccn3: json["ccn3"],
        cca3: json["cca3"],
        independent: json["independent"],
        status: json["status"],
        unMember: json["unMember"],
        currencies: Map.from(json["currencies"]).map((k, v) => MapEntry<String, Currency>(k, Currency.fromJson(v))),
        idd: Idd.fromJson(json["idd"]),
        capital: List<String>.from(json["capital"].map((x) => x)),
        altSpellings: List<String>.from(json["altSpellings"].map((x) => x)),
        region: json["region"],
        languages: Map.from(json["languages"]).map((k, v) => MapEntry<String, String>(k, v)),
        translations: Map.from(json["translations"]).map((k, v) => MapEntry<String, Translation>(k, Translation.fromJson(v))),
        latlng: List<double>.from(json["latlng"].map((x) => x?.toDouble())),
        landlocked: json["landlocked"],
        area: json["area"]?.toDouble(),
        demonyms: Demonyms.fromJson(json["demonyms"]),
        flag: json["flag"],
        maps: Maps.fromJson(json["maps"]),
        population: json["population"],
        car: Car.fromJson(json["car"]),
        timezones: List<String>.from(json["timezones"].map((x) => x)),
        continents: List<String>.from(json["continents"].map((x) => x)),
        flags: Flags.fromJson(json["flags"]),
        coatOfArms: CoatOfArms.fromJson(json["coatOfArms"]),
        startOfWeek: json["startOfWeek"],
        capitalInfo: CapitalInfo.fromJson(json["capitalInfo"]),
        cioc: json["cioc"],
        subregion: json["subregion"],
        fifa: json["fifa"],
        borders: List<String>.from(json["borders"].map((x) => x)),
        gini: Map.from(json["gini"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        postalCode: PostalCode.fromJson(json["postalCode"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "tld": List<dynamic>.from(tld.map((x) => x)),
        "cca2": cca2,
        "ccn3": ccn3,
        "cca3": cca3,
        "independent": independent,
        "status": status,
        "unMember": unMember,
        "currencies": Map.from(currencies).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "idd": idd.toJson(),
        "capital": List<dynamic>.from(capital.map((x) => x)),
        "altSpellings": List<dynamic>.from(altSpellings.map((x) => x)),
        "region": region,
        "languages": Map.from(languages).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "translations": Map.from(translations).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "latlng": List<dynamic>.from(latlng.map((x) => x)),
        "landlocked": landlocked,
        "area": area,
        "demonyms": demonyms.toJson(),
        "flag": flag,
        "maps": maps.toJson(),
        "population": population,
        "car": car.toJson(),
        "timezones": List<dynamic>.from(timezones.map((x) => x)),
        "continents": List<dynamic>.from(continents.map((x) => x)),
        "flags": flags.toJson(),
        "coatOfArms": coatOfArms.toJson(),
        "startOfWeek": startOfWeek,
        "capitalInfo": capitalInfo.toJson(),
        "cioc": cioc,
        "subregion": subregion,
        "fifa": fifa,
        "borders": List<dynamic>.from(borders.map((x) => x)),
        "gini": Map.from(gini).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "postalCode": postalCode.toJson(),
    };
}

class CapitalInfo {
    final List<double> latlng;

    CapitalInfo({
        required this.latlng,
    });

    factory CapitalInfo.fromJson(Map<String, dynamic> json) => CapitalInfo(
        latlng: List<double>.from(json["latlng"].map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "latlng": List<dynamic>.from(latlng.map((x) => x)),
    };
}

class Car {
    final List<String> signs;
    final String side;

    Car({
        required this.signs,
        required this.side,
    });

    factory Car.fromJson(Map<String, dynamic> json) => Car(
        signs: List<String>.from(json["signs"].map((x) => x)),
        side: json["side"],
    );

    Map<String, dynamic> toJson() => {
        "signs": List<dynamic>.from(signs.map((x) => x)),
        "side": side,
    };
}

class CoatOfArms {
    final String png;
    final String svg;

    CoatOfArms({
        required this.png,
        required this.svg,
    });

    factory CoatOfArms.fromJson(Map<String, dynamic> json) => CoatOfArms(
        png: json["png"],
        svg: json["svg"],
    );

    Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
    };
}

class Currency {
    final String name;
    final String symbol;

    Currency({
        required this.name,
        required this.symbol,
    });

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        name: json["name"],
        symbol: json["symbol"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
    };
}

class Demonyms {
    final Eng eng;
    final Eng fra;

    Demonyms({
        required this.eng,
        required this.fra,
    });

    factory Demonyms.fromJson(Map<String, dynamic> json) => Demonyms(
        eng: Eng.fromJson(json["eng"]),
        fra: Eng.fromJson(json["fra"]),
    );

    Map<String, dynamic> toJson() => {
        "eng": eng.toJson(),
        "fra": fra.toJson(),
    };
}

class Eng {
    final String f;
    final String m;

    Eng({
        required this.f,
        required this.m,
    });

    factory Eng.fromJson(Map<String, dynamic> json) => Eng(
        f: json["f"],
        m: json["m"],
    );

    Map<String, dynamic> toJson() => {
        "f": f,
        "m": m,
    };
}

class Flags {
    final String png;
    final String svg;
    final String alt;

    Flags({
        required this.png,
        required this.svg,
        required this.alt,
    });

    factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        png: json["png"],
        svg: json["svg"],
        alt: json["alt"],
    );

    Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
        "alt": alt,
    };
}

class Idd {
    final String root;
    final List<String> suffixes;

    Idd({
        required this.root,
        required this.suffixes,
    });

    factory Idd.fromJson(Map<String, dynamic> json) => Idd(
        root: json["root"],
        suffixes: List<String>.from(json["suffixes"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "root": root,
        "suffixes": List<dynamic>.from(suffixes.map((x) => x)),
    };
}

class Maps {
    final String googleMaps;
    final String openStreetMaps;

    Maps({
        required this.googleMaps,
        required this.openStreetMaps,
    });

    factory Maps.fromJson(Map<String, dynamic> json) => Maps(
        googleMaps: json["googleMaps"],
        openStreetMaps: json["openStreetMaps"],
    );

    Map<String, dynamic> toJson() => {
        "googleMaps": googleMaps,
        "openStreetMaps": openStreetMaps,
    };
}

class Name {
    final String common;
    final String official;
    final Map<String, Translation> nativeName;

    Name({
        required this.common,
        required this.official,
        required this.nativeName,
    });

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        nativeName: Map.from(json["nativeName"]).map((k, v) => MapEntry<String, Translation>(k, Translation.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
        "nativeName": Map.from(nativeName).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class Translation {
    final String official;
    final String common;

    Translation({
        required this.official,
        required this.common,
    });

    factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        official: json["official"],
        common: json["common"],
    );

    Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
    };
}

class PostalCode {
    final String format;
    final String regex;

    PostalCode({
        required this.format,
        required this.regex,
    });

    factory PostalCode.fromJson(Map<String, dynamic> json) => PostalCode(
        format: json["format"],
        regex: json["regex"],
    );

    Map<String, dynamic> toJson() => {
        "format": format,
        "regex": regex,
    };
}
