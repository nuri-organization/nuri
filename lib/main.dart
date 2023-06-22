import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/nuri_observer.dart';

void main() {
  Bloc.observer = NuriObserver();
  runApp(const CounterApp());
}

class CounterApp extends MaterialApp{
  const CounterApp({super.key}) : super(home: const CounterPage());
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterCubit extends Cubit<int>{
  CounterCubit() : super(0);

  void increment() => emit(state + 1); //현재 상태에 +1 하는 메서드

  void decrement() => emit(state - 1);//현재 상태에 -1 하는 메서드
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Counter Example')),
      body: Center(
        child: BlocBuilder<CounterCubit, int>( // 상태 변화에 변경되어야 할 부분은 Text 하나이기에
          builder: (context, state) {  // Text 하나만 Wrapping. 상태가 변화할 때마다 업데이트
            return Column(
              children: [
                Text("hello"),
                Text('$state', style: textTheme.headline2),
              ],
            ); //State호출
          },
        ),
      ),
      floatingActionButton: Column( //+ - 버튼을 구현하기 위한 Column
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),//CounterCubit decrement 함수 호출
          ),
        ],
      ),
    );
  }
}
