import '../model/stella_types.dart';
import '../model/stella_types_context.dart';
import 'simple_type_system.dart';

abstract interface class TypeSystem {
  factory TypeSystem.fromContext(IStellaTypesContext context) {
    return const SimpleTypeSystem();
  }

  bool instanceOf(StellaType? clazz, StellaType? base);
}
