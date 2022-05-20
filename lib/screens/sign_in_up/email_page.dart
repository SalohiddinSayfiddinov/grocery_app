import 'package:flutter/material.dart';
import 'package:zakaz/core/components/text_form_field_comp.dart';
import 'package:zakaz/core/constants/fonts.dart';
import 'package:zakaz/core/constants/padding.dart';
import 'package:zakaz/service/firestore_service.dart';
import 'package:zakaz/service/signup_service.dart';
import 'package:zakaz/size_config/size_config.dart';
import 'package:zakaz/widgets/general_widgets/app_bar.dart';
import 'package:zakaz/widgets/general_widgets/buttons.dart';
import 'package:zakaz/widgets/general_widgets/messenger.dart';

class EmailPage extends StatelessWidget {
  String? password;
  EmailPage({Key? key, this.password}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.appBar(title: "Your Email"),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.89,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  child: Image.asset("assets/images/Forgot Illustration.png"),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(Constants.kPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Enter Your Email",
                        style: MyFonts.kTitles,
                      ),
                      Text(
                        "We need to verify you. We will send you a verification Email.",
                        style: MyFonts.kInfoTexts,
                      ),
                      Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: _emailController,
                          decoration: TextFormFeldComp.inputDecoration(
                            hint: "Your Email",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Fill the Form";
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return "Enter Your Email";
                            }
                          },
                        ),
                      ),
                      ElevatedButton(
                        child: const Text("Next"),
                        style: MyButtons.elevatedButtonStyle(getHeight(52)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            AddDataToFirestore.mapim.addAll(
                              {"email": _emailController.text},
                            );
                            SignUpService.signUpWithEmailAndPAssword(
                                    _emailController.text, password!)
                                .then(
                              (value) {
                                if (value) {
                                  Navigator.pushNamed(
                                      context, "/emailVerificationPage");
                                } else {
                                  MyMessenger.showMessenger(context,
                                      "Something is Wrong", Colors.redAccent);
                                }
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
