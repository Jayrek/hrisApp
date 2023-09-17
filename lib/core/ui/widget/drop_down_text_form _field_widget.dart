import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DropDownTextFormFieldWidget extends StatelessWidget {
  const DropDownTextFormFieldWidget(
      {required this.name,
      required this.items,
      required this.initialValue,
      super.key});

  final String name;
  final List<DropdownMenuItem> items;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown(
      decoration: InputDecoration(
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
            Radius.circular(50),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade100,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade100,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
      name: name,
      initialValue: initialValue,
      items: items,
    );
  }
}
