import 'package:flutter/material.dart';
import 'package:mvvm_october/resource/components/colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final bool loading;
  RoundButton(
      {super.key,
      required this.title,
      required this.onPress,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 45,
        width: 200,
        decoration: BoxDecoration(
            color: AppColors.blue, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                )
              : Text(title),
        ),
      ),
    );
  }
}
