import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ButtonCustomWidget extends StatelessWidget {
  const ButtonCustomWidget({super.key, this.onTap, required this.text});

  final Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 240,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Màu bóng
            spreadRadius: 5, // Tăng diện tích bóng
            blurRadius: 7, // Độ mờ của bóng
            offset: Offset(0, 5), // Đẩy bóng xuống dưới
          ),
        ], borderRadius: BorderRadius.circular(30), color: Colors.red),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        )),
      ),
    );
  }
}
