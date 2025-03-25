import 'dart:collection';

import 'package:collection/collection.dart';
import '../../util/extensions.dart';

import 'stella_types.dart';
import 'stella_types_context.dart';

const _equality = DeepCollectionEquality();

abstract interface class StellaPattern {
  StellaTypesContext get patternContext;

  bool get wildCard;

  Type get patternType;
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

  @override
  Type get patternType => type.runtimeType;
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

  @override
  Type get patternType => Bool;
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

  @override
  Type get patternType => Unit;
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

  @override
  Type get patternType => Nat;
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
    return 1 + ((pattern is NatEvalStellaPattern) ? pattern.depth : 0);
  }

  @override
  Type get patternType => Nat;
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

  @override
  Type get patternType => TypeSum;
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

  @override
  Type get patternType => TypeSum;
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

  @override
  Type get patternType => TypeTuple;
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

  @override
  Type get patternType => TypeRecord;
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

  @override
  Type get patternType => TypeList;
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

  @override
  Type get patternType => TypeList;
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

  @override
  Type get patternType => TypeVariant;
}

abstract class StellaPatternChecker {
  factory StellaPatternChecker.forType(StellaType? type) {
    return switch (type) {
      Bool() => _BoolStellaPatternChecker(),
      Nat() => _NatStellaPatternChecker(),
      Unit() => _UnitStellaPatternChecker(),
      TypeSum() => _SumStellaPatternChecker(type),
      // TypeTuple() => _TupleStellaPatternChecker(type),
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
            .any((g) => checkExhaustive(g));
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
// ignore: unused_element
class _TupleStellaPatternChecker implements StellaPatternChecker {
  final TypeTuple type;

  _TupleStellaPatternChecker(this.type);

  @override
  bool checkExhaustive(List<StellaPattern> patterns) {
    if (patterns.any((p) => p is! TupleStellaPattern)) {
      throw ArgumentError('Unexpected pattern type');
    }

    final tuplePatterns = patterns.whereType<_TupleStelaPattern>();

    if (tuplePatterns.any((t) => t.patterns.length != patterns.length)) {
      throw ArgumentError('Unexpected pattern type');
    }

    if (patterns.any((p) => p.wildCard)) {
      return true;
    }

    bool checkExhaustiveSubPatterns(
      Iterable<List<StellaPattern>> tuples,
      List<StellaType> types,
    ) {
      if (tuples.any((p) => tuples.length == 1)) {
        return StellaPatternChecker.forType(types.first)
            .checkExhaustive(tuples.map((t) => t.first).toList());
      }

      final groups = tuples.groupListsBy((p) => p.first);

      final keyExhaustive =
          StellaPatternChecker.forType(types.first).checkExhaustive(
        groups.keys.toList(),
      );

      return keyExhaustive &&
          groups.values
              .map((c) => c.map((e) => e.sublist(1)))
              .any((g) => checkExhaustiveSubPatterns(g, types.sublist(1)));
    }

    return checkExhaustiveSubPatterns(
      tuplePatterns.map((p) => p.patterns),
      type.types.whereType<StellaType>().toList(),
    );
  }
}

// ignore: unused_element
class _RecordStellaPatternChecker implements StellaPatternChecker {
  final TypeRecord type;

  _RecordStellaPatternChecker(this.type);

  @override
  bool checkExhaustive(List<StellaPattern> patterns) {
    if (patterns.any((p) => p is! RecordStellaPattern)) {
      throw ArgumentError('Unexpected pattern type');
    }

    final recordPatterns = patterns.whereType<_RecordStellaPattern>();

    if (recordPatterns.any((t) => t.patterns.length != patterns.length)) {
      throw ArgumentError('Unexpected pattern type');
    }

    if (patterns.any((p) => p.wildCard)) {
      return true;
    }

    // ignore: unused_element
    bool checkExhaustiveSubPatterns(
      Iterable<Map<String, StellaPattern>> tuples,
      Map<String, StellaType> types,
    ) {
      throw UnimplementedError();
    }
    //   if (tuples.any((p) => tuples.length == 1)) {
    //     return StellaPatternChecker.forType()
    //         .checkExhaustive(tuples.map((t) => t.first).toList());
    //   }
    //
    //   final groups = tuples.groupListsBy((p) => p.first);
    //
    //   final keyExhaustive =
    //       StellaPatternChecker.forType(types.first).checkExhaustive(
    //     groups.keys.toList(),
    //   );
    //
    //   return keyExhaustive &&
    //       groups.values
    //           .map((c) => c.map((e) => e.sublist(1)))
    //           .any((g) => checkExhaustiveSubPatterns(g, types.sublist(1)));
    // }
    //
    // return checkExhaustiveSubPatterns(
    //   recordPatterns.map((p) => p.patterns),
    //   type.types.cast<String, StellaType>(),
    // );

    throw UnimplementedError();
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
