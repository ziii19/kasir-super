import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ShareHelper {
  ShareHelper._();

  static Future<void> shareImage(
    BuildContext context,
    Uint8List image,
    String referenceId,
  ) async {
    final box = context.findRenderObject() as RenderBox?;

    final directory = await getApplicationDocumentsDirectory();
    final imagePath = await File('${directory.path}/$referenceId.png').create();
    await imagePath.writeAsBytes(image);

    await Share.shareXFiles(
      [XFile(imagePath.path)],
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }
}
