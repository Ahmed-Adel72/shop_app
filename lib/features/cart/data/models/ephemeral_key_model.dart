class EphemeralKeyModel {
  final String id;
  final String object;
  final List<AssociatedObject> associatedObjects;
  final int created;
  final int expires;
  final bool livemode;
  final String secret;

  EphemeralKeyModel({
    required this.id,
    required this.object,
    required this.associatedObjects,
    required this.created,
    required this.expires,
    required this.livemode,
    required this.secret,
  });

  factory EphemeralKeyModel.fromJson(Map<String, dynamic> json) {
    return EphemeralKeyModel(
      id: json['id'] as String,
      object: json['object'] as String,
      associatedObjects: (json['associated_objects'] as List<dynamic>)
          .map((e) => AssociatedObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      created: json['created'] as int,
      expires: json['expires'] as int,
      livemode: json['livemode'] as bool,
      secret: json['secret'] as String,
    );
  }
}

class AssociatedObject {
  final String id;
  final String type;

  AssociatedObject({
    required this.id,
    required this.type,
  });

  factory AssociatedObject.fromJson(Map<String, dynamic> json) {
    return AssociatedObject(
      id: json['id'] as String,
      type: json['type'] as String,
    );
  }
}
