extension MapExt<T> on Map<String, dynamic>? {
  T? valueOrNull() {
    return this != null ? this as T : null;
  }
}

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}
