import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial(0)) {
    on<CounterEvent>((event, emit) {
      if (event is IncreaseEvent) {
        return _increase(emit);
      } else if (event is DecreaseEvent) {
        return _decrease(emit);
      }
    });
  }

  _increase(Emitter emitter) {
    emitter(CounterInitial(state.counter + 1));
  }

  _decrease(Emitter emitter) {
    emitter(CounterInitial(state.counter - 1));
  }
}
