import 'dart:collection';

import 'package:satchel/src/util/extensions.dart';

import 'stella_types.dart';

enum LanguageFeatures {
  exceptions,
  variantExceptions;

  static LanguageFeatures? from(String name) {
    return switch (name) {
      '#exceptions' => exceptions,
      '#exception-type-declaration' => exceptions,
      '#open-variant-exceptions' => variantExceptions,
      _ => null,
    };
  }
}

extension ExcepitopnDeclX on ExceptionContext {
  bool get hasDeclaration => exceptionType != null;
}

abstract interface class ExceptionContext {
  StellaType? get exceptionType;

  ExceptionContext merge(covariant ExceptionContext? context);
}

class TypeExceptionContext implements ExceptionContext {
  @override
  final StellaType? exceptionType;

  const TypeExceptionContext([this.exceptionType]);

  @override
  ExceptionContext merge(ExceptionContext? context) {
    return exceptionType?.let((it) => this) ??
        context ??
        const TypeExceptionContext();
  }
}

class VariantExceptionContext implements ExceptionContext {
  @override
  final TypeVariant? exceptionType;

  const VariantExceptionContext([this.exceptionType]);

  @override
  ExceptionContext merge(ExceptionContext context) {
    if (context is! VariantExceptionContext) {
      return this;
    }

    return VariantExceptionContext(
      TypeVariant(
        types: LinkedHashMap.of({
          ...?exceptionType?.types,
          ...?context.exceptionType?.types,
        }),
      ),
    );
  }
}

abstract interface class IStellaTypesContext {
  Set<LanguageFeatures> get languageFeatures;

  ExceptionContext get exceptionContext;

  StellaType? operator [](String name);

  StellaType? lookupStellaType(String name);

  StellaTypesContext clone();
}

abstract interface class IStellaTypesContextBuilder
    implements IStellaTypesContext {
  factory IStellaTypesContextBuilder([
    Map<String, StellaType> types,
    Set<LanguageFeatures> languageFeatures,
    ExceptionContext exceptionContext,
  ]) = StellaTypesContext;

  StellaTypesContext merge(StellaTypesContext? other);

  void add(StellaTypesContext localContext);

  void registerStellaType(String name, StellaType type);

  void operator []=(String name, StellaType type);
}

class StellaTypesContext
    implements IStellaTypesContext, IStellaTypesContextBuilder {
  @override
  final Set<LanguageFeatures> languageFeatures;

  @override
  final ExceptionContext exceptionContext;

  final Map<String, StellaType> _types;

  StellaTypesContext.root()
      : _types = {},
        languageFeatures = {},
        exceptionContext = TypeExceptionContext();

  const StellaTypesContext([
    this._types = const {},
    this.languageFeatures = const {},
    this.exceptionContext = const TypeExceptionContext(),
  ]);

  factory StellaTypesContext.single(String name, StellaType type) {
    return StellaTypesContext({
      name: type,
    });
  }

  factory StellaTypesContext.exception(ExceptionContext context) {
    return StellaTypesContext({}, {}, context);
  }

  factory StellaTypesContext.extensions(Set<LanguageFeatures> features) {
    return StellaTypesContext({}, features);
  }

  @override
  void registerStellaType(String name, StellaType type) {
    _types[name] = type;
  }

  @override
  StellaType? lookupStellaType(String name) {
    return _types[name];
  }

  @override
  StellaType? operator [](String name) {
    return lookupStellaType(name);
  }

  @override
  void operator []=(String name, StellaType type) {
    registerStellaType(name, type);
  }

  @override
  StellaTypesContext clone() {
    return StellaTypesContext(
      Map.from(_types),
      languageFeatures,
      exceptionContext,
    );
  }

  @override
  StellaTypesContext merge(StellaTypesContext? other) {
    final typesMap = {
      ..._types,
      ...?other?._types,
    };

    final featuresSet = {
      ...languageFeatures,
      ...?other?.languageFeatures,
    };

    return StellaTypesContext(
      typesMap,
      featuresSet,
      exceptionContext.merge(other?.exceptionContext),
    );
  }

  @override
  void add(StellaTypesContext localContext) {
    _types.addAll(localContext._types);
  }
}
