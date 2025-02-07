import 'package:bloc_practice/bloc/counter_bloc.dart';
import 'package:bloc_practice/bloc/counter_event.dart';
import 'package:bloc_practice/bloc/counter_state.dart';
import 'package:bloc_practice/visibility_bloc/visibility_bloc.dart';
import 'package:bloc_practice/visibility_bloc/visibility_event.dart';
import 'package:bloc_practice/visibility_bloc/visibility_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterBloc()),
          BlocProvider(create: (context) => VisibilityBloc()),
        ],
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<VisibilityBloc, VisibilityState>(
              builder: (context, state) {
                return Visibility(
                  visible: state.isVisible,
                  child: BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) {
                      return Text(
                        state.count.toString(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterDecrementEvent());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterIncrementEvent());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<VisibilityBloc>().add(ShowEvent());
            },
            tooltip: 'Show',
            child: const Icon(Icons.visibility),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<VisibilityBloc>().add(HideEvent());
            },
            tooltip: 'Hide',
            child: const Icon(Icons.visibility_off),
          ),
        ],
      ),
    );
  }
}
