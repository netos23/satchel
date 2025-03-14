
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
      GotTypeReport(:final type) => typeReport.hasType(type)
          ? GotTypeReport(
              typesContext: ctx,
              type: type,
            )
          : ErrorTypeReport(
              typesContext: typesContext,
              cause: typeReport,
              message: 'Expect ${this.type}, but got $type.'
            ),
      UnknownTypeReport() => GotTypeReport(
          typesContext: ctx,
          type: type,
        ),
      ErrorTypeReport() => ErrorTypeReport(
          typesContext: typesContext,
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

class ErrorTypeReport extends StellaTypeReport {
  final String? errorCode;
  final String? message;
  final StellaTypeReport? cause;

  const ErrorTypeReport({
    required super.typesContext,
    this.errorCode,
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
    return ErrorTypeReport(typesContext: typesContext, cause: this);
  }
}
