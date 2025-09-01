class CounterService {
  int _value = 0;

  int get value => _value;

  bool incrementIfEven() {
    if (_value % 2 == 0) {
      _value++;
      return true;
    }
    return false;
  }

  void reset() => _value = 0;
}
