import 'package:collection/collection.dart';

sealed class StellaType {
  const StellaType();
}

class Bool extends StellaType {
  const Bool();
}

class Nat extends StellaType {
  const Nat();
}

class Func extends StellaType {
  final List<StellaType> args;
  final StellaType returnType;

  const Func({
    required this.args,
    required this.returnType,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Func &&
          runtimeType == other.runtimeType &&
          args.equals(other.args) &&
          returnType == other.returnType;

  @override
  int get hashCode => args.hashCode ^ returnType.hashCode;
}
