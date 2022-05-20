import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zakaz/core/components/text_form_field_comp.dart';
import 'package:zakaz/core/constants/fonts.dart';
import 'package:zakaz/core/constants/padding.dart';
import 'package:zakaz/provider/show_password_provider.dart';
import 'package:zakaz/service/signin_service.dart';
import 'package:zakaz/size_config/size_config.dart';
import 'package:zakaz/widgets/general_widgets/buttons.dart';
import 'package:zakaz/widgets/general_widgets/messenger.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: SizedBox(
                  child: Image.asset("assets/images/Welcome Illustration.png"),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.all(Constants.kPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome", style: MyFonts.kTitles),
                      Text(
                          "Welcome to Organico Mobile Apps. Please fill in the field below to sign in.",
                          style: MyFonts.kInfoTexts),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: _emailController,
                              decoration: TextFormFeldComp.inputDecoration(
                                hint: "Your Email",
                                label: "Email",
                                prefixIcon: const Icon(Icons.email),
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
                            SizedBox(
                              height: getHeight(10.0),
                            ),
                            TextFormField(
                                controller: _passwordController,
                                obscureText: context
                                    .watch<ShowPasswordProvider>()
                                    .obscure,
                                decoration: TextFormFeldComp.inputDecoration(
                                    hint: "Your Password",
                                    label: "Password",
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: MyButtons.suffixIcon(context)),
                                validator: (value) => value!.isEmpty
                                    ? "Please Fill the Form"
                                    : null),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                  primary: const Color(0xFF2ECC71)),
                              child: const Text("Sign Up"),
                              onPressed: () {
                                Navigator.pushNamed(context, "/signUpPage");
                              },
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  primary: const Color(0xFF2ECC71)),
                              child: const Text("Forgot Password?"),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: MyButtons.elevatedButtonStyle(getHeight(46)),
                        child: const Text("Sign In"),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            SigninService.signInWithEmail(_emailController.text,
                                    _passwordController.text)
                                .then(
                              (value) {
                                if (value) {
                                  MyMessenger.showMessenger(
                                      context, "Success", Colors.green);
                                  return Navigator.pushNamedAndRemoveUntil(
                                      context, "/", (route) => false);
                                } else {
                                  MyMessenger.showMessenger(context,
                                      "User Does Not Exists", Colors.redAccent);
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
