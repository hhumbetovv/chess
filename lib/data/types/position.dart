import 'package:chess/data/constants/direction.dart';

typedef Position = ({int x, int y});

extension PositionExtension on Position {
  Position copyWith({
    int? x,
    int? y,
  }) {
    return (
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }

  Position up() {
    return (x: this.x, y: this.y - 1);
  }

  Position down() {
    return (x: this.x, y: this.y + 1);
  }

  Position right() {
    return (x: this.x + 1, y: this.y);
  }

  Position left() {
    return (x: this.x - 1, y: this.y);
  }

  Position to(Direction direction) {
    return switch (direction) {
      Direction.up => up(),
      Direction.down => down(),
      Direction.left => left(),
      Direction.right => right(),
      Direction.upRight => up().right(),
      Direction.upLeft => up().left(),
      Direction.downRight => down().right(),
      Direction.downLeft => down().left(),
    };
  }

  Position operator +(Position other) {
    return (x: this.x + other.x, y: this.y + other.y);
  }
}
