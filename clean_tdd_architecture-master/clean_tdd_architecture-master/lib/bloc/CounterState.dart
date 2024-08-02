import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// States
class CounterState extends Equatable {
  final int count;

  const CounterState(this.count);

  @override
  List<Object> get props => [count];
}

// Cubit
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(0));

  void increment() => emit(CounterState(state.count + 1));
  void decrement() => emit(CounterState(state.count - 1));
}
