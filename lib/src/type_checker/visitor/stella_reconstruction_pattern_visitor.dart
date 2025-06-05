import 'package:collection/collection.dart';
import 'package:satchel/satchel.dart';
import 'package:satchel/src/antlr/StellaParser.dart';
import 'package:satchel/src/type_checker/types/variable_generator.dart';
import 'package:satchel/src/type_checker/visitor/stella_reconstruction_visitor.dart';
import 'package:satchel/src/type_checker/visitor/stella_type_visitor.dart';
import 'package:satchel/src/util/extensions.dart';
import 'package:satchel/src/util/iterable.dart';

import '../../antlr/StellaParserBaseVisitor.dart';
import '../model/stella_patterns.dart';

class StellaReconstructionPatternVisitor
    extends StellaParserBaseVisitor<StellaPattern> {
  final StellaType? patternForType;

  StellaReconstructionPatternVisitor([this.patternForType]);

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
    if (patternForType is! Bool && patternForType is! TypeVar) {
      throw ArgumentError('Wrong pattern for type');
    }

    return ValueBoolStellaPattern(false);
  }

  @override
  StellaPattern? visitPatternTrue(PatternTrueContext ctx) {
    if (patternForType is! Bool && patternForType is! TypeVar) {
      throw ArgumentError('Wrong pattern for type');
    }

    return ValueBoolStellaPattern(true);
  }

  @override
  StellaPattern? visitPatternUnit(PatternUnitContext ctx) {
    if (patternForType is! Unit && patternForType is! TypeVar) {
      throw ArgumentError('Wrong pattern for type');
    }

    return UnitStellaPattern();
  }

  @override
  StellaPattern? visitPatternInt(PatternIntContext ctx) {
    if (patternForType is! Nat && patternForType is! TypeVar) {
      throw ArgumentError('Wrong pattern for type');
    }

    return ConstNatStellaPattern(int.parse(ctx.n!.text!));
  }

  @override
  StellaPattern? visitPatternSucc(PatternSuccContext ctx) {
    if (patternForType is! Nat && patternForType is! TypeVar) {
      throw ArgumentError('Wrong pattern for type');
    }

    final nested = ctx.pattern_!.accept(this);

    if (nested is! NatStellaPattern) {
      throw ArgumentError('Wrong pattern');
    }

    return SuccNatStellaPattern(nested);
  }

  @override
  StellaPattern? visitPatternAsc(PatternAscContext ctx) {
    final type = ctx.type_!.accept(StellaReconstructionTypeVisitor())!;

    if (type is ErrorTypeReport) {
      throw type;
    }

    final expected = patternForType;
    if (expected != null && !type.hasType(expected)) {
      throw ArgumentError('Wrong pattern for type');
    }

    return ctx.pattern_?.accept(
      StellaReconstructionPatternVisitor(type.typeOrNull),
    );
  }

  @override
  StellaPattern? visitPatternInl(PatternInlContext ctx) {
    final sum = patternForType;

    if (sum is! TypeSum && patternForType is! TypeVar) {
      throw ArgumentError('Wrong pattern for type');
    }

    final type = ctx.pattern_!.accept(
      StellaReconstructionPatternVisitor(
        sum.tryAs<TypeSum>()?.left ?? VariableGenerator.instance.nextVariable(),
      ),
    );
    return InlStellaPattern(type!);
  }

  @override
  StellaPattern? visitPatternInr(PatternInrContext ctx) {
    final sum = patternForType;

    if (sum is! TypeSum && patternForType is! TypeVar) {
      throw ArgumentError('Wrong pattern for type');
    }

    final type = ctx.pattern_!.accept(
      StellaReconstructionPatternVisitor(
        sum.tryAs<TypeSum>()?.right ??
            VariableGenerator.instance.nextVariable(),
      ),
    );
    return InrStellaPattern(type!);
  }

  @override
  StellaPattern? visitPatternTuple(PatternTupleContext ctx) {
    final tuple = patternForType;

    if (tuple is! TypeTuple && patternForType is! TypeVar) {
      throw ArgumentError('Wrong pattern for type');
    }

    if (ctx.pttrs.length != tuple.tryAs<TypeTuple>()?.types.length) {
      throw ArgumentError(
        'Unexpected Tuple length. \n'
        'Expected: ${tuple.tryAs<TypeTuple>()?.types.length}\n'
        'Actual: ${ctx.pttrs.length}',
      );
    }

    final patterns = ctx.pttrs
        .mapIndexed(
          (i, p) => p.accept(
            StellaReconstructionPatternVisitor(
              tuple.tryAs<TypeTuple>()?.types[i] ??
                  VariableGenerator.instance.nextVariable(),
            ),
          ),
        )
        .whereType<StellaPattern>()
        .toList();

    return TupleStellaPattern(patterns);
  }

  @override
  StellaPattern? visitPatternRecord(PatternRecordContext ctx) {
    final record = patternForType;

    if (record is! TypeRecord && patternForType is! TypeVar) {
      throw ArgumentError('Wrong pattern for type');
    }

    final labels = ctx.pttrs.map((p) => p.label!.text!).toList();

    if (labels.length != labels.toSet().length) {
      throw StateError('Duplicate label name');
    }

    final patterns = ZipIterable(labels, ctx.pttrs).map((p) {
      if (!(record.tryAs<TypeRecord>()?.types.containsKey(p.$1) ?? true)) {
        throw ArgumentError('Wrong label for record');
      }

      return p.$2.pattern_!.accept(
        StellaReconstructionPatternVisitor(
          record.tryAs<TypeRecord>()?.types[p.$1] ??
              VariableGenerator.instance.nextVariable(),
        ),
      )!;
    });

    return RecordStellaPattern(Map.fromIterables(labels, patterns));
  }

  @override
  StellaPattern? visitPatternList(PatternListContext ctx) {
    final list = patternForType;

    if (list is! TypeList && patternForType is! TypeVar) {
      throw ArgumentError('Wrong pattern for type');
    }

    final patterns = ctx.pttrs
        .map(
          (e) => e.accept(
            StellaReconstructionPatternVisitor(
              list.tryAs<TypeList>()?.type ??
                  VariableGenerator.instance.nextVariable(),
            ),
          ),
        )
        .whereType<StellaPattern>()
        .toList();

    return ListListStellaPattern(patterns);
  }

  @override
  StellaPattern? visitPatternCons(PatternConsContext ctx) {
    final list = patternForType;

    if (list is! TypeList && patternForType is! TypeVar) {
      throw ArgumentError('Wrong pattern for type');
    }

    final head = ctx.head!.accept(
      StellaReconstructionPatternVisitor(
        list.tryAs<TypeList>()?.type ??
            VariableGenerator.instance.nextVariable(),
      ),
    )!;
    final tail = ctx.tail!.accept(StellaReconstructionPatternVisitor(list))!;

    return ConsListStellaPattern(head, tail);
  }

  @override
  StellaPattern? visitPatternVariant(PatternVariantContext ctx) {
    final variant = patternForType;

    if (variant is! TypeVariant && patternForType is! TypeVar) {
      throw ArgumentError('Wrong pattern for type');
    }

    final label = ctx.label!.text!;
    if (!(variant.tryAs<TypeVariant>()?.types.containsKey(label) ?? true)) {
      throw ArgumentError('Wrong pattern for type');
    }
    final type = variant.tryAs<TypeVariant>()?.types[label];

    if (patternForType is! TypeVar && type == null && ctx.pattern_ != null) {
      throw UnsupportedError('Null pattern expected');
    }

    if (patternForType is! TypeVar && type != null && ctx.pattern_ == null) {
      throw RangeError.value(1);
    }

    final pattern = ctx.pattern_?.accept(
      StellaReconstructionPatternVisitor(type),
    );

    return VariantStellaPattern(label, pattern);
  }

  @override
  StellaPattern? visitParenthesisedPattern(ParenthesisedPatternContext ctx) {
    return ctx.pattern_?.accept(this);
  }
}
