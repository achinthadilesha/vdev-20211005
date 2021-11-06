import 'package:flutter/material.dart';

class LoginInputField extends StatelessWidget {
  const LoginInputField({
    Key? key,
    required this.inputfieldName,
    required this.textController,
    required this.isTextSecure,
  }) : super(key: key);

  final TextEditingController textController;
  final String inputfieldName;
  final bool isTextSecure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(flex: 3, child: Text(inputfieldName)),
          Flexible(
            flex: 7,
            child: TextField(
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.orangeAccent, width: 0.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 0.5),
                ),
              ),
              obscureText: isTextSecure,
              controller: textController,
            ),
          ),
        ],
      ),
    );
  }
}
