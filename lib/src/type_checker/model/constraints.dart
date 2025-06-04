import 'package:satchel/satchel.dart';

class Constraints {
  final StellaType lhs;
  final StellaType rhs;

  Constraints({required this.lhs, required this.rhs});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Constraints &&
          runtimeType == other.runtimeType &&
          lhs == other.lhs &&
          rhs == other.rhs;

  @override
  int get hashCode => lhs.hashCode ^ rhs.hashCode;

  @override
  String toString() {
    return 'Constraints{ $lhs = $rhs }';
  }
}