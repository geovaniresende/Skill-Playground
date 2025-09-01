import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/services/counter_service.dart';

sealed class CounterEvent {}

class CounterIncrementIfEven extends CounterEvent {}

class CounterReset extends CounterEvent {}

class CounterState {
  final int value;
  const CounterState(this.value);
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final CounterService service;

  CounterBloc(this.service) : super(CounterState(service.value)) {
    on<CounterIncrementIfEven>((event, emit) {
      final changed = service.incrementIfEven();
      if (changed) emit(CounterState(service.value));
    });
    on<CounterReset>((event, emit) {
      service.reset();
      emit(CounterState(service.value));
    });
  }
}
