import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  Color _selectedColor = Colors.black; // Default selected color

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        
        children: [
          _buildColorButton( Color.fromRGBO(231, 204, 183, 1.0)),
           SizedBox(width: 10),
          _buildColorButton(Colors.grey),
           SizedBox(width: 10),
          _buildColorButton(Colors.black),
        ],
      ),
    );
  }

  Widget _buildColorButton(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColor = color; // Update selected color on tap
        });
      },
      child: AnimatedContainer(duration: Duration(milliseconds: 300),decoration:BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(
              color:Colors.transparent,
              width: 2,
            ),
          ), 
        child: Container(
          width: 35,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(
              color: _selectedColor == color ? Colors.white : Colors.transparent,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
