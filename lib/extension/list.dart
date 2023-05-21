extension Equal<T> on List<T> {
  bool isEqualTo(Iterable<T> other) {
    if (length != other.length) return false;

    for (int i = 0; i < length; i++) {
      if (elementAt(i) != other.elementAt(i)) return false;
    }

    return true;
  }
}
