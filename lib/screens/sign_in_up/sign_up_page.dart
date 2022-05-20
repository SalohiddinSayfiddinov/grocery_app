import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zakaz/core/components/text_form_field_comp.dart';
import 'package:zakaz/core/constants/fonts.dart';
import 'package:zakaz/core/constants/padding.dart';
import 'package:zakaz/provider/show_password_provider.dart';
import 'package:zakaz/service/firestore_service.dart';
import 'package:zakaz/size_config/size_config.dart';
import 'package:zakaz/widgets/general_widgets/app_bar.dart';
import 'package:zakaz/widgets/general_widgets/buttons.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.appBar(title: "New Registration"),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(Constants.kPadding),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: getHeight(20.0)),
                height: getHeight(66.0),
                child: Text(
                    "It looks like you don’t have an account on this number. Please let us know some information for a secure service.",
                    style: MyFonts.kInfoTexts),
              ),
              SizedBox(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      hintText(context, "Full Name"),
                      TextFormField(
                          controller: _nameController,
                          decoration: TextFormFeldComp.inputDecoration(
                            hint: "Full Name",
                          ),
                          validator: (value) =>
                              value!.isEmpty ? "Please Fill the Form" : null),
                      hintText(context, "Password"),
                      TextFormField(
                          controller: _passwordController,
                          obscureText:
                              context.watch<ShowPasswordProvider>().obscure,
                          decoration: TextFormFeldComp.inputDecoration(
                              hint: "Password",
                              suffixIcon: MyButtons.suffixIcon(context)),
                          validator: (value) =>
                              value!.isEmpty ? "Please Fill the Form" : null),
                      hintText(context, "Password Confirmation"),
                      TextFormField(
                          controller: _passwordConfirmController,
                          obscureText:
                              context.watch<ShowPasswordProvider>().obscure,
                          decoration: TextFormFeldComp.inputDecoration(
                              hint: "Password Confirmation",
                              suffixIcon: MyButtons.suffixIcon(context)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Fill the Form";
                            } else if (value != _passwordController.text) {
                              return "Passwords did not match";
                            }
                          }),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: getHeight(40.0),
                  bottom: getHeight(30.0),
                ),
                child: ElevatedButton(
                  style: MyButtons.elevatedButtonStyle(
                    getHeight(52),
                  ),
                  child: const Text("Sign Up"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      AddDataToFirestore.mapim.addAll({
                        "fullname": _nameController.text,
                        "password": _passwordController.text,
                      });
                      Navigator.pushNamed(context, "/emailPage",
                          arguments: _passwordController.text);
                    }
                  },
                ),
              ),
              const Text(
                "or use",
                style: TextStyle(color: Colors.grey),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: getHeight(30.0),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    side: const BorderSide(color: Colors.black),
                    elevation: 0,
                    fixedSize: Size(getWidth(374), getHeight(52)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        getHeight(100.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Sign Up With Google",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/emailPage');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container hintText(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02),
      child: Text(text, style: MyFonts.kTitles),
    );
  }
}
