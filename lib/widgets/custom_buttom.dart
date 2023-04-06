import 'package:flutter/material.dart';
import 'package:note_app/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,  this.onTap,  this.isLoading=false});

  final VoidCallback? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55.0,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: isLoading ?
          SizedBox(
            height: 25.0,
            width: 25.0,
            child: CircularProgressIndicator(
              color: Colors.black.withOpacity(0.2),),
          ) :
          Text(
            'Add',
            style: TextStyle(
              color: Colors.black,
              fontSize: 19.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

      ),
    );
  }
}
