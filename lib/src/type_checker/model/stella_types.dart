import 'dart:collection';

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

  @override
  String toString() {
    return 'Bool{}';
  }
}

class Nat extends StellaType {
  const Nat();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other && other is Nat && runtimeType == other.runtimeType;

  @override
  int get hashCode => 2;

  @override
  String toString() {
    return 'Nat{}';
  }
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

  @override
  String toString() {
    return 'TypeSum{left: $left, right: $right}';
  }
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

  @override
  String toString() {
    return 'Func{lambda: $lambda, args: $args, returnType: $returnType}';
  }
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

  @override
  String toString() {
    return 'TypeForAll{types: $types, type: $type}';
  }
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

  @override
  String toString() {
    return 'TypeRec{variable: $variable, type: $type}';
  }
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

  @override
  String toString() {
    return 'TypeTuple{types: $types}';
  }
}

class TypeRecord extends StellaType {
  static const _mapEquality = MapEquality<String, StellaType?>(
    values: NullableEquality<StellaType?>(),
  );
  static const _keyEquality = IterableEquality<String>();
  static const _valueEquality = IterableEquality<StellaType?>(
    NullableEquality<StellaType?>(),
  );

  final LinkedHashMap<String, StellaType?> types;
  final bool instance;

  const TypeRecord({
    required this.types,
    this.instance = false,
  });

  @override
  bool get isStrict => types.values.every((s) => s?.isStrict ?? false);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is TypeRecord &&
          runtimeType == other.runtimeType &&
          ((instance || other.instance)
              ? _mapEquality.equals(types, other.types)
              : _keyEquality.equals(types.keys, other.types.keys) &&
                  _valueEquality.equals(types.values, other.types.values));

  @override
  int get hashCode {
    final entries = types.entries.toList()..sortBy((e) => e.key);

    return super.hashCode ^
        _keyEquality.hash(entries.map((e) => e.key)) ^
        _valueEquality.hash(entries.map((e) => e.value));
  }

  @override
  String toString() {
    return 'TypeRecord{types: $types, instance: $instance}';
  }
}

enum TypeVariantEquality {
  equals,
  missingDataForLabel,
  unexpectedDataForNullableLabel,
  unexpectedVariantLabel,
  notEqual
}

class TypeVariant extends StellaType {
  static const _keyEquality = IterableEquality<String>();
  static const _valueEquality = IterableEquality<StellaType?>(
    NullableEquality<StellaType?>(),
  );

  final LinkedHashMap<String, StellaType?> types;
  final bool strict;

  const TypeVariant({
    required this.types,
    this.strict = true,
  });

  factory TypeVariant.merge(Iterable<TypeVariant> variants) {
    return TypeVariant(
      types: LinkedHashMap.fromIterables(
        variants.expand((e) => e.types.keys),
        variants.expand((e) => e.types.values),
      ),
      strict: false,
    );
  }

  @override
  bool get isStrict => strict;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (super != other ||
        other is! TypeVariant ||
        runtimeType != other.runtimeType) {
      return false;
    }

    return equals(this, other) == TypeVariantEquality.equals;
  }

  static TypeVariantEquality equals(TypeVariant lhs, TypeVariant rhs) {
    if (lhs.strict && rhs.strict) {
      return _keyEquality.equals(lhs.types.keys, rhs.types.keys) &&
              _valueEquality.equals(lhs.types.values, rhs.types.values)
          ? TypeVariantEquality.equals
          : TypeVariantEquality.notEqual;
    }

    if (!lhs.strict && !rhs.strict) {
      return rhs.types.entries.every((e) {
        final type = lhs.types[e.key];
        return type == null || type == e.value;
      })
          ? TypeVariantEquality.equals
          : TypeVariantEquality.notEqual;
    }

    final strict = lhs.strict ? lhs : rhs;
    final nonStrict = lhs.strict ? rhs : lhs;

    for (final nonStrictEntry in nonStrict.types.entries) {
      if (!strict.types.containsKey(nonStrictEntry.key)) {
        return TypeVariantEquality.unexpectedVariantLabel;
      }

      final expected = strict.types[nonStrictEntry.key];
      final actual = nonStrictEntry.value;

      switch ((expected, actual)) {
        case (null, StellaType()):
          return TypeVariantEquality.unexpectedDataForNullableLabel;
        case (StellaType(), null):
          return TypeVariantEquality.missingDataForLabel;
        case final (StellaType, StellaType) types:
          if (types.$1 != types.$2) {
            return TypeVariantEquality.notEqual;
          }
        default:
      }
    }

    return TypeVariantEquality.equals;
  }

  @override
  int get hashCode =>
      super.hashCode ^
      _keyEquality.hash(types.keys) ^
      _valueEquality.hash(types.values);

  @override
  String toString() {
    return 'TypeVariant{types: $types, strict: $strict}';
  }
}

class TypeList extends StellaType {
  final StellaType? type;

  const TypeList({
    this.type,
  });

  @override
  bool get isStrict => type?.isStrict ?? false;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is TypeList &&
          runtimeType == other.runtimeType &&
          (type == null || other.type == null || type == other.type);

  @override
  int get hashCode => super.hashCode ^ type.hashCode;

  @override
  String toString() {
    return 'TypeList{type: $type}';
  }
}

class Unit extends StellaType {
  const Unit();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other && other is Unit && runtimeType == other.runtimeType;

  @override
  int get hashCode => 3;

  @override
  String toString() {
    return 'Unit{}';
  }
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

  @override
  String toString() {
    return 'TypeVar{name: $name}';
  }
}
