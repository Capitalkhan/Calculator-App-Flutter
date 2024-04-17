import 'package:flutter/material.dart';







class MyBtn extends StatelessWidget {
  final String title;
  final Color chosColor;
  final VoidCallback onPress;
  const MyBtn({super.key,required this.title, this.chosColor = Colors.grey, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 7),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
                color: chosColor,

            ),
            child: Center(child: Text(title, style: TextStyle(fontSize: 20),)),
          ),
        ),
      ),
    );
  }
}

