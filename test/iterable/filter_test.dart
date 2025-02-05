import 'package:flutter_test/flutter_test.dart';
import 'package:supercharged/supercharged.dart';

void main() {
  test("iterable filter", () {
    expect(() => [1, 2, 3].filter(null), throwsArgumentError);
    expect([].filter((n) => n < 3).toList(), equals([]));
    expect([1, 2, 3, 4].filter((n) => n < 3).toList(), equals([1, 2]));
    expect(
        [1, 2, 3, 4]
            .filter((n) => n < 3)
            .map((n) => n * 2)
            .reduce((value, n) => value + n),
        equals(6));
  });
}
