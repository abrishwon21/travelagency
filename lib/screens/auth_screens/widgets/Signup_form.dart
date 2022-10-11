import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/screens/auth_screens/login.dart';
import 'package:travel_app/screens/home_screen.dart';
import 'package:travel_app/services/Provider/userProvider.dart';

import '../../../constants.dart';
import 'custom_button.dart';
import 'custom_input_field.dart';
import 'fade_slide_transition.dart';

class SignUpForm extends StatelessWidget {
  final Animation<double> animation;

  const SignUpForm({
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top;
    final space = height > 650 ? kSpaceM : kSpaceS;
// navigate to login page
    Future<void> _goToLogin(screenheight) async {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => Login(screenHeight: screenheight)
            // Login(screenHeight: widget.screenHeight),
            ),
      );
    }

    // end navigation function
    // controllers
      final TextEditingController _usernameController = TextEditingController();
      final TextEditingController _passwordController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
      child: Column(
        children: <Widget>[
                  FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
           
            // textfield
           child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(kPaddingM),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black.withOpacity(0.12)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black.withOpacity(0.12)),
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: kBlack.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: kBlack.withOpacity(0.5),
                    ),
                  ),
                 
                  
                )
            //end of textfield
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: space,
             // textfield
           child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(kPaddingM),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black.withOpacity(0.12)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black.withOpacity(0.12)),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: kBlack.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: kBlack.withOpacity(0.5),
                    ),
                  ),
                  obscureText: true,
                )
            //end of textfield
          
          ),

          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 2 * space,
            child: CustomButton(
              color: kBlue,
              textColor: kWhite,
              text: 'Sign Up',
              onPressed: () async {
                    var username = _usernameController.text;
                    var password = _passwordController.text;

                       Provider.of<User>(context, listen: false)
                        .signIn(username.toString(), password.toString())
                        .then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeScreen()));
                    }).catchError(
                      (){}
                    );
              },
            ),
          ),
          SizedBox(height: 2 * space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 3 * space,
            child: CustomButton(
              color: kWhite,
              textColor: kBlack.withOpacity(0.5),
              text: 'Continue with Google',
              image: const Image(
                image: AssetImage("${kImagePath}/google_logo.png"),
                height: 48.0,
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(height: space),
          Row(
            children: [
              Text(
                'have a finot account?',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: space - 2,
              ),
              // button
              FadeSlideTransition(
                animation: animation,
                additionalOffset: 4 * space,
                child: CustomButton(
                  color: kBlack,
                  textColor: kWhite,
                  text: 'Login',
                  onPressed: () {
                    _goToLogin(screenHeight);
                  },
                ),
              ),
              // end button
            ],
          )
        ],
      ),
    );
  }
}
