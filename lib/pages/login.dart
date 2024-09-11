import 'package:apps/theme/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSignup = false;

  // Controllers for input fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Observable to control password visibility
  final ValueNotifier<bool> _isObscure = ValueNotifier<bool>(true);

  final String hardcodedEmail = 'user@gmail.com';
  final String hardcodedPassword = 'password';

  void toggleSignup() {
    setState(() {
      isSignup = !isSignup;
    });
  }

  void signIn() {
    if (emailController.text == hardcodedEmail &&
        passwordController.text == hardcodedPassword) {
      Navigator.pushReplacementNamed(context, '/Home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Text(
              'Invalid email or password',
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          elevation: 0,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 400, // Adjusts the maximum width of the form
              minHeight: MediaQuery.of(context)
                  .size
                  .height, // Ensures full screen height
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                        height:
                            40), // Optional padding to create spacing from the top
                    // Add CircleAvatar with logo image
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: CustomColor.trustColor,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset('assets/images/mbrwhitelogo.png',
                            width: 70.0, height: 70.0),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (isSignup)
                      SizedBox(
                        height: 45,
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade300, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: CustomColor.trustColor, width: 2),
                            ),
                          ),
                        ),
                      ),
                    SizedBox(height: isSignup ? 10 : 0),
                    SizedBox(
                      height: 45,
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                          floatingLabelStyle:
                              const TextStyle(color: CustomColor.trustColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey.shade300, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: CustomColor.trustColor, width: 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ValueListenableBuilder<bool>(
                      valueListenable: _isObscure,
                      builder: (context, value, child) {
                        return SizedBox(
                          height: 45,
                          child: TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              floatingLabelStyle: const TextStyle(
                                  color: CustomColor.trustColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade300, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: CustomColor.trustColor, width: 2),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () =>
                                    _isObscure.value = !_isObscure.value,
                              ),
                            ),
                            obscureText: value,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    if (isSignup)
                      SizedBox(
                        height: 45,
                        child: TextField(
                          controller: confirmPasswordController,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade300, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: CustomColor.trustColor, width: 2),
                            ),
                          ),
                          obscureText: true,
                        ),
                      ),
                    SizedBox(height: isSignup ? 10 : 0),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          if (isSignup) {
                            // Handle signup logic
                          } else {
                            signIn();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColor.trustColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          isSignup ? 'Sign Up' : 'Sign In',
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: toggleSignup,
                      child: Text(
                        isSignup
                            ? 'Already have an account? Sign In'
                            : 'Don\'t have an account? Sign Up',
                        style: const TextStyle(
                          color: CustomColor.trustColor,
                          fontFamily: 'Poppins',
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Handle Google sign-in
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(color: Colors.grey)),
                          elevation: 0,
                        ),
                        icon: Image.asset(
                          'assets/images/google.png',
                          height: 20,
                        ),
                        label: const Text(
                          'Sign-in with Google',
                          style: TextStyle(
                            color: CustomColor.trustColor,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Handle Apple sign-in
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(color: Colors.grey)),
                          elevation: 0,
                        ),
                        icon: Image.asset(
                          'assets/images/apple.png',
                          height: 20,
                        ),
                        label: const Text(
                          'Sign-in with Apple',
                          style: TextStyle(
                            color: CustomColor.trustColor,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
