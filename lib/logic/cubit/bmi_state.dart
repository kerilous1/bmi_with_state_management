part of 'bmi_cubit.dart';

sealed class BmiState {}
final class BmiInitial extends BmiState {}
final class BmiCalculate extends BmiState {
  final double bmiResult;
  final String statusCategory;

  BmiCalculate({
    required this.bmiResult,
    required this.statusCategory
  });
}
final class BmiError extends BmiState {
  final String errorMessage;
  BmiError({required this.errorMessage});
}
