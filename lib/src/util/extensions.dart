extension FunX<T> on T {
  R let<R>(R Function(T) fun) => fun(this);

  R? tryAs<R>() => this is R ? this as R : null;
}
