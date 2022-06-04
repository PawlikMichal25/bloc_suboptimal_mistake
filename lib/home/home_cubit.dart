import 'package:bloc_suboptimal_mistake/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.loading());

  void loadProducts() {
    emit(
      const HomeState.success(
        0,
        ['Sample', "Sample 2", "Sample 3"],
      ),
    );
  }

  void incrementCounter() {
    state.maybeMap(
      success: (success) => emit(success.copyWith(firstValue: success.firstValue + 1)),
      orElse: () {},
    );
  }
}
