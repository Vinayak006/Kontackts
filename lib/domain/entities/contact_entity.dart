import "dart:typed_data";

import "phone_entity.dart";

class ContactEntity {
  ContactEntity({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.avatar,
    required this.phone,
  });

  final String id;
  final String name;
  final Uint8List? thumbnail;
  final Uint8List? avatar;
  final List<PhoneEntity> phone;
}
