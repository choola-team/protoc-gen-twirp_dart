import 'dart:convert';

class Hat {
  Hat(
    this.size,
    this.color,
    this.name,
    this.createdOn,
    this.rgbColor,
    this.availableSizes,
    this.roles,
    this.dictionary,
    this.dictionaryWithMessage,
    this.timestampMap,
  );

  int size;
  String color;
  String name;
  DateTime createdOn;
  Color rgbColor;
  List<Size> availableSizes;
  List<int> roles;
  Map<String, int> dictionary;
  Map<String, Size> dictionaryWithMessage;
  Map<String, DateTime> timestampMap;

  factory Hat.fromJson(Map<String, dynamic> json) {
    var dictionaryMap = Map<String, int>();
    (json['dictionary'] as Map<String, dynamic>).forEach((key, val) {
      if (val is String) {
        dictionaryMap[key] = int.parse(val);
      } else if (val is num) {
        dictionaryMap[key] = val.toInt();
      }
    });

    var dictionaryWithMessageMap = Map<String, Size>();
    (json['dictionaryWithMessage'] as Map<String, dynamic>).forEach((key, val) {
      dictionaryWithMessageMap[key] =
          Size.fromJson(val as Map<String, dynamic>);
    });

    var timestampMapMap = Map<String, DateTime>();
    (json['timestampMap'] as Map<String, dynamic>).forEach((key, val) {
      timestampMapMap[key] = DateTime.parse(val);
    });

    return Hat(
      json['size'] as int,
      json['color'] as String,
      json['name'] as String,
      DateTime.parse(json['created_on']),
      Color.fromJson(json['rgbColor']),
      json['availableSizes'] != null
          ? (json['availableSizes'] as List)
              .map((d) => Size.fromJson(d))
              .toList()
          : <Size>[],
      json['roles'] != null ? (json['roles'] as List).cast<int>() : <int>[],
      dictionaryMap,
      dictionaryWithMessageMap,
      timestampMapMap,
    );
  }

  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    map['size'] = size;
    map['color'] = color;
    map['name'] = name;
    map['created_on'] = createdOn.toIso8601String();
    map['rgbColor'] = rgbColor.toJson();
    map['availableSizes'] = availableSizes.map((l) => l.toJson()).toList();
    map['roles'] = roles.map((l) => l).toList();
    map['dictionary'] = json.decode(json.encode(dictionary));
    map['dictionaryWithMessage'] =
        json.decode(json.encode(dictionaryWithMessage));
    map['timestampMap'] = json.decode(json.encode(timestampMap));
    return map;
  }

  @override
  String toString() {
    return json.encode(toJson());
  }
}

class Color {
  Color(
    this.red,
    this.green,
    this.blue,
  );

  int red;
  int green;
  int blue;

  factory Color.fromJson(Map<String, dynamic> json) {
    return Color(
      json['red'] as int,
      json['green'] as int,
      json['blue'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    map['red'] = red;
    map['green'] = green;
    map['blue'] = blue;
    return map;
  }

  @override
  String toString() {
    return json.encode(toJson());
  }
}

class Receipt {
  Receipt(
    this.total,
  );

  double total;

  factory Receipt.fromJson(Map<String, dynamic> json) {
    return Receipt(
      json['total'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    map['total'] = total;
    return map;
  }

  @override
  String toString() {
    return json.encode(toJson());
  }
}

class Size {
  Size(
    this.inches,
  );

  int inches;

  factory Size.fromJson(Map<String, dynamic> json) {
    return Size(
      json['inches'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    map['inches'] = inches;
    return map;
  }

  @override
  String toString() {
    return json.encode(toJson());
  }
}
