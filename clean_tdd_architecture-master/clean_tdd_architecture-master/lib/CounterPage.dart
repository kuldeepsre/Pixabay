import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/CounterState.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocSelector<CounterCubit, CounterState, int>(
              selector: (state) => state.count,
              builder: (context, count) {
                return Text(
                  'Count: $count',
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.read<CounterCubit>().decrement(),
                  child: Text('Decrement'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => context.read<CounterCubit>().increment(),
                  child: Text('Increment'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
