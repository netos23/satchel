import 'stella_types.dart';

class StellaTypesContext {
  final Map<String, StellaType> _types;

  StellaTypesContext.root() : _types = {};

  const StellaTypesContext([this._types = const {}]);

  factory StellaTypesContext.single(String name, StellaType type) {
    return StellaTypesContext({
      name: type,
    });
  }

  void registerStellaType(String name, StellaType type) {
    _types[name] = type;
  }

  StellaType? lookupStellaType(String name) {
    return _types[name];
  }

  StellaType? operator [](String name) {
    return lookupStellaType(name);
  }

  void operator []=(String name, StellaType type) {
    registerStellaType(name, type);
  }

  StellaTypesContext clone() {
    return StellaTypesContext(
      Map.from(_types),
    );
  }

  StellaTypesContext merge(StellaTypesContext? other) {
    final typesMap = {
      ..._types,
      ...?other?._types,
    };

    return StellaTypesContext(typesMap);
  }

  void add(StellaTypesContext localContext) {
    _types.addAll(localContext._types);
  }
}
