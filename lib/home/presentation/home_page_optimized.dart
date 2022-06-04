import 'package:bloc_suboptimal_mistake/home/cubit/home_cubit.dart';
import 'package:bloc_suboptimal_mistake/home/cubit/home_state.dart';
import 'package:bloc_suboptimal_mistake/home/presentation/widgets/first_section.dart';
import 'package:bloc_suboptimal_mistake/home/presentation/widgets/second_section.dart';
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
                children: [
                  Expanded(
                    child: BlocBuilder<HomeCubit, HomeState>(
                      // Rebuild only when firstValue changed
                      buildWhen: (previous, current) {
                        if (previous is Success && current is Success) {
                          return previous.firstValue != current.firstValue;
                        }
                        return false;
                      },
                      builder: (context, state) {
                        if (state is Success) {
                          return FirstSection(state.firstValue);
                        } else {
                          throw Exception('Impossible'); // or just return SizedBox ;)
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<HomeCubit, HomeState>(
                      // Rebuild only when secondValue changed
                      buildWhen: (previous, current) {
                        if (previous is Success && current is Success) {
                          return previous.secondValue != current.secondValue;
                        }
                        return false;
                      },
                      builder: (context, state) {
                        if (state is Success) {
                          return SecondSection(state.secondValue);
                        } else {
                          throw Exception('Impossible'); // or just return SizedBox ;)
                        }
                      },
                    ),
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
