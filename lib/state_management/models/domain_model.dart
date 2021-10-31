// To parse this JSON data, do
//
//     final domain = domainFromJson(jsonString);
// @dart=2.9
import 'dart:convert';

Domain domainFromJson(String str) => Domain.fromJson(json.decode(str));

String domainToJson(Domain data) => json.encode(data.toJson());

class Domain {
  Domain({
    this.context,
    this.id,
    this.type,
    this.hydraMember,
    this.hydraTotalItems,
  });

  String context;
  String id;
  String type;
  List<HydraMember> hydraMember;
  int hydraTotalItems;

  factory Domain.fromJson(Map<String, dynamic> json) => Domain(
        context: json["@context"],
        id: json["@id"],
        type: json["@type"],
        hydraMember: List<HydraMember>.from(
            json["hydra:member"].map((x) => HydraMember.fromJson(x))),
        hydraTotalItems: json["hydra:totalItems"],
      );

  Map<String, dynamic> toJson() => {
        "@context": context,
        "@id": id,
        "@type": type,
        "hydra:member": List<dynamic>.from(hydraMember.map((x) => x.toJson())),
        "hydra:totalItems": hydraTotalItems,
      };
}

class HydraMember {
  HydraMember({
    this.id,
    this.type,
    this.hydraMemberId,
    this.domain,
    this.isActive,
    this.isPrivate,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String type;
  String hydraMemberId;
  String domain;
  bool isActive;
  bool isPrivate;
  DateTime createdAt;
  DateTime updatedAt;

  factory HydraMember.fromJson(Map<String, dynamic> json) => HydraMember(
        id: json["@id"],
        type: json["@type"],
        hydraMemberId: json["id"],
        domain: json["domain"],
        isActive: json["isActive"],
        isPrivate: json["isPrivate"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "@id": id,
        "@type": type,
        "id": hydraMemberId,
        "domain": domain,
        "isActive": isActive,
        "isPrivate": isPrivate,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
