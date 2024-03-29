import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test/views/bloc/cubit.dart';

class BlocTestScreen extends StatelessWidget {
  const BlocTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<CounterCubit>().increment(),),
      appBar: AppBar(
        title: const Text('Bloc'),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, count) {
            return Text('Number : $count');
          },
        ),
      ),
    );
  }
}
