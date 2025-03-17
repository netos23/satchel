import 'package:collection/collection.dart';
import 'package:satchel/src/util/equality.dart';

interface class TypeMatcher {}

class Wildcard implements TypeMatcher {}

sealed class StellaType implements TypeMatcher {
  const StellaType();

  StellaType operator >>(StellaType to) {
    return Func(args: [this], returnType: to);
  }

  bool get isStrict => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StellaType && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class Bool extends StellaType {
  const Bool();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other && other is Bool && runtimeType == other.runtimeType;

  @override
  int get hashCode => 1;
}

class Nat extends StellaType {
  const Nat();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other && other is Nat && runtimeType == other.runtimeType;

  @override
  int get hashCode => 2;
}

class TypeRef extends StellaType {
  final StellaType type;

  const TypeRef({
    required this.type,
  });

  @override
  bool get isStrict => type.isStrict;

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
  static const _equality = NullableEquality<StellaType?>();
  final StellaType? left;
  final StellaType? right;

  const TypeSum({
    this.left,
    this.right,
  });

  @override
  bool get isStrict => left != null && right != null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is TypeSum &&
          runtimeType == other.runtimeType &&
          _equality.equals(left, other.left) &&
          _equality.equals(right, other.right);

  @override
  int get hashCode => super.hashCode ^ left.hashCode ^ right.hashCode;
}

class Func extends StellaType {
  final bool lambda;
  final List<StellaType> args;
  final StellaType returnType;

  @override
  bool get isStrict => [...args, returnType].every((s) => s.isStrict);

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
  bool get isStrict => type.isStrict;

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
  bool get isStrict => type.isStrict;

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
  static const _equality = ListEquality<StellaType?>(
    NullableEquality<StellaType?>(),
  );

  final List<StellaType?> types;

  const TypeTuple({
    required this.types,
  });

  @override
  bool get isStrict => types.every((s) => s?.isStrict ?? false);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is TypeTuple &&
          runtimeType == other.runtimeType &&
          _equality.equals(types, other.types);

  @override
  int get hashCode => super.hashCode ^ _equality.hash(types);
}

class TypeRecord extends StellaType {
  static const _equality = MapEquality<String, StellaType?>(
    values: NullableEquality<StellaType?>(),
  );

  final Map<String, StellaType?> types;

  const TypeRecord({
    required this.types,
  });

  @override
  bool get isStrict => types.values.every((s) => s?.isStrict ?? false);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is TypeRecord &&
          runtimeType == other.runtimeType &&
          _equality.equals(types, other.types);

  @override
  int get hashCode => super.hashCode ^ _equality.hash(types);
}

class TypeVariant extends StellaType {
  static const _equality = MapEquality<String, StellaType?>(
    values: NullableEquality<StellaType?>(),
  );

  final Map<String, StellaType?> types;

  const TypeVariant({
    required this.types,
  });

  @override
  bool get isStrict => types.values.every((s) => s?.isStrict ?? false);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is TypeVariant &&
          runtimeType == other.runtimeType &&
          _equality.equals(types, other.types);

  @override
  int get hashCode => super.hashCode ^ _equality.hash(types);
}

class TypeList extends StellaType {
  final StellaType type;

  const TypeList({
    required this.type,
  });

  @override
  bool get isStrict => type.isStrict;

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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other && other is Unit && runtimeType == other.runtimeType;

  @override
  int get hashCode => 3;
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
