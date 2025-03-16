import 'package:collection/collection.dart';

class NullableEquality<T> implements Equality<T?> {
  const NullableEquality();

  @override
  bool equals(T? e1, T? e2) {
    if (e1 == null) {
      return true;
    }

    if (e2 == null) {
      return true;
    }

    return e1 == e2;
  }

  @override
  int hash(T? e) => e.hashCode;

  @override
  bool isValidKey(Object? o) => true;
}
