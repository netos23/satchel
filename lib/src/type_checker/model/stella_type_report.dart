import 'package:collection/collection.dart';
import 'package:satchel/src/util/extensions.dart';

import 'stella_types.dart';
import 'stella_types_context.dart';

sealed class StellaTypeReport {
  final StellaTypesContext typesContext;

  const StellaTypeReport({
    required this.typesContext,
  });

  bool hasType(StellaType type);

  StellaType? get typeOrNull;

  StellaTypeReport inferTypeReport(
    StellaTypeReport typeReport,
    StellaTypesContext ctx,
  );
}

class GotTypeReport extends StellaTypeReport {
  final StellaType type;

  const GotTypeReport({
    required super.typesContext,
    required this.type,
  });

  @override
  bool hasType(StellaType type) => type == this.type;

  @override
  StellaTypeReport inferTypeReport(
    StellaTypeReport typeReport,
    StellaTypesContext ctx,
  ) {
    if (!typeReport.hasType(type)) {
      return ErrorTypeReport(
        typesContext: typesContext,
        cause: typeReport,
        message: 'Expect ${this.type}, but got $type.',
        errorCode: StellaTypeError.unexpectedExpression(
          expected: type,
          actual: typeReport.typeOrNull,
        ),
        recoveryType: type,
      );
    }

    final resType = switch ((type, typeReport.typeOrNull)) {
      final (TypeSum, TypeSum) sums => TypeSum(
          left: sums.$1.left ?? sums.$2.left,
          right: sums.$1.right ?? sums.$2.right,
        ),
      final (TypeVariant, TypeVariant) sums => TypeVariant.merge(
          [sums.$1, sums.$2],
        ),
      _ => type,
    };

    if (typeReport is ErrorTypeReport) {
      return typeReport.copyWith(
        typesContext: ctx,
        recoveryType: resType,
      );
    }

    return GotTypeReport(
      typesContext: ctx,
      type: resType,
    );
  }

  @override
  StellaType? get typeOrNull => type;

  @override
  String toString() {
    return 'GotTypeReport{type: $type}';
  }
}

enum StellaTypeError implements Exception {
  unexpectedTypeForParameter('ERROR_UNEXPECTED_TYPE_FOR_PARAMETER'),
  unexpectedTypeForExpression('ERROR_UNEXPECTED_TYPE_FOR_EXPRESSION'),
  unexpectedDataForNullableLabel('ERROR_UNEXPECTED_DATA_FOR_NULLARY_LABEL'),
  unexpectedLambda('ERROR_UNEXPECTED_LAMBDA'),
  notAFunction('ERROR_NOT_A_FUNCTION'),
  undefinedVariable('ERROR_UNDEFINED_VARIABLE'),
  missingMain('ERROR_MISSING_MAIN'),
  missingRecordFields('ERROR_MISSING_RECORD_FIELDS'),
  missingDataForLabel('ERROR_MISSING_DATA_FOR_LABEL'),
  unexpectedRecordFields('ERROR_UNEXPECTED_RECORD_FIELDS'),
  unexpectedRecord('ERROR_UNEXPECTED_RECORD'),
  notARecord('ERROR_NOT_A_RECORD'),
  duplicateRecordFields('ERROR_DUPLICATE_RECORD_FIELDS '),
  duplicateRecordTypeFields('ERROR_DUPLICATE_RECORD_TYPE_FIELDS'),
  duplicateRecordPatternFields('ERROR_DUPLICATE_RECORD_PATTERN_FIELDS'),
  unexpectedFieldAccess('ERROR_UNEXPECTED_FIELD_ACCESS'),
  unexpectedTuple('ERROR_UNEXPECTED_TUPLE'),
  tupleIndexOutOfBounds('ERROR_TUPLE_INDEX_OUT_OF_BOUNDS'),
  unexpectedTupleLength('ERROR_UNEXPECTED_TUPLE_LENGTH'),
  notATuple('ERROR_NOT_A_TUPLE'),
  ambiguousSumType('ERROR_AMBIGUOUS_SUM_TYPE'),
  illegalEmptyMatching('ERROR_ILLEGAL_EMPTY_MATCHING'),
  nonExhaustiveMatchPatterns('ERROR_NONEXHAUSTIVE_MATCH_PATTERNS'),
  notAList('ERROR_NOT_A_LIST'),
  unexpectedList('ERROR_UNEXPECTED_LIST'),
  unexpectedInjection('ERROR_UNEXPECTED_INJECTION'),
  unexpectedPatternForType('ERROR_UNEXPECTED_PATTERN_FOR_TYPE'),
  ambiguousVariantType('ERROR_AMBIGUOUS_VARIANT_TYPE'),
  ambiguousList('ERROR_AMBIGUOUS_LIST_TYPE'),
  unexpectedVariant('ERROR_UNEXPECTED_VARIANT'),
  unexpectedVariantLabel('ERROR_UNEXPECTED_VARIANT_LABEL'),
  duplicateVariantTypeFields('ERROR_DUPLICATE_VARIANT_TYPE_FIELDS'),
  incorrectNumberOfArguments('ERROR_INCORRECT_NUMBER_OF_ARGUMENTS'),
  unexpectedNonNullableVariantPattern('ERROR_UNEXPECTED_NON_NULLARY_VARIANT_PATTERN'),
  unexpectedNullableVariantPattern('ERROR_UNEXPECTED_NULLARY_VARIANT_PATTERN'),
  unexpectedNumberOfParametersInLambda(
    'ERROR_UNEXPECTED_NUMBER_OF_PARAMETERS_IN_LAMBDA',
  ),
  incorrectArityOfMain('ERROR_INCORRECT_ARITY_OF_MAIN');

  final String code;

  factory StellaTypeError.unexpectedExpression({
    required StellaType expected,
    required StellaType? actual,
  }) {
    if ((expected, actual) case (TypeList(), TypeList())) {
      return unexpectedTypeForExpression;
    } else if ((expected, actual) case (_, TypeList())) {
      return unexpectedList;
    } else if ((expected, actual) case final (TypeTuple, TypeTuple) pair) {
      if (pair.$1.types.length != pair.$2.types.length) {
        return unexpectedTupleLength;
      }
    } else if ((expected, actual) case (_, TypeTuple())) {
      return unexpectedTuple;
    } else if ((expected, actual) case final (TypeRecord, TypeRecord) pair) {
      final expectedKeys = pair.$1.types.keys.toSet();
      final actualKeys = pair.$2.types.keys.toSet();

      final missing = expectedKeys.difference(actualKeys);
      if (missing.isNotEmpty) {
        return missingRecordFields;
      }

      final unexpected = actualKeys.difference(expectedKeys);
      if (unexpected.isNotEmpty) {
        return unexpectedRecordFields;
      }

      for (final key in expectedKeys) {
        if (pair.$1.types[key] != pair.$2.types[key]) {
          return StellaTypeError.unexpectedExpression(
            expected: pair.$1.types[key]!,
            actual: pair.$2.types[key]!,
          );
        }
      }
    } else if ((expected, actual) case (_, TypeRecord())) {
      return unexpectedRecord;
    } else if ((expected, actual) case final (TypeVariant, TypeVariant) pair) {
      return switch (TypeVariant.equals(pair.$1, pair.$2)) {
        TypeVariantEquality.missingDataForLabel => missingDataForLabel,
        TypeVariantEquality.unexpectedDataForNullableLabel =>
          unexpectedDataForNullableLabel,
        TypeVariantEquality.unexpectedVariantLabel => unexpectedVariantLabel,
        _ => unexpectedTypeForExpression,
      };
    } else if ((expected, actual) case (_, TypeVariant())) {
      return unexpectedVariant;
    } else if ((expected, actual) case (TypeSum(), TypeSum())) {
      return unexpectedTypeForExpression;
    } else if ((expected, actual) case (_, TypeSum())) {
      return unexpectedInjection;
    } else if ((expected, actual) case final (Func, Func) pair) {
      if (pair.$1.args.length != pair.$2.args.length) {
        if (pair.$2.lambda) {
          return unexpectedNumberOfParametersInLambda;
        }
      }

      if (!pair.$1.args.equals(pair.$2.args)) {
        return unexpectedTypeForParameter;
      }

      if (pair.$1.returnType != pair.$2.returnType) {
        return StellaTypeError.unexpectedExpression(
          expected: pair.$1.returnType,
          actual: pair.$2.returnType,
        );
      }
    } else if ((expected, actual) case (_, Func(:final lambda))) {
      return lambda ? unexpectedLambda : unexpectedTypeForExpression;
    }

    return unexpectedTypeForExpression;
  }

  factory StellaTypeError.ambiguousType(StellaType type) {
    return switch (type) {
      TypeSum() => ambiguousSumType,
      TypeVariant() => ambiguousVariantType,
      TypeList(:final type?) => StellaTypeError.ambiguousType(type),
      TypeList(:final type) => ambiguousList,
      TypeRef(:final type) => StellaTypeError.ambiguousType(type),
      Func(:final args, :final returnType) => [...args, returnType]
          .firstWhere((t) => !t.isStrict)
          .let((type) => StellaTypeError.ambiguousType(type)),
      TypeForAll(:final type) => StellaTypeError.ambiguousType(type),
      TypeRec(:final type) => StellaTypeError.ambiguousType(type),
      TypeTuple(:final types) => types
              .firstWhere((t) => !(t?.isStrict ?? false))
              ?.let((type) => StellaTypeError.ambiguousType(type)) ??
          unexpectedTypeForExpression,
      TypeRecord(:final types) => types.values
              .firstWhere((t) => !(t?.isStrict ?? false))
              ?.let((type) => StellaTypeError.ambiguousType(type)) ??
          unexpectedTypeForExpression,
      _ => unexpectedTypeForExpression,
    };
  }

  const StellaTypeError(this.code);

  @override
  String toString() => code;
}

class ErrorTypeReport extends StellaTypeReport {
  final StellaTypeError errorCode;
  final String? message;
  @Deprecated('Use recovery type instead')
  final StellaTypeReport? cause;
  final StellaType? recoveryType;

  const ErrorTypeReport({
    required super.typesContext,
    required this.errorCode,
    @Deprecated('Use recovery type instead') this.cause,
    this.recoveryType,
    this.message,
  });

  @override
  bool hasType(StellaType type) => recoveryType == null || recoveryType == type;

  @override
  StellaTypeReport inferTypeReport(
    StellaTypeReport typeReport,
    StellaTypesContext ctx,
  ) {
    return ErrorTypeReport(
      typesContext: ctx,
      cause: this,
      errorCode: errorCode,
      recoveryType: recoveryType,
    );
  }

  @override
  StellaType? get typeOrNull => recoveryType;

  StellaTypeReport copyWith({
    StellaTypesContext? typesContext,
    StellaTypeError? errorCode,
    String? message,
    @Deprecated('Use recovery type instead') StellaTypeReport? cause,
    StellaType? recoveryType,
  }) {
    return ErrorTypeReport(
      typesContext: typesContext ?? this.typesContext,
      errorCode: errorCode ?? this.errorCode,
      message: message ?? this.message,
      cause: cause ?? this.cause,
      recoveryType: recoveryType ?? this.recoveryType,
    );
  }

  @override
  String toString() {
    return 'ErrorTypeReport{errorCode: $errorCode, message: $message, cause: $cause, recoveryType: $recoveryType}';
  }
}
