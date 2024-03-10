// To parse this JSON data, do
//
//     final airport = airportFromJson(jsonString);

import 'dart:convert';

// List<Airport> airportFromJson(String str) => List<Airport>.from(json.decode(str).map((x) => Airport.fromJson(x)));

// String airportToJson(List<Airport> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Airport {
    String index;
    String type;
    String id;
    dynamic score;
    Source source;

    Airport({
        required this.index,
        required this.type,
        required this.id,
        required this.score,
        required this.source,
    });

    factory Airport.fromJson(Map<String, dynamic> json) => Airport(
        index: json["_index"],
        type: json["_type"],
        id: json["_id"],
        score: json["_score"],
        source: Source.fromJson(json["_source"]),
    );

    Map<String, dynamic> toJson() => {
        "_index": index,
        "_type": type,
        "_id": id,
        "_score": score,
        "_source": source.toJson(),
    };
}

class Source {
    int id;
    String code;
    String name;
    String arabicname;
    String city;
    String arabiccity;
    String countrycode;
    String countryname;
    String arabiccountryname;
    bool isdomestic;
    bool isallairport;
    bool hidden;
    int ranking;
    int parentid;
    String longitude;
    String latitude;
    dynamic displayname;
    dynamic displaynamear;

    Source({
        required this.id,
        required this.code,
        required this.name,
        required this.arabicname,
        required this.city,
        required this.arabiccity,
        required this.countrycode,
        required this.countryname,
        required this.arabiccountryname,
        required this.isdomestic,
        required this.isallairport,
        required this.hidden,
        required this.ranking,
        required this.parentid,
        required this.longitude,
        required this.latitude,
        required this.displayname,
        required this.displaynamear,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        arabicname: json["arabicname"],
        city: json["city"],
        arabiccity: json["arabiccity"],
        countrycode: json["countrycode"],
        countryname: json["countryname"],
        arabiccountryname: json["arabiccountryname"],
        isdomestic: json["isdomestic"],
        isallairport: json["isallairport"],
        hidden: json["hidden"],
        ranking: json["ranking"],
        parentid: json["parentid"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        displayname: json["displayname"],
        displaynamear: json["displaynamear"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "arabicname": arabicname,
        "city": city,
        "arabiccity": arabiccity,
        "countrycode": countrycode,
        "countryname": countryname,
        "arabiccountryname": arabiccountryname,
        "isdomestic": isdomestic,
        "isallairport": isallairport,
        "hidden": hidden,
        "ranking": ranking,
        "parentid": parentid,
        "longitude": longitude,
        "latitude": latitude,
        "displayname": displayname,
        "displaynamear": displaynamear,
    };
}
