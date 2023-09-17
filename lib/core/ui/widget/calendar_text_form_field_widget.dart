import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CalendarTextFormFieldWidget extends StatelessWidget {
  const CalendarTextFormFieldWidget({
    required this.name,
    required this.hint,
    this.onTap,
    super.key,
  });

  final String name;
  final String hint;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      readOnly: true,
      decoration: InputDecoration(
        suffixIcon: const Icon(
          Icons.calendar_month,
          size: 20,
        ),
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        isDense: true,
        hintStyle: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade400,
            fontWeight: FontWeight.bold),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade100,
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
            Radius.circular(20),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade100,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade100,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
