import 'package:appandup_take_home/provider/user_provider.dart';
import 'package:appandup_take_home/ui/widgets/custom_text_button.dart';
import 'package:appandup_take_home/ui/widgets/widgets.dart';
import 'package:appandup_take_home/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                  height: 20.0,
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
                TextFieldBox(
                  label: 'Confirm Password',
                  controller: confirmPasswordController,
                  isTextObscured: true,
                ),
                // CustomTextButton(
                //     width: 300.0,
                //     label: 'Sign Up',
                //     onPressed: () {
                //       context.read<AuthService>().signUp(
                //           email: emailController.text.trim(),
                //           password: passwordController.text.trim());
                //     }),
                CustomTextButton(
                    width: 300.0,
                    label: 'Sign Up with Google',
                    onPressed: () {
                      context.read<GoogleSignInService>().signInWithGoogle();
                      Navigator.pushReplacementNamed(
                          context, RoutingConstants.HomePageRoute);
                      // final provider = Provider.of<GoogleSignInService>(context,
                      //     listen: false);
                      // provider.signInWithGoogle();
                    }),
                SizedBox(height: 20.0),
                Text('Forgot Password?'),
                SizedBox(height: 20.0),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Have an account already? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, RoutingConstants.AuthPageRoute);
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16.0),
                      ),
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
