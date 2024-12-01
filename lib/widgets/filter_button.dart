import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String type;
  final String selectedCriteria;
  final Function(String) onPressed;

  const FilterButton({super.key, 
    required this.type,
    required this.selectedCriteria,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(type),
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedCriteria == type ? Colors.red : Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
      child: Text(type, style: TextStyle(fontWeight: selectedCriteria == type ? FontWeight.bold : FontWeight.normal)),
    );
  }
}
