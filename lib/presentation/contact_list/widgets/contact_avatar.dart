import "dart:typed_data";

import "package:flutter/material.dart";
import "package:icons_plus/icons_plus.dart";

class ContactAvatar extends StatelessWidget {
  const ContactAvatar({this.avatar, super.key, this.size});
  final Uint8List? avatar;
  final double? size;

  @override
  Widget build(final BuildContext context) => CircleAvatar(
        radius: size,
        foregroundImage: avatar != null ? MemoryImage(avatar!) : null,
        child: avatar != null ? null : const Icon(Iconsax.user_outline),
      );
}
