import 'package:bloc_suboptimal_mistake/home/cubit/home_cubit.dart';
import 'package:bloc_suboptimal_mistake/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageOptimized extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..loadProducts(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          // Rebuild whole page only when state's type changed
          buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
          builder: (context, state) {
            return state.map(
              loading: (_) => const CircularProgressIndicator(),
              error: (error) => Text(error.message),
              success: (success) => Column(
                children: const [
                  Expanded(
                    child: FirstSection(),
                  ),
                  Expanded(
                    child: SecondSection(),
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: () => context.read<HomeCubit>().incrementCounter(),
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}

class FirstSection extends StatelessWidget {
  const FirstSection();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocSelector<HomeCubit, HomeState, int>(
        selector: (state) => state.mapOrNull(success: (success) => success.firstValue)!,
        builder: (context, firstValue) {
          print("Building only Text in FirstSection");
          return Text(firstValue.toString());
        },
      ),
    );
  }
}

class SecondSection extends StatelessWidget {
  const SecondSection();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, List<String>>(
      selector: (state) => state.mapOrNull(success: (success) => success.secondValue)!,
      builder: (context, secondValue) {
        print("Building only ListView in SecondSection");
        return ListView.builder(
          itemCount: secondValue.length,
          itemBuilder: (context, index) => Text(secondValue[index]),
        );
      },
    );
  }
}
