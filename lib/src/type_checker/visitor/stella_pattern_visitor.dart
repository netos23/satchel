import 'package:collection/collection.dart';
import 'package:satchel/satchel.dart';
import 'package:satchel/src/antlr/StellaParser.dart';
import 'package:satchel/src/type_checker/visitor/stella_type_visitor.dart';
import 'package:satchel/src/util/iterable.dart';

import '../../antlr/StellaParserBaseVisitor.dart';
import '../model/stella_patterns.dart';

class StellaPatternVisitor extends StellaParserBaseVisitor<StellaPattern> {
  final StellaType? patternForType;

  StellaPatternVisitor(this.patternForType);

  @override
  StellaPattern? visitPatternVar(PatternVarContext ctx) {
    final name = ctx.name!.text!;

    return IdentifierPattern(
      name,
      StellaTypesContext.single(name, patternForType!),
    );
  }

  @override
  StellaPattern? visitPatternFalse(PatternFalseContext ctx) {
    if (patternForType is! Bool) {
      throw ArgumentError('Wrong pattern for type');
    }

    return ValueBoolStellaPattern(false);
  }

  @override
  StellaPattern? visitPatternTrue(PatternTrueContext ctx) {
    if (patternForType is! Bool) {
      throw ArgumentError('Wrong pattern for type');
    }

    return ValueBoolStellaPattern(true);
  }

  @override
  StellaPattern? visitPatternUnit(PatternUnitContext ctx) {
    if (patternForType is! Unit) {
      throw ArgumentError('Wrong pattern for type');
    }

    return UnitStellaPattern();
  }

  @override
  StellaPattern? visitPatternInt(PatternIntContext ctx) {
    if (patternForType is! Nat) {
      throw ArgumentError('Wrong pattern for type');
    }

    return ConstNatStellaPattern(int.parse(ctx.n!.text!));
  }

  @override
  StellaPattern? visitPatternSucc(PatternSuccContext ctx) {
    if (patternForType is! Nat) {
      throw ArgumentError('Wrong pattern for type');
    }

    final nested = ctx.accept(this);

    if (nested is! NatStellaPattern) {
      throw ArgumentError('Wrong pattern');
    }

    return SuccNatStellaPattern(nested);
  }

  @override
  StellaPattern? visitPatternAsc(PatternAscContext ctx) {
    final type = ctx.type_!.accept(StellaTypeVisitor());

    if (type is ErrorTypeReport) {
      throw type;
    }

    return ctx.pattern_?.accept(StellaPatternVisitor(type?.typeOrNull));
  }

  @override
  StellaPattern? visitPatternInl(PatternInlContext ctx) {
    final sum = patternForType;

    if (sum is! TypeSum) {
      throw ArgumentError('Wrong pattern for type');
    }

    final type = ctx.pattern_!.accept(StellaPatternVisitor(sum.left));
    return InlStellaPattern(type!);
  }

  @override
  StellaPattern? visitPatternInr(PatternInrContext ctx) {
    final sum = patternForType;

    if (sum is! TypeSum) {
      throw ArgumentError('Wrong pattern for type');
    }

    final type = ctx.pattern_!.accept(StellaPatternVisitor(sum.right));
    return InrStellaPattern(type!);
  }

  @override
  StellaPattern? visitPatternTuple(PatternTupleContext ctx) {
    final tuple = patternForType;

    if (tuple is! TypeTuple) {
      throw ArgumentError('Wrong pattern for type');
    }

    final patterns = ctx.pttrs
        .mapIndexed((i, p) => p.accept(StellaPatternVisitor(tuple.types[i])))
        .whereType<StellaPattern>()
        .toList();

    return TupleStellaPattern(patterns);
  }

  @override
  StellaPattern? visitPatternRecord(PatternRecordContext ctx) {
    final record = patternForType;

    if (record is! TypeRecord) {
      throw ArgumentError('Wrong pattern for type');
    }

    final labels = ctx.pttrs.map((p) => p.label!.text!).toList();

    if (labels.length != labels.toSet().length) {
      throw StateError('Duplicate label name');
    }

    final patterns = ZipIterable(labels, ctx.pttrs).map((p) {
      if (!record.types.containsKey(p.$1)) {
        throw ArgumentError('Wrong label for record');
      }

      return p.$2.pattern_!.accept(
        StellaPatternVisitor(record.types[p.$1]),
      )!;
    });

    return RecordStellaPattern(Map.fromIterables(labels, patterns));
  }

  @override
  StellaPattern? visitPatternList(PatternListContext ctx) {
    final list = patternForType;

    if (list is! TypeList) {
      throw ArgumentError('Wrong pattern for type');
    }

    final patterns = ctx.pttrs
        .map((e) => e.accept(StellaPatternVisitor(list.type)))
        .whereType<StellaPattern>()
        .toList();

    return ListListStellaPattern(patterns);
  }

  @override
  StellaPattern? visitPatternCons(PatternConsContext ctx) {
    final list = patternForType;

    if (list is! TypeList) {
      throw ArgumentError('Wrong pattern for type');
    }

    final head = ctx.head!.accept(StellaPatternVisitor(list.type))!;
    final tail = ctx.tail!.accept(StellaPatternVisitor(list.type))!;

    return ConsListStellaPattern(head, tail);
  }

  @override
  StellaPattern? visitPatternVariant(PatternVariantContext ctx) {
    final variant = patternForType;

    if (variant is! TypeVariant) {
      throw ArgumentError('Wrong pattern for type');
    }

    final label = ctx.label!.text!;
    if (!variant.types.containsKey(label)) {
      throw ArgumentError('Wrong pattern for type');
    }
    final type = variant.types[label];

    if (type == null && ctx.pattern_ != null) {
      throw UnsupportedError('Null pattern expected');
    }

    if (type != null && ctx.pattern_ == null) {
      throw RangeError.value(1);
    }

    final pattern = ctx.pattern_?.accept(StellaPatternVisitor(type));

    return VariantStellaPattern(label, pattern);
  }
}
