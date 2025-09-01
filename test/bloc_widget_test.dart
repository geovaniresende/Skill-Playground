import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_playground/blocs/counter_bloc.dart';
import 'package:skill_playground/core/services/counter_service.dart';

void main() {
  testWidgets('BlocScreen increments only when even', (tester) async {
    final widget = MaterialApp(
      home: BlocProvider(
        create: (_) => CounterBloc(CounterService()),
        child: Builder(
          builder: (context) => Scaffold(
            body: BlocBuilder<CounterBloc, CounterState>(
              buildWhen: (p, n) => n.value % 2 == 1,
              builder: (_, s) =>
                  Text('v=${s.value}', textDirection: TextDirection.ltr),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () =>
                  context.read<CounterBloc>().add(CounterIncrementIfEven()),
            ),
          ),
        ),
      ),
    );

    await tester.pumpWidget(widget);
    expect(find.text('v=0'), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    expect(find.text('v=1'), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    expect(find.text('v=1'), findsOneWidget);
  });
}
