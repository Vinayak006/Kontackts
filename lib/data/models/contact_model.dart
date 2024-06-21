import "../../domain/entities/contact_entity.dart";

class ContactModel extends ContactEntity {
  ContactModel({
    required super.id,
    required super.name,
    required super.thumbnail,
    required super.avatar,
    required super.phone,
  });
}
