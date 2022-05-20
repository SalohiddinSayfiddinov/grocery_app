import 'package:flutter/material.dart';
import 'package:zakaz/core/components/text_form_field_comp.dart';
import 'package:zakaz/size_config/size_config.dart';
import 'package:zakaz/widgets/general_widgets/app_bar.dart';
import 'package:zakaz/widgets/chat_widgets/new_message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.appBar(title: "Chat Page"),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Container(
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 1,
              child: NewMessage.newMessage(),
            ),
          ],
        ),
      ),
    );
  }
}
