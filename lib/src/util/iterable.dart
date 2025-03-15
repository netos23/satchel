class ZipIterable<F, S> extends Iterable<(F, S)> {
  final Iterable<F> firstIterable;
  final Iterable<S> secondIterable;

  ZipIterable(this.firstIterable, this.secondIterable);

  @override
  Iterator<(F, S)> get iterator => ZipIterator(
        firstIterable.iterator,
        secondIterable.iterator,
      );
}

class ZipIterator<F, S> implements Iterator<(F, S)> {
  final Iterator<F> first;
  final Iterator<S> second;
  (F, S)? _current;

  ZipIterator(this.first, this.second);

  @override
  bool moveNext() {
    if (!first.moveNext()) {
      _current = null;
      return false;
    }

    if (!second.moveNext()) {
      _current = null;
      return false;
    }

    _current = (first.current, second.current);

    return true;
  }

  @override
  (F, S) get current => _current ?? (throw StateError('No element'));
}

extension RecordIterableX<F, S> on Iterable<(F, S)> {
  Iterable<F> get firstComponent => map((v) => v.$1);

  Iterable<S> get secondComponent => map((v) => v.$2);
}
