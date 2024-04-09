import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalTextField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final bool isAmount, isCardNumber;

   const GlobalTextField({
    super.key,
    required this.title,
    required this.controller,
    this.isAmount = false,
    this.isCardNumber = false,
  });

  @override
  State<GlobalTextField> createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
        if(value == null || value.isEmpty){
          return "Please enter ${widget.title}";
        }
        return null;
      },
      onChanged: (value){
        if(widget.isCardNumber){
          if (value.isNotEmpty && value.length % 5 == 0) {
            final int cursorPos = widget.controller.selection.baseOffset + 1;
            widget.controller.value = TextEditingValue(
              text: value.substring(0, value.length - 1) + ' ' + value.substring(value.length - 1),
              selection: TextSelection.collapsed(offset: cursorPos),
            );
          }
        }
      },

      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        labelText: widget.title,
      ),
      keyboardType: widget.isAmount? TextInputType.phone : TextInputType.text,
    );
  }
}
