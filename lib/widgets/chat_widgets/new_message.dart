import 'package:flutter/material.dart';
import 'package:zakaz/core/components/text_form_field_comp.dart';

class NewMessage {
  static final _textController = TextEditingController();

  static newMessage() {
    return Row(
      children: [
        TextFormField(
          controller: _textController,
          decoration: TextFormFeldComp.inputDecoration(),
        ),
      ],
    );
  }
}
