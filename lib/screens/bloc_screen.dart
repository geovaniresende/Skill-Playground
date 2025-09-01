import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/counter_bloc.dart';
import '../locator.dart';
import '../core/services/counter_service.dart';

class BlocScreen extends StatelessWidget {
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(sl<CounterService>()),
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/images/logo.png',
            height: 40,
          ),
          centerTitle: true,
          backgroundColor: Colors.blue.shade900,
        ),
        backgroundColor: Colors.grey.shade100,
        body: Center(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: BlocBuilder<CounterBloc, CounterState>(
                buildWhen: (prev, next) => next.value % 2 == 1,
                builder: (context, state) {
                  return Text(
                    'Valor: ${state.value}',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                        ),
                  );
                },
              ),
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton.extended(
              heroTag: 'inc',
              backgroundColor: Colors.blue.shade900,
              onPressed: () =>
                  context.read<CounterBloc>().add(CounterIncrementIfEven()),
              label: const Text(
                'Incrementar se atual for par',
                style: TextStyle(color: Colors.white),
              ),
              icon: const Icon(Icons.exposure_plus_1, color: Colors.white),
            ),
            const SizedBox(height: 8),
            FloatingActionButton.extended(
              heroTag: 'reset',
              backgroundColor: Colors.blue.shade900,
              onPressed: () => context.read<CounterBloc>().add(CounterReset()),
              label: const Text(
                'Reset',
                style: TextStyle(color: Colors.white),
              ),
              icon: const Icon(Icons.refresh, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
