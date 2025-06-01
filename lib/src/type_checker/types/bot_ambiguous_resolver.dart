import 'dart:collection';

import 'package:satchel/src/type_checker/model/stella_types.dart';

import 'type_system.dart';

class BotAmbiguousResolver implements AmbiguousResolver {
  const BotAmbiguousResolver();

  @override
  StellaType? resolveAmbiguousType(StellaType? type) {
    return switch (type) {
      Bool() => type,
      Nat() => type,
      TypeSum(:final left, :final right) => TypeSum(
          left: resolveAmbiguousType(left) ?? const Bottom(),
          right: resolveAmbiguousType(right) ?? const Bottom(),
        ),
      Func(:final args, :final returnType, :final lambda) => Func(
          args: args
              .map((a) => resolveAmbiguousType(a) ?? const Bottom())
              .toList(),
          returnType: resolveAmbiguousType(returnType) ?? const Bottom(),
          lambda: lambda,
        ),
      TypeForAll() => type,
      TypeRec() => type,
      TypeTuple(:final types) => TypeTuple(
          types: types
              .map((a) => resolveAmbiguousType(a) ?? const Bottom())
              .toList(),
        ),
      TypeRecord(:final types, :final instance) => TypeRecord(
          types: LinkedHashMap.fromEntries(
            types.entries.map(
              (e) => MapEntry(
                e.key,
                resolveAmbiguousType(e.value) ?? const Bottom(),
              ),
            ),
          ),
          instance: instance,
        ),
      TypeVariant(:final types, :final strict) => TypeVariant(
          types: LinkedHashMap.fromEntries(
            types.entries.map(
              (e) => MapEntry(
                e.key,
                resolveAmbiguousType(e.value) ?? const Bottom(),
              ),
            ),
          ),
          strict: strict),
      TypeList(:final type) => TypeList(
          type: resolveAmbiguousType(type) ?? const Bottom(),
        ),
      Panic() => const Bottom(),
      Throw() => const Bottom(),
      Unit() => type,
      Top() => type,
      Bottom() => type,
      Auto() => type,
      TypeVar() => type,
      Wildcard() => type,
      TypeRef(:final type) => TypeRef(
          type: resolveAmbiguousType(type) ?? const Bottom(),
        ),
      ConstMemory(:final type) => ConstMemory(
          resolveAmbiguousType(type) ?? const Bottom(),
        ),
      null => type,
    };
  }
}
