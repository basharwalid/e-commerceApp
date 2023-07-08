import 'package:flutter/material.dart';
typedef MyValidator = String? Function (String?);
class CustomFormField extends StatelessWidget {
  String label;
  String hint;
  bool ispassword;
  TextInputType keyboardtype;
  TextEditingController controller;
  MyValidator validator;
  int lines;
  CustomFormField(
      {required this.label,
        required this.hint,
      this.ispassword = false,
      this.keyboardtype = TextInputType.text,
      required this.validator,
      required this.controller,
        this.lines=1
      });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
            style: TextStyle(
              color: Theme.of(context).primaryColor
            ),
          ),
          const SizedBox(height: 10,),
          TextFormField(

            minLines: lines,
            maxLines: lines,
            controller: controller,
            validator: validator,
            obscureText: ispassword,
            keyboardType: keyboardtype,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Theme.of(context).primaryColor
              ),
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Theme.of(context).primaryColor , width: 2)
            ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor , width: 2)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor , width: 2)
              )
            ),
          ),
        ],
      ),
    );
    ;
  }
}
