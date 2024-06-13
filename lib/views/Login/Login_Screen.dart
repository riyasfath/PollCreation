// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../services/auth_service.dart';
// import '../Home_Page.dart';
// import 'ForgetPassword.dart';
// import 'register_page.dart';
//
// class LoginPage extends StatefulWidget {
//
//   void login(BuildContext context) async{
//     //auth service
//     final authService = AuthService();
// try{
//   await authService.signInWithEmailAndPassword(_emailController.text, _pwController.text);
// }
// catch(e) {
//   showDialog(context: context, builder: builder)
// }
//
//   }
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>(); // For form validation
//
//   // Text editing controllers for username/email and password
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green, // Set app bar color to green
//         elevation: 0.0, // Remove shadow effect
//         title: const Center(
//           child: Text(
//             'Polls App',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.white, // Text color adjusted for darker background
//             ),
//           ),
//         ),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               bottomRight: Radius.circular(25),
//               bottomLeft: Radius.circular(25)),
//         ),
//       ),
//       body: SingleChildScrollView(
//         // Allow scrolling if needed
//         padding: const EdgeInsets.all(20.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 50,
//               ),
//               // Centered elements at the top
//               const Row(
//                 mainAxisAlignment:
//                 MainAxisAlignment.center, // Center horizontally
//                 children: [
//                   Text(
//                     'Login',
//                     style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.lightGreen),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 35.0),
//
//               // Username/Email field
//               TextFormField(
//                 controller: _usernameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Username/Email',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(
//                     Icons.person,
//                     color: Colors.lightGreen,
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter your username or email.';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 15.0),
//
//               // Password field
//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(
//                     Icons.lock,
//                     color: Colors.lightGreen,
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter your password.';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20.0),
//
//               // Centered Login Button
//               Row(
//                 mainAxisAlignment:
//                 MainAxisAlignment.center, // Center horizontally
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         Get.to(HomePage());
//                         // Handle login logic (e.g., API call)
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.green,
//                       backgroundColor:
//                       Colors.white, // Text color for pressed state
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                     ),
//                     child: const Text('Login'),
//                   ),
//                 ],
//               ),
//
//               const SizedBox(height: 20.0),
//
//               // Forget Password and Sign Up (adjust spacing as needed)
//               Row(
//                 mainAxisAlignment:
//                 MainAxisAlignment.spaceBetween, // Align left and right
//                 children: [
//                   TextButton(
//                     onPressed: () => {
//                       Get.to(ForgotPasswordPage())
//                     }, // Implement forget password logic
//                     child: const Text(
//                       'Forgot Password?',
//                       style: TextStyle(color: Colors.green),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () => {
//                       Get.to(SignupPage())
//                     }, // Handle signup navigation
//                     child: const Text(
//                       'Sign Up',
//                       style: TextStyle(color: Colors.green),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pollapk/services/auth_service.dart';
import 'package:pollapk/views/components/my_button.dart';
import 'package:pollapk/views/components/my_textField.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  void login(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _pwController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.poll,
              size: 60,
              color: Colors.white,
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Welcome to the Poll App!',
              style: TextStyle(
                  color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 25),
            MyTextField(
                hintText: 'Email',
                controller: _emailController,
                obscureText: false),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              hintText: 'Password',
              controller: _pwController,
              obscureText: true,
            ),
            const SizedBox(height: 25),
            MyButton(
              text: 'Login',
              onTap: () => login(context),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'Not a member ? ',
                style: TextStyle(color: Colors.white),
              ),
              GestureDetector(
                onTap: onTap,
                child: const Text(
                  'Register now',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
