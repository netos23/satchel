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

    if (typeReport is ErrorTypeReport) {
      return typeReport.copyWith(
        typesContext: ctx,
        recoveryType: type,
      );
    }

    return GotTypeReport(
      typesContext: ctx,
      type: type,
    );
  }

  @override
  StellaType? get typeOrNull => type;
}

enum StellaTypeError implements Exception {
  unexpectedTypeForParameter('ERROR_UNEXPECTED_TYPE_FOR_PARAMETER'),
  unexpectedTypeForExpression('ERROR_UNEXPECTED_TYPE_FOR_EXPRESSION'),
  unexpectedLambda('ERROR_UNEXPECTED_LAMBDA'),
  notAFunction('ERROR_NOT_A_FUNCTION'),
  undefinedVariable('ERROR_UNDEFINED_VARIABLE'),
  missingMain('ERROR_MISSING_MAIN'),
  missingRecordFields('ERROR_MISSING_RECORD_FIELDS'),
  unexpectedRecordFields('ERROR_UNEXPECTED_RECORD_FIELDS'),
  unexpectedRecord('ERROR_UNEXPECTED_RECORD'),
  notARecord('ERROR_NOT_A_RECORD'),
  duplicateRecordTypeFields('ERROR_DUPLICATE_RECORD_TYPE_FIELDS'),
  unexpectedFieldAccess('ERROR_UNEXPECTED_FIELD_ACCESS'),
  unexpectedTuple('ERROR_UNEXPECTED_TUPLE'),
  notATuple('ERROR_NOT_A_TUPLE'),
  ambiguousSumType('ERROR_AMBIGUOUS_SUM_TYPE'),
  illegalEmptyMatching('ERROR_ILLEGAL_EMPTY_MATCHING'),
  nonExhaustiveMatchPatterns('ERROR_NONEXHAUSTIVE_MATCH_PATTERNS'),
  notAList('ERROR_NOT_A_LIST'),
  unexpectedList('ERROR_UNEXPECTED_LIST'),
  unexpectedInjection('ERROR_UNEXPECTED_INJECTION'),
  unexpectedPatternForType('ERROR_UNEXPECTED_PATTERN_FOR_TYPE'),
  ambiguousVariantType('ERROR_AMBIGUOUS_VARIANT_TYPE'),
  unexpectedVariant('ERROR_UNEXPECTED_VARIANT'),
  unexpectedVariantLabel('ERROR_UNEXPECTED_VARIANT_LABEL'),
  duplicateVariantTypeFields('ERROR_DUPLICATE_VARIANT_TYPE_FIELDS'),
  incorrectNumberOfArguments('ERROR_INCORRECT_NUMBER_OF_ARGUMENTS'),
  unexpectedNumberOfParametersInLambda(
    'ERROR_UNEXPECTED_NUMBER_OF_PARAMETERS_IN_LAMBDA',
  ),
  incorrectArityOfMain('ERROR_INCORRECT_ARITY_OF_MAIN');

  final String code;

  factory StellaTypeError.unexpectedExpression({
    required StellaType expected,
    required StellaType? actual,
  }) {
    if ((expected, actual) case (_, TypeList())) {
      return unexpectedList;
    } else if ((expected, actual) case (_, TypeTuple())) {
      return unexpectedTuple;
    } else if ((expected, actual) case (_, TypeRecord())) {
      return unexpectedRecord;
    } else if ((expected, actual) case final (Func, Func) pair) {
      if (pair.$1.args.length != pair.$2.args.length) {
        return pair.$2.lambda
            ? unexpectedNumberOfParametersInLambda
            : unexpectedTypeForExpression;
      }

      if (!pair.$1.args.equals(pair.$2.args)) {
        return unexpectedTypeForParameter;
      }

      if (pair.$1.returnType != pair.$2.returnType &&
          pair.$2.returnType.tryAs<Func>()?.lambda == true) {
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
}
