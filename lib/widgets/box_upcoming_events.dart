import 'package:flutter/material.dart';
import 'package:ui/widgets/vertical_stepper.dart';

class VerticalStepperWithImage extends StatelessWidget {
  const VerticalStepperWithImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250, 
      child: Row(
        children: [
          const VerticalStepper(),
          const SizedBox(width: 20,),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/chef.jpeg'), 
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}