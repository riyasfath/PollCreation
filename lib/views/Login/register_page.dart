// import 'package:flutter/material.dart';
//
// class SignupPage extends StatefulWidget {
//   @override
//   _SignupPageState createState() => _SignupPageState();
// }
//
// class _SignupPageState extends State<SignupPage> {
//   final _formKey = GlobalKey<FormState>(); // For form validation
//
//   // Text editing controllers for signup fields
//   final _usernameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green, // Green app bar
//         elevation: 0.0, // Remove shadow effect
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white), // Back button
//           onPressed: () => Navigator.pop(context), // Navigate back
//         ),
//         title: const Center(
//           child: Padding(
//             padding: EdgeInsets.only(right:55),
//             child: Text(
//               'Polls App',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               bottomRight: Radius.circular(25),
//               bottomLeft: Radius.circular(25)),
//         ),
//       ),
//       body: SingleChildScrollView( // Allow scrolling if needed
//         padding: const EdgeInsets.all(20.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Sign Up',
//                 style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.lightGreen
//                 ),
//               ),
//               const SizedBox(height: 20.0),
//
//               // Username field
//               TextFormField(
//                 controller: _usernameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Username',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.person,color: Colors.lightGreen,),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter your username.';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 10.0),
//
//               // Email field
//               TextFormField(
//                 controller: _emailController,
//                 keyboardType: TextInputType.emailAddress, // Email keyboard type
//                 decoration: const InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.email,color: Colors.lightGreen,),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter your email.';
//                   } else if (!value.isValidEmail) {
//                     return 'Please enter a valid email address.';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 10.0),
//
//               // Password field
//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.lock,color: Colors.lightGreen),
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
//               // Sign Up Button
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center, // Center horizontally
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         // Handle signup logic (e.g., API call)
//                       }
//                     },
//                     child: const Text('Sign Up'),
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.green, backgroundColor: Colors.white, // Text color for pressed state
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
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
//
// extension EmailValidator on String {
//   bool get isValidEmail {
//
//     final emailRegExp = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");
//     return emailRegExp.hasMatch(this);
//   }
// }


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pollapk/services/auth_service.dart';

import '../components/my_button.dart';
import '../components/my_textField.dart';

class RegisterPage extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmpwController = TextEditingController();

  final void Function()? onTap;

  RegisterPage({super.key,required this.onTap});

   void register(BuildContext context){
     
     final _auth = AuthService();
     if(_pwController.text == _confirmpwController.text) {
       try{
         _auth.signUpWithEmailPassword(_emailController.text, _pwController.text);
       }catch(e){
         showDialog(
             context: context,
             builder: (context) => AlertDialog(
               title: Text(e.toString()),
             ));

       }

     }
     else{
       showDialog(context: context, builder: (context) => const AlertDialog(
         title: Text(
           "Password Don't match"
         ),
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
              'Let s create and account!',
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
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              hintText: 'Confirm Password',
              controller: _confirmpwController,
              obscureText: true,
            ),
            const SizedBox(height: 25),

            MyButton(
              text: 'Register',
              onTap: () => register(context),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('Already have an account? ',style: TextStyle(
                  color: Colors.white
              ),

              ),
              GestureDetector(
                onTap: onTap,
                child: Text('Login now',
                  style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )
            ])
          ],
        ),
      ),
    );;
  }
}
