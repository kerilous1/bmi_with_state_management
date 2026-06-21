import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bmi_state.dart';

// enum for gender & status
enum Gender { male, female }
enum Status { underweight, normal, overweight, obese }

class BmiCubit extends Cubit<BmiState> {

  BmiCubit() : super(BmiInitial());

  bool isMale = true;
  double height = 160;
  double weight = 60;
  int age = 20;

  // change gender
  void changeGender(bool isMale) {
    this.isMale = isMale;
    emit(BmiInitial());
  }

  // change height
  void changeHeight(double height) {
    this.height = height;
    emit(BmiInitial());
  }

  // change weight
  void changeWeight(double weight) {
    this.weight = weight;
    emit(BmiInitial());
  }

  // change age
  void changeAge(int age) {
    this.age = age;
    emit(BmiInitial());
  }

  // function to calculate bmi
  void calculateBmi() {
    if(weight<=0){
      emit(BmiError(errorMessage: 'Weight must be greater than 0'));
      return;
    }if(height<50){
      emit(BmiError(errorMessage: 'Height must be greater than 50'));
      return;
    }if(age<=0){
      emit(BmiError(errorMessage: 'Age must be greater than 0'));
      return;
    }
    double heightInMeters = height / 100;
    double bmi = weight / pow(heightInMeters, 2);

    String status;
    switch (bmi) {
      case < 18.5:
        status = Status.underweight.name;
      case >= 18.5 && < 25:
        status = Status.normal.name;
      case >= 25 && < 30:
        status = Status.overweight.name;
      case >= 30:
        status = Status.obese.name;
      default:
        status = Status.normal.name;
    }

    emit(
      BmiCalculate(
        bmiResult: bmi,
        statusCategory: status,
      ),
    );
  }

}