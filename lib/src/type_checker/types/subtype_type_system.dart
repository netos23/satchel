import 'package:collection/collection.dart';
import 'package:satchel/src/util/iterable.dart';

import '../../util/equality.dart';
import '../model/stella_types.dart';
import 'type_system.dart';

final class SubtypeTypeSystem implements InheritanceSystem {
  const SubtypeTypeSystem();

  @override
  bool instanceOf(StellaType? clazz, StellaType? base) {
    return switch ((clazz, base)) {
      (_, Top()) => true,
      (Bottom(), _) => true,
      final (TypeReference, TypeReference) refs => _inferReferences(refs),
      final (TypeSum, TypeSum) sums => _inferSums(sums),
      final (Func, Func) functions => _inferFunctions(functions),
      final (TypeTuple, TypeTuple) tuples => _inferTuples(tuples),
      final (TypeRecord, TypeRecord) records => _inferRecords(records),
      final (TypeVariant, TypeVariant) variants => _inferVariants(variants),
      final (TypeList, TypeList) lists => _inferLists(lists),
      (_, _) => NullableEquality<StellaType?>().equals(clazz, base),
    };
  }

  bool _inferRecords((TypeRecord, TypeRecord) records) {
    final (clazz, base) = records;

    for (final entry in base.types.entries) {
      final clazzPart = clazz.types[entry.key];

      if (clazzPart == null && entry.value != null) {
        return false;
      }

      if (!instanceOf(clazzPart, entry.value)) {
        return false;
      }
    }

    return true;
  }

  bool _inferVariants((TypeVariant, TypeVariant) variants) {
    final (clazz, base) = variants;

    if (clazz.isStrict && base.isStrict) {
      for (final entry in clazz.types.entries) {
        final basePart = base.types[entry.key];

        if (basePart == null && entry.value != null) {
          return false;
        }

        if (!instanceOf(entry.value, basePart)) {
          return false;
        }
      }

      return true;
    }

    return TypeVariant.equals(clazz, base, this) == TypeVariantEquality.equals;
  }

  bool _inferTuples((TypeTuple, TypeTuple) tuples) {
    final (clazz, base) = tuples;

    return ListEquality(DelegatingEquality(instanceOf)).equals(
      clazz.types,
      base.types,
    );
  }

  bool _inferReferences((TypeReference, TypeReference) ref) {
    return switch (ref) {
      (TypeRef(), TypeRef()) => instanceOf(ref.$1.type, ref.$2.type),
      (TypeRef(), ConstMemory(:final type?)) => instanceOf(ref.$1.type, type),
      (ConstMemory(:final type?), TypeRef()) => instanceOf(type, ref.$2.type),
      (ConstMemory(), ConstMemory()) => ref.$1.type == null ||
          ref.$2.type == null ||
          instanceOf(ref.$1.type!, ref.$2.type!),
      (_, _) => true,
    };
  }

  bool _inferSums((TypeSum, TypeSum) sums) {
    final (clazz, base) = sums;

    return instanceOf(clazz.left, base.left) &&
        instanceOf(clazz.right, base.right);
  }

  bool _inferFunctions((Func, Func) functions) {
    final equality = ListEquality(
      DelegatingEquality(instanceOf),
    );
    final (clazz, base) = functions;
    return instanceOf(clazz.returnType, base.returnType) &&
        equality.equals(base.args, clazz.args);
  }

  bool _inferLists((TypeList, TypeList) lists) {
    final (clazz, base) = lists;
    return instanceOf(clazz.type, base.type);
  }

  bool _inferRawLists(List<StellaType> lhs, List<StellaType> rhs) {
    return UnorderedIterableEquality(
      DelegatingEquality(instanceOf),
    ).equals(lhs, rhs);
  }

  @override
  StellaType? resolveAmbiguousType(StellaType? type) {
    // TODO: implement ambiguousType
    throw UnimplementedError();
  }
}
