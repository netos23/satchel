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

typedef Equals<E> = bool Function(E lhs, E rhs);

class DelegatingEquality<E> implements Equality<E> {
  final Equals<E> equalsDelegate;

  DelegatingEquality(this.equalsDelegate);

  @override
  bool equals(E e1, E e2) {
    return equalsDelegate(e1, e2);
  }

  @override
  int hash(E e) => e.hashCode;

  @override
  bool isValidKey(Object? o) => true;
}
