import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.icon,
      this.iconColor,
      this.obsecureText = false,
      this.validator,
      this.onChangeVisibilty,
      this.showPassword = false,
      this.backgroundColor = Colors.grey})
      : super(key: key);
  final String hintText;
  final IconData icon;
  final Color? iconColor;
  final bool obsecureText;
  final String? Function(String? text)? validator;
  final VoidCallback? onChangeVisibilty;
  final bool showPassword;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        obscureText: showPassword,
        validator: validator,
        decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.all(0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            filled: true,
            fillColor: backgroundColor,
            hintText: hintText,
            prefixIcon: Icon(icon),
            suffix: obsecureText
                ? GestureDetector(
                    onTap: onChangeVisibilty,
                    child: Icon(
                        showPassword ? Icons.visibility_off : Icons.visibility))
                : null),
      ),
    );
  }
}
