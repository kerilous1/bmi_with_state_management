import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/bmi_cubit.dart';
import '../widgets/custom_input_card.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
            'BMI Calculator',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent,
            ),
        ),
        centerTitle: true,
      ),

      //BlocListener
      body: BlocListener<BmiCubit, BmiState>(
        listener: (context, state) {

          //check input and show error message
          if (state is BmiError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    state.errorMessage,
                    style: const TextStyle(fontSize: 16, color: Colors.white)
                ),
                behavior: SnackBarBehavior.floating,
                margin: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(16),
                ),
                backgroundColor: Colors.redAccent,
                duration: const Duration(seconds: 3),
              ),
            );
          }

          //if all thing are checked
          else if (state is BmiCalculate) {
            FocusScope.of(context).unfocus();

            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80),
                  ),
                  elevation: 10,
                  backgroundColor: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Your BMI',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Text(
                          state.bmiResult.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w900,
                            color: Colors.lightGreenAccent,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          state.statusCategory,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent,
                          ),
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },

        //BlocBuilder
        child: BlocBuilder<BmiCubit, BmiState>(
          builder: (context, state) {
            var cubit = context.read<BmiCubit>();

            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    CustomInputCard(
                      title: 'Age',
                      icon: Icons.cake_outlined,
                      hintText: cubit.age.toString() ,
                      onChanged: (value) {
                        cubit.changeAge(int.tryParse(value)??0);
                      },
                    ),

                    const SizedBox(height: 10,),

                    CustomInputCard(
                      title: 'Height in  Cm',
                      icon: Icons.height_outlined,
                      hintText: cubit.height.toString() ,
                      onChanged: (value) {
                        cubit.changeHeight(double.tryParse(value)??0);
                      },
                    ),

                    const SizedBox(height: 10,),

                    CustomInputCard(
                      title: 'Weight in  Kg',
                      icon: Icons.monitor_weight_outlined,
                      hintText: cubit.weight.toString() ,
                      onChanged: (value) {
                        cubit.changeWeight(double.tryParse(value)??0);
                      },
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(15),
                          ),
                          elevation: 5,
                        ),
                        onPressed: (){
                          FocusScope.of(context).unfocus();
                          cubit.calculateBmi();
                        },
                        child: const Text(
                          'Calculate',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        ),
                      )
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}