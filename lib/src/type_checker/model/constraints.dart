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

  Constraints replace(StellaType variable, StellaType replacement) {
    if (lhs == variable) {
      return Constraints(lhs: replacement, rhs: rhs);
    }

    if (rhs == variable) {
      return Constraints(lhs: lhs, rhs: replacement);
    }

    return this;
  }
}

extension ConstraintsHelper on StellaType? {
  Set<TypeVar> freeVars() {
    return _freeVars().toSet();
  }

  Iterable<TypeVar> _freeVars() {
    return switch (this) {
      TypeSum(:final left, :final right) => left._freeVars().followedBy(
        right._freeVars(),
      ),
      Func(:final args, :final returnType) =>
        args.expand((a) => a._freeVars()).followedBy(returnType._freeVars()),
      // TypeForAll(:final type) => type._freeVars(),
      TypeTuple(:final types) => types.expand((t) => t._freeVars()),
      TypeRecord(:final types) => types.values.expand((t) => t._freeVars()),
      TypeVariant(:final types) => types.values.expand((t) => t._freeVars()),
      TypeList(:final type) => type._freeVars(),
      final TypeVar typeVar => [typeVar],
      _ => [],
    };
  }
}
