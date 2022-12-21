import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class FormInput extends StatefulWidget {
  const FormInput(
      {Key? key,
      this.obscureForm = false,
      required this.assetIcon,
      required this.title,
      required this.hintText,
      required this.controller})
      : super(key: key);

  final bool obscureForm;
  final String assetIcon;
  final String title;
  final String hintText;
  final TextEditingController controller;

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: backgroundColor2,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Image.asset(
                widget.assetIcon,
                width: 17,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  obscureText: widget.obscureForm ? isObscurePassword : false,
                  style: primaryTextStyle,
                  cursorColor: primaryColor,
                  decoration: InputDecoration.collapsed(
                    hintText: widget.hintText,
                    hintStyle: subtitleTextStyle,
                  ),
                ),
              ),
              Container(
                child: widget.obscureForm
                    ? GestureDetector(
                        child: Icon(
                          isObscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: primaryColor,
                        ),
                        onTap: () {
                          setState(() {
                            isObscurePassword = !isObscurePassword;
                          });
                        },
                      )
                    : null,
              ),
            ],
          ),
        )
      ],
    );
  }
}
