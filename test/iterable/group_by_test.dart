import 'package:flutter_test/flutter_test.dart';
import 'package:supercharged/supercharged.dart';

void main() {
  test("list group by (without value transform)", () {
    expect(() => [1, 2, 3].groupBy(null), throwsArgumentError);

    expect(
        [1, 2, 3, 4].groupBy((el) => el < 3 ? "small" : "large"),
        equals({
          "small": [1, 2],
          "large": [3, 4]
        }));

    expect(
        [1, 2, 3, 4, 5, 6].groupBy((el) => el % 2 == 0 ? "even" : "odd"),
        equals({
          "even": [2, 4, 6],
          "odd": [1, 3, 5]
        }));

    expect(
        {"dog", "hamster", "cat", "coyote", "beaver", "fish"}.groupBy(
            (el) => el.length <= 4 ? "short animal name" : "long animal name"),
        equals({
          "short animal name": ["dog", "cat", "fish"],
          "long animal name": ["hamster", "coyote", "beaver"]
        }));

    expect([].groupBy((el) => el < 3 ? "small" : "large"), equals({}));
  });

  test("list group by (with value transform)", () {
    expect(
        [-1, -2, 3, 4].groupBy((el) => el < 0 ? "negative" : "positive",
            valueTransform: (el) => el.abs()),
        equals({
          "negative": [1, 2],
          "positive": [3, 4]
        }));
  });
}
