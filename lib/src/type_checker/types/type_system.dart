import 'package:satchel/src/type_checker/types/bot_ambiguous_resolver.dart';
import 'package:satchel/src/type_checker/types/reconstruct_type_system.dart';

import '../model/stella_types.dart';
import '../model/stella_types_context.dart';
import 'noop_ambiguous_resolver.dart';
import 'simple_type_system.dart';
import 'subtype_type_system.dart';

abstract interface class InheritanceSystem {
  bool instanceOf(StellaType? clazz, StellaType? base);
}

abstract interface class AmbiguousResolver {
  StellaType? resolveAmbiguousType(StellaType? type);
}

class CompositeTypeSystem implements TypeSystem {
  final InheritanceSystem inheritanceSystem;
  final AmbiguousResolver ambiguousResolver;

  CompositeTypeSystem(this.inheritanceSystem, this.ambiguousResolver);

  @override
  bool instanceOf(StellaType? clazz, StellaType? base) {
    return inheritanceSystem.instanceOf(clazz, base);
  }

  @override
  StellaType? resolveAmbiguousType(StellaType? type) {
    return ambiguousResolver.resolveAmbiguousType(type);
  }
}

abstract interface class TypeSystem
    implements InheritanceSystem, AmbiguousResolver {
  factory TypeSystem.of(IStellaTypesContext context) {
    final features = context.languageFeatures;
    InheritanceSystem inheritanceSystem;

    if (features.contains(LanguageFeatures.subtyping)) {
      inheritanceSystem = const SubtypeTypeSystem();
    } else if (features.contains(LanguageFeatures.typeReconstruction)) {
      inheritanceSystem = const ReconstructTypeSystem();
    } else {
      inheritanceSystem = const SimpleTypeSystem();
    }

    final ambiguousResolver =
        features.contains(LanguageFeatures.ambiguousTypeAsBottom)
        ? BotAmbiguousResolver()
        : NoopAmbiguousResolver();

    return CompositeTypeSystem(inheritanceSystem, ambiguousResolver);
  }

  @override
  bool instanceOf(StellaType? clazz, StellaType? base);

  @override
  StellaType? resolveAmbiguousType(StellaType? type);
}
