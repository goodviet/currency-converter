import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({super.key, this.onChange, required this.textController, this.hintText,});
  final TextEditingController textController;
  final Function(String)? onChange;
    final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[300],
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 25),
      ),
      onChanged: onChange,
    );
  }
}
