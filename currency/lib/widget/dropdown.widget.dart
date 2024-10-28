import 'package:flutter/material.dart';

class DropdownCurrencyWidget extends StatelessWidget {
  final String value;
  final List<String> items;
  final Function(String?) onChanged;

  const DropdownCurrencyWidget({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: SizedBox(
          width: 100,
          child: DropdownButton<String>(
            isExpanded: true,
            value: value,
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
