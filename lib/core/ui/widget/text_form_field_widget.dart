import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.name,
    this.initialValue,
    this.validator,
    this.hint = '',
    this.isObscure = false,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.onTap,
    this.errorFontSize = 0.01,
    this.isReadOnly = false,
  });

  final String name;
  final String hint;
  final String? initialValue;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final bool isObscure;
  final TextInputAction textInputAction;
  final Function()? onTap;
  final double errorFontSize;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      onTap: onTap,
      name: name,
      keyboardType: textInputType,
      validator: validator,
      obscureText: isObscure,
      initialValue: initialValue,
      textInputAction: textInputAction,
      readOnly: isReadOnly,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        isDense: true,
        hintText: hint,
        errorStyle: TextStyle(fontSize: errorFontSize),
        hintStyle: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade400,
            fontWeight: FontWeight.bold),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.grey.shade300,
          width: 1,
        )),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.grey.shade300,
          width: 1,
        )),
      ),
    );
  }
}
