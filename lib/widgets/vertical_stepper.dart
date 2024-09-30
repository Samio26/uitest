import 'package:flutter/material.dart';

class VerticalStepper extends StatelessWidget {
  const VerticalStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildStep("Nov", "18"),  
        _buildLine(), 
        _buildStep("Nov", "19")  
      ],
    );
  }

  Widget _buildStep(String month, String day) {
    return Container(
      padding: const EdgeInsets.only(top:6,bottom: 6,right: 10,left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: .2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            month,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          Text(
            day,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLine() {
    return Container(
      width: .3, 
      height: 120, 
      color: Colors.black, 
    );
  }
}
