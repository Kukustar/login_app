import 'dart:math';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

String getRandomString() {
  Random _rnd = Random();
  return String.fromCharCodes(Iterable.generate(
      5, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)))
  );
}