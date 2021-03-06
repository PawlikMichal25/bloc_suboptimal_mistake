import 'package:bloc_suboptimal_mistake/home/cubit/home_cubit.dart';
import 'package:bloc_suboptimal_mistake/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..loadProducts(), // Will load "secondValue"
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state.map(
              loading: (_) => const CircularProgressIndicator(),
              error: (error) => Text(error.message),
              success: (success) => Column(
                children: [
                  Expanded(
                    child: FirstSection(success.firstValue), // FirstSection depends only on "firstValue"
                  ),
                  Expanded(
                    child: SecondSection(success.secondValue), // SecondSection depends only on "secondValue"
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: () => context.read<HomeCubit>().incrementCounter(), // Will update "firstValue"
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}

class FirstSection extends StatelessWidget {
  final int value;

  const FirstSection(this.value);

  @override
  Widget build(BuildContext context) {
    print("Building FirstSection");
    return Center(
      child: Text(value.toString()),
    );
  }
}

class SecondSection extends StatelessWidget {
  final List<String> products;

  const SecondSection(this.products);

  @override
  Widget build(BuildContext context) {
    print("Building SecondSection");
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) => Text(products[index]),
    );
  }
}
