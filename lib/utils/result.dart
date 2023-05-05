/// result with value
class Result<T, E> {
  late final bool _ok;
  late final T? _value;
  late final E? _error;

  bool get ok => _ok;

  T? get value => _value;

  E? get error => _error;

  // Result({required bool ok, T? value, E? error}) {
  //   _ok = ok;
  //   _value = value;
  //   _error = error;
  // }

  Result.ok([T? value]) {
    _ok = true;
    _value = value;
    _error = null;
  }

  Result.err([E? error]) {
    _ok = false;
    _value = null;
    _error = error;
  }

  @override
  String toString() {
    return _ok ? "ok: $value" : "err: $error";
  }
}
