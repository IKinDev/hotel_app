import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_app/resources/resources.dart';

void main() {
  test('custom_icons assets test', () {
    expect(File(CustomIcons.partyPopper).existsSync(), isTrue);
    expect(File(CustomIcons.vector55).existsSync(), isTrue);
    expect(File(CustomIcons.closeSquare).existsSync(), isTrue);
    expect(File(CustomIcons.emojiHappy).existsSync(), isTrue);
    expect(File(CustomIcons.plust).existsSync(), isTrue);
    expect(File(CustomIcons.tickSquare).existsSync(), isTrue);
    expect(File(CustomIcons.vector3).existsSync(), isTrue);
  });
}
