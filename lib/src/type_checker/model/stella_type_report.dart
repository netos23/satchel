import 'stella_types.dart';
import 'stella_types_context.dart';

sealed class StellaTypeReport {
  final StellaTypesContext typesContext;

  const StellaTypeReport({
    required this.typesContext,
  });

  bool hasType(StellaType type);

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
    // TODO(netos23): report position of error
    return switch (typeReport) {
      GotTypeReport(:final type) => typeReport.hasType(this.type)
          ? GotTypeReport(
              typesContext: ctx,
              type: type,
            )
          : ErrorTypeReport(
              typesContext: typesContext,
              cause: typeReport,
              message: 'Expect ${this.type}, but got $type.',
              errorCode: StellaTypeError.unexpectedTypeForExpression,
            ),
      UnknownTypeReport() => GotTypeReport(
          typesContext: ctx,
          type: type,
        ),
      ErrorTypeReport(:final errorCode) => ErrorTypeReport(
          typesContext: ctx,
          errorCode: errorCode,
          cause: typeReport,
        ),
    };
  }
}

class UnknownTypeReport extends StellaTypeReport {
  const UnknownTypeReport({required super.typesContext});

  @override
  bool hasType(StellaType type) => false;

  @override
  StellaTypeReport inferTypeReport(
    StellaTypeReport typeReport,
    StellaTypesContext ctx,
  ) {
    // TODO: implement inferTypeReport
    throw UnimplementedError();
  }
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
  incorrectNumberOfArguments('ERROR_INCORRECT_NUMBER_OF_ARGUMENTS');

  final String code;

  const StellaTypeError(this.code);

  @override
  String toString() => code;
}

class ErrorTypeReport extends StellaTypeReport {
  final StellaTypeError errorCode;
  final String? message;
  final StellaTypeReport? cause;

  const ErrorTypeReport({
    required super.typesContext,
    required this.errorCode,
    this.cause,
    this.message,
  });

  @override
  bool hasType(StellaType type) => false;

  @override
  StellaTypeReport inferTypeReport(
    StellaTypeReport typeReport,
    StellaTypesContext ctx,
  ) {
    return ErrorTypeReport(
      typesContext: ctx,
      cause: this,
      errorCode: errorCode,
    );
  }
}
