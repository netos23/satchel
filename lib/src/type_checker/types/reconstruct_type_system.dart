import 'package:satchel/src/type_checker/model/stella_types.dart';
import 'package:satchel/src/type_checker/types/type_system.dart';
import 'package:satchel/src/util/iterable.dart';

class ReconstructTypeSystem implements InheritanceSystem {
  const ReconstructTypeSystem();

  @override
  bool instanceOf(StellaType? clazz, StellaType? base) {
    if (clazz == null || base == null) {
      return false;
    }

    final constraint = (clazz, base);
    if (constraint case (
      TypeSum(left: final ll, right: final lr),
      TypeSum(left: final rl, right: final rr),
    )) {
      return instanceOf(ll, lr) && instanceOf(rl, rr);
    } else if (constraint case (
      Func(args: final lArgs, returnType: final lRet),
      Func(args: final rArgs, returnType: final rRet),
    )) {
      return lArgs.length == rArgs.length &&
          ZipIterable(lArgs, rArgs).every((a) => instanceOf(a.$1, a.$2)) &&
          instanceOf(lRet, rRet);
    } else if (constraint case (
      TypeTuple(types: final lTypes),
      TypeTuple(types: final rTypes),
    )) {
      return ZipIterable(lTypes, rTypes).every((a) => instanceOf(a.$1, a.$2));
    } else if (constraint case (
      TypeRecord(types: final lMap),
      TypeRecord(types: final rMap),
    )) {
      for (final entry in rMap.entries) {
        final clazzPart = lMap[entry.key];

        if (clazzPart == null && entry.value != null) {
          return false;
        }

        if (!instanceOf(clazzPart, entry.value)) {
          return false;
        }
      }

      return true;
    } else if (constraint case (
      TypeVariant(types: final lMap),
      TypeVariant(types: final rMap),
    )) {
      if (clazz.isStrict && base.isStrict) {
        for (final entry in lMap.entries) {
          final basePart = rMap[entry.key];

          if (basePart == null && entry.value != null) {
            return false;
          }

          if (!instanceOf(entry.value, basePart)) {
            return false;
          }
        }

        return true;
      }

      return TypeVariant.equals(
            clazz as TypeVariant,
            base as TypeVariant,
            this,
          ) ==
          TypeVariantEquality.equals;
    } else if (constraint case (
      TypeList(type: final lItem?),
      TypeList(type: final rItem?),
    )) {
      return instanceOf(lItem, rItem);
    } else {
      return clazz is Wildcard || base is Wildcard || base == clazz;
    }
  }
}
