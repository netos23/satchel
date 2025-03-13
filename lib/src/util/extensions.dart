extension FunX<T> on T {
  R let<R>(R Function(T) fun) => fun(this);
}
