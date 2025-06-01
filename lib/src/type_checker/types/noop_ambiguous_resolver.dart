import 'package:satchel/src/type_checker/model/stella_types.dart';

import 'type_system.dart';

class NoopAmbiguousResolver implements AmbiguousResolver {
  const NoopAmbiguousResolver();

  @override
  StellaType? resolveAmbiguousType(StellaType? type) => type;
}
