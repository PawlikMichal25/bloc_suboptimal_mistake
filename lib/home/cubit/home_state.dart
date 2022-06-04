import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = Loading;

  const factory HomeState.error(String message) = Error;

  const factory HomeState.success(int firstValue, List<String> secondValue) = Success;
}
