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

class TypeRef extends StellaType {
  final StellaType type;

  const TypeRef({
    required this.type;
  });
}

class TypeSum extends StellaType {
  final StellaType left;
  final StellaType rigth;

  const TypeSum({
    required this.left;
    required this.right;
  });
}


// TODO(netos23): add TypeForAll, TypeRec

class TypeTuple extends StellaType {
  final List<StellaType> types;

  const TypeTuple({
    required this.types,
  });
}

class TypeRecord extends StellaType {
  final Map<String, StellaType> types;

  const TypeRecord({
    this.types,
  });
}

class TypeVariant extends StellaType {
  final Map<String, StellaType> types;

  const TypeVariant({
    this.types,
  });
}

class TypeList extends StellaType {
  final StellaType type;

  const TypeList({
    required this.type;
  });
}

class Unit extends StellaType {
  const Unit();
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
