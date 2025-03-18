import 'dart:collection';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:satchel/src/type_checker/model/stella_types.dart';
import 'package:satchel/src/type_checker/model/stella_types_context.dart';
import 'package:satchel/src/util/extensions.dart';

const _equality = DeepCollectionEquality();

abstract interface class StellaPattern {
  StellaTypesContext get patternContext;

  bool get wildCard;
}

class IdentifierPattern
    implements
        StellaPattern,
        UnitStellaPattern,
        BoolStellaPattern,
        NatStellaPattern,
        SumStellaPattern,
        TupleStellaPattern,
        RecordStellaPattern,
        ListStellaPattern,
        VariantStellaPattern {
  final String name;

  StellaType? get type => patternContext[name];

  @override
  final StellaTypesContext patternContext;

  IdentifierPattern(
    this.name,
    this.patternContext,
  );

  @override
  bool get wildCard => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IdentifierPattern &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}

abstract class BoolStellaPattern implements StellaPattern {}

class ValueBoolStellaPattern implements BoolStellaPattern {
  final bool value;

  ValueBoolStellaPattern(this.value);

  @override
  StellaTypesContext get patternContext => const StellaTypesContext();

  @override
  bool get wildCard => false;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ValueBoolStellaPattern &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

class UnitStellaPattern implements StellaPattern {
  @override
  StellaTypesContext get patternContext => const StellaTypesContext();

  @override
  bool get wildCard => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitStellaPattern && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

abstract class NatStellaPattern implements StellaPattern {}

abstract class NatEvalStellaPattern implements NatStellaPattern {
  int? get eval;

  int get depth;
}

class ConstNatStellaPattern implements NatEvalStellaPattern {
  final int value;

  ConstNatStellaPattern(this.value);

  @override
  StellaTypesContext get patternContext => const StellaTypesContext();

  @override
  bool get wildCard => false;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConstNatStellaPattern &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  int? get eval => value;

  @override
  int get depth => 1;
}

class SuccNatStellaPattern implements NatEvalStellaPattern {
  final NatStellaPattern next;

  SuccNatStellaPattern(this.next);

  @override
  StellaTypesContext get patternContext => next.patternContext;

  @override
  bool get wildCard => false;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SuccNatStellaPattern &&
          runtimeType == other.runtimeType &&
          next == other.next;

  @override
  int get hashCode => next.hashCode;

  @override
  int? get eval {
    final pattern = next;
    return (pattern is NatEvalStellaPattern && pattern.eval != null)
        ? (1 + pattern.eval!)
        : null;
  }

  @override
  int get depth {
    final pattern = next;
    return 1 + ((pattern is NatEvalStellaPattern) ? pattern.depth! : 0);
  }
}

abstract class SumStellaPattern implements StellaPattern {}

class InlStellaPattern implements SumStellaPattern {
  final StellaPattern left;

  InlStellaPattern(this.left);

  @override
  StellaTypesContext get patternContext => left.patternContext;

  @override
  bool get wildCard => false;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InlStellaPattern &&
          runtimeType == other.runtimeType &&
          left == other.left;

  @override
  int get hashCode => 1 ^ left.hashCode;
}

class InrStellaPattern implements SumStellaPattern {
  final StellaPattern right;

  InrStellaPattern(this.right);

  @override
  StellaTypesContext get patternContext => right.patternContext;

  @override
  bool get wildCard => false;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InrStellaPattern &&
          runtimeType == other.runtimeType &&
          right == other.right;

  @override
  int get hashCode => 7 ^ right.hashCode;
}

abstract class TupleStellaPattern implements StellaPattern {
  factory TupleStellaPattern(List<StellaPattern> patterns) {
    final context = patterns.fold(
      StellaTypesContext(),
      (ctx, b) => ctx.merge(b.patternContext),
    );

    return _TupleStelaPattern(context, patterns);
  }
}

class _TupleStelaPattern implements TupleStellaPattern {
  @override
  final StellaTypesContext patternContext;
  final List<StellaPattern> patterns;

  _TupleStelaPattern(this.patternContext, this.patterns);

  @override
  bool get wildCard => patterns.every((e) => e.wildCard);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _TupleStelaPattern &&
          runtimeType == other.runtimeType &&
          _equality.equals(patterns, other.patterns);

  @override
  int get hashCode => _equality.hash(patterns);
}

abstract class RecordStellaPattern implements StellaPattern {
  factory RecordStellaPattern(Map<String, StellaPattern> patterns) =
      _RecordStellaPattern;
}

class _RecordStellaPattern implements RecordStellaPattern {
  final Map<String, StellaPattern> patterns;

  _RecordStellaPattern(this.patterns);

  @override
  StellaTypesContext get patternContext => patterns.values.fold(
        StellaTypesContext(),
        (ctx, b) => ctx.merge(b.patternContext),
      );

  @override
  bool get wildCard => patterns.values.every((e) => e.wildCard);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _RecordStellaPattern &&
          runtimeType == other.runtimeType &&
          _equality.equals(patterns, other.patterns);

  @override
  int get hashCode => _equality.hash(patterns);
}

abstract class ListStellaPattern implements StellaPattern {}

class ListListStellaPattern implements ListStellaPattern {
  final List<StellaPattern> patterns;

  ListListStellaPattern(this.patterns);

  @override
  StellaTypesContext get patternContext => patterns.fold(
        StellaTypesContext(),
        (ctx, b) => ctx.merge(b.patternContext),
      );

  @override
  bool get wildCard => false;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListListStellaPattern &&
          runtimeType == other.runtimeType &&
          _equality.equals(patterns, other.patterns);

  @override
  int get hashCode => _equality.hash(patterns);
}

class ConsListStellaPattern implements ListStellaPattern {
  final StellaPattern head;
  final StellaPattern tail;

  ConsListStellaPattern(this.head, this.tail);

  @override
  StellaTypesContext get patternContext => [head, tail].fold(
        StellaTypesContext(),
        (ctx, b) => ctx.merge(b.patternContext),
      );

  @override
  bool get wildCard => false;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConsListStellaPattern &&
          runtimeType == other.runtimeType &&
          head == other.head &&
          tail == other.tail;

  @override
  int get hashCode => head.hashCode ^ tail.hashCode;
}

abstract class VariantStellaPattern implements StellaPattern {
  factory VariantStellaPattern(String label, StellaPattern? pattern) =
      _VariantStellaPattern;
}

class _VariantStellaPattern implements VariantStellaPattern {
  final String label;
  final StellaPattern? pattern;

  _VariantStellaPattern(this.label, this.pattern);

  @override
  StellaTypesContext get patternContext =>
      pattern?.patternContext ?? StellaTypesContext();

  @override
  bool get wildCard => false;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _VariantStellaPattern &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          pattern == other.pattern;

  @override
  int get hashCode => label.hashCode ^ pattern.hashCode;
}

abstract class StellaPatternChecker {
  factory StellaPatternChecker.forType(StellaType type) {
    return switch (type) {
      Bool() => _BoolStellaPatternChecker(),
      Nat() => _NatStellaPatternChecker(),
      Unit() => _UnitStellaPatternChecker(),
      TypeSum() => _SumStellaPatternChecker(type),
      // TypeTuple() => throw UnimplementedError(),
      // TypeRecord() => throw UnimplementedError(),
      TypeList() => _ListStellaPatternChecker(type),
      TypeVariant() => _VariantStellaPatternChecker(type),
      _ => _WildCardStellaPatternChecker(),
    };
  }

  bool checkExhaustive(List<StellaPattern> patterns);
}

class _WildCardStellaPatternChecker implements StellaPatternChecker {
  @override
  bool checkExhaustive(List<StellaPattern> patterns) {
    return patterns.any((p) => p.wildCard);
  }
}

class _SumStellaPatternChecker implements StellaPatternChecker {
  final TypeSum type;

  _SumStellaPatternChecker(this.type);

  @override
  bool checkExhaustive(List<StellaPattern> patterns) {
    if (patterns.any((p) => p is! SumStellaPattern)) {
      throw ArgumentError('Unexpected pattern type');
    }

    if (patterns.any((p) => p.wildCard)) {
      return true;
    }

    final left = patterns
        .whereType<InlStellaPattern>()
        .map((pattern) => pattern.left)
        .toList();

    final right = patterns
        .whereType<InrStellaPattern>()
        .map((pattern) => pattern.right)
        .toList();

    if (left.isEmpty || right.isEmpty) {
      return false;
    }

    return StellaPatternChecker.forType(type.left!).checkExhaustive(left) &&
        StellaPatternChecker.forType(type.right!).checkExhaustive(right);
  }
}

class _ListStellaPatternChecker implements StellaPatternChecker {
  final TypeList type;

  _ListStellaPatternChecker(this.type);

  @override
  bool checkExhaustive(List<StellaPattern> patterns) {
    if (patterns.any((p) => p is! ListStellaPattern)) {
      throw ArgumentError('Unexpected pattern type');
    }

    if (patterns.any((p) => p.wildCard)) {
      return true;
    }

    final hasEmpty = patterns
        .whereType<ListListStellaPattern>()
        .any((pattern) => pattern.patterns.isEmpty);

    final cons = patterns.whereType<ConsListStellaPattern>().toList();

    if (cons.isEmpty) {
      return false;
    }

    final groups = cons.groupListsBy((c) => c.head);

    final headsExhaustive =
        StellaPatternChecker.forType(type.type!).checkExhaustive(
      groups.keys.toList(),
    );

    return hasEmpty &&
        headsExhaustive &&
        groups.values
            .map((c) => c.map((e) => e.tail).toList())
            .every((g) => checkExhaustive(g));
  }
}

class _VariantStellaPatternChecker implements StellaPatternChecker {
  final TypeVariant type;

  _VariantStellaPatternChecker(this.type);

  @override
  bool checkExhaustive(List<StellaPattern> patterns) {
    if (patterns.any((p) => p is! VariantStellaPattern)) {
      throw ArgumentError('Unexpected pattern type');
    }

    if (patterns.any((p) => p.wildCard)) {
      return true;
    }

    final labelGroups =
        patterns.cast<_VariantStellaPattern>().groupListsBy((p) => p.label);

    final containsAllKeys = const UnorderedIterableEquality().equals(
      labelGroups.keys,
      type.types.keys,
    );

    return containsAllKeys &&
        labelGroups.entries.every(
          (e) =>
              type.types[e.key]?.let(
                (it) => StellaPatternChecker.forType(it)
                    .checkExhaustive(e.value.map((p) => p.pattern!).toList()),
              ) ??
              true,
        );
  }
}

class _BoolStellaPatternChecker implements StellaPatternChecker {
  @override
  bool checkExhaustive(List<StellaPattern> patterns) {
    if (patterns.any((p) => p is! BoolStellaPattern)) {
      throw ArgumentError('Unexpected pattern type');
    }

    if (patterns.any((p) => p.wildCard)) {
      return true;
    }

    return patterns
            .cast<ValueBoolStellaPattern>()
            .map((p) => p.value)
            .toSet()
            .length ==
        2;
  }
}

class _UnitStellaPatternChecker implements StellaPatternChecker {
  @override
  bool checkExhaustive(List<StellaPattern> patterns) {
    if (patterns.any((p) => p is! UnitStellaPattern)) {
      throw ArgumentError('Unexpected pattern type');
    }

    return true;
  }
}

class _NatStellaPatternChecker implements StellaPatternChecker {
  @override
  bool checkExhaustive(List<StellaPattern> patterns) {
    if (patterns.any((p) => p is! NatStellaPattern)) {
      throw ArgumentError('Unexpected pattern type');
    }

    if (patterns.any((p) => p.wildCard)) {
      return true;
    }

    final nats = patterns.cast<NatEvalStellaPattern>();

    final depths = SplayTreeSet.of(
      nats.where((n) => n.eval == null).map((n) => n.depth),
    );

    return nats.any((n) => n.eval == 0) &&
        depths.isNotEmpty &&
        Iterable.generate(depths.max, (i) => i + 1)
            .every((e) => depths.contains(e));
  }
}
