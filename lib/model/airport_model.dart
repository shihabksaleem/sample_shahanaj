class ApiResModel {
  int? total;
  dynamic maxScore;
  List<Airports>? airportsList;

  ApiResModel({
    this.total,
    this.maxScore,
    this.airportsList,
  });

  factory ApiResModel.fromJson(Map<String, dynamic> json) => ApiResModel(
        total: json["total"],
        maxScore: json["max_score"],
        airportsList: json["hits"] == null ? [] : List<Airports>.from(json["hits"]!.map((x) => Airports.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "max_score": maxScore,
        "hits": airportsList == null ? [] : List<dynamic>.from(airportsList!.map((x) => x.toJson())),
      };
}

class Airports {
  Index? index;
  Type? type;
  String? id;
  dynamic score;
  Source? source;

  Airports({
    this.index,
    this.type,
    this.id,
    this.score,
    this.source,
  });

  factory Airports.fromJson(Map<String, dynamic> json) => Airports(
        index: indexValues.map[json["_index"]]!,
        type: typeValues.map[json["_type"]]!,
        id: json["_id"],
        score: json["_score"],
        source: json["_source"] == null ? null : Source.fromJson(json["_source"]),
      );

  Map<String, dynamic> toJson() => {
        "_index": indexValues.reverse[index],
        "_type": typeValues.reverse[type],
        "_id": id,
        "_score": score,
        "_source": source?.toJson(),
      };
}

enum Index { FISKAIRPORTLISTV1 }

final indexValues = EnumValues({"fiskairportlistv1": Index.FISKAIRPORTLISTV1});

class Source {
  int? id;
  String? code;
  String? name;
  String? arabicname;
  String? city;
  String? arabiccity;
  String? countrycode;
  String? countryname;
  String? arabiccountryname;
  bool? isdomestic;
  bool? isallairport;
  bool? hidden;
  int? ranking;
  int? parentid;
  String? longitude;
  String? latitude;
  dynamic displayname;
  dynamic displaynamear;

  Source({
    this.id,
    this.code,
    this.name,
    this.arabicname,
    this.city,
    this.arabiccity,
    this.countrycode,
    this.countryname,
    this.arabiccountryname,
    this.isdomestic,
    this.isallairport,
    this.hidden,
    this.ranking,
    this.parentid,
    this.longitude,
    this.latitude,
    this.displayname,
    this.displaynamear,
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

enum Type { AIRPORTLIST }

final typeValues = EnumValues({"airportlist": Type.AIRPORTLIST});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
