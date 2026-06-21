import 'package:flutter/material.dart';

class CustomInputCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String hintText;
  final Function(String) onChanged;
  const CustomInputCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onChanged,
    required this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color:Colors.greenAccent.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0,5),
          ),
        ],
      ),
      child: Padding(
          padding:const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent,
                ),
              ),
              Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.greenAccent,
                    size: 30,
                  ),
                  Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: hintText,
                          hintStyle: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent.withOpacity(0.3),
                          ),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        onChanged: onChanged,
                      ) ,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.greenAccent,
                    size: 30,
                  ),
                ],
              ),
            ],
          ),
      ),
    ) ;
  }
}
