import 'package:collection/collection.dart';
import 'package:satchel/src/util/equality.dart';

interface class TypeMatcher {}

class Wildcard implements TypeMatcher {}

sealed class StellaType implements TypeMatcher {
  const StellaType();

  StellaType operator >>(StellaType to) {
    return Func(args: [this], returnType: to);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StellaType && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class Bool extends StellaType {
  const Bool();
}

class Nat extends StellaType {
  const Nat();
}

class TypeRef extends StellaType {
  final StellaType type;

  const TypeRef({
    required this.type,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is TypeRef &&
          runtimeType == other.runtimeType &&
          type == other.type;

  @override
  int get hashCode => super.hashCode ^ type.hashCode;
}

class TypeSum extends StellaType {
  final StellaType left;
  final StellaType right;

  const TypeSum({
    required this.left,
    required this.right,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is TypeSum &&
          runtimeType == other.runtimeType &&
          left == other.left &&
          right == other.right;

  @override
  int get hashCode => super.hashCode ^ left.hashCode ^ right.hashCode;
}

class Func extends StellaType {
  final bool lambda;
  final List<StellaType> args;
  final StellaType returnType;

  const Func({
    required this.args,
    required this.returnType,
    this.lambda = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is Func &&
          runtimeType == other.runtimeType &&
          args.equals(other.args) &&
          returnType == other.returnType;

  @override
  int get hashCode => super.hashCode ^ args.hashCode ^ returnType.hashCode;
}

class TypeForAll extends StellaType {
  final List<String> types;
  final StellaType type;

  const TypeForAll({
    required this.types,
    required this.type,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is TypeForAll &&
          runtimeType == other.runtimeType &&
          types.equals(other.types) &&
          type == other.type;

  @override
  int get hashCode => super.hashCode ^ types.hashCode ^ type.hashCode;
}

class TypeRec extends StellaType {
  final String variable;
  final StellaType type;

  TypeRec({
    required this.variable,
    required this.type,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is TypeRec &&
          runtimeType == other.runtimeType &&
          variable == other.variable &&
          type == other.type;

  @override
  int get hashCode => super.hashCode ^ variable.hashCode ^ type.hashCode;
}

class TypeTuple extends StellaType {
  final List<StellaType?> types;

  const TypeTuple({
    required this.types,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is TypeTuple &&
          runtimeType == other.runtimeType &&
          types.equals(other.types, const NullableEquality<StellaType?>());

  @override
  int get hashCode => super.hashCode ^ types.hashCode;
}

class TypeRecord extends StellaType {
  final Map<String, StellaType> types;

  const TypeRecord({
    required this.types,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is TypeRecord &&
          runtimeType == other.runtimeType &&
          MapEquality().equals(types, other.types);

  @override
  int get hashCode => super.hashCode ^ types.hashCode;
}

class TypeVariant extends StellaType {
  final Map<String, StellaType> types;

  const TypeVariant({
    required this.types,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is TypeVariant &&
          runtimeType == other.runtimeType &&
          MapEquality().equals(types, other.types);

  @override
  int get hashCode => super.hashCode ^ types.hashCode;
}

class TypeList extends StellaType {
  final StellaType type;

  const TypeList({
    required this.type,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is TypeList &&
          runtimeType == other.runtimeType &&
          type == other.type;

  @override
  int get hashCode => super.hashCode ^ type.hashCode;
}

class Unit extends StellaType {
  const Unit();
}

class Top extends StellaType {
  const Top();
}

class Bottom extends StellaType {
  const Bottom();
}

class Auto extends StellaType {
  const Auto();
}

class TypeVar extends StellaType {
  final String name;

  const TypeVar(this.name);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is TypeVar &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => super.hashCode ^ name.hashCode;
}
