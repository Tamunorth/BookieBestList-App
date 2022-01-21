import 'package:appandup_take_home/provider/user_provider.dart';
import 'package:appandup_take_home/ui/widgets/custom_text_button.dart';
import 'package:appandup_take_home/ui/widgets/widgets.dart';
import 'package:appandup_take_home/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    'assets/images/book_logo.png',
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                TextFieldBox(
                  label: 'Username',
                  controller: emailController,
                ),
                TextFieldBox(
                  label: 'Password',
                  controller: passwordController,
                  isTextObscured: true,
                ),
                CustomTextButton(
                    width: 300.0,
                    label: 'Login',
                    onPressed: () async {
                      final authhh = await context
                          .read<AuthService>()
                          .signIn(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim())
                          .timeout(Duration(milliseconds: 2000), onTimeout: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Server Timeout, check your network'),
                          duration: Duration(milliseconds: 500),
                        ));
                      });
                      authhh!.contains('dd')
                          ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(authhh.toString()),
                              duration: Duration(milliseconds: 500),
                            ))
                          : null;
                    }),
                SizedBox(height: 20.0),
                Text('Forgot Password?'),
                SizedBox(height: 50.0),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, RoutingConstants.SignUpROute);
                      },
                      child: Text('Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16.0)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
