import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_material_3/extensions/build_context_extension.dart';
import 'package:learn_material_3/extensions/text_style_extension.dart';
import 'package:learn_material_3/generated/l10n.dart';
import 'package:learn_material_3/helpers/helper_functions.dart';
import 'package:learn_material_3/helpers/validators.dart';
import 'package:learn_material_3/widgets/my_button.dart';
import 'package:learn_material_3/widgets/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> registerUser() async {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
      try {
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text);
        if (mounted) Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        if (mounted) {
          Navigator.pop(context);
          displayMessage(e.code, context);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: 80,
                  color: context.colorScheme.inversePrimary,
                ),
                const SizedBox(height: 25),
                const Text(
                  "M I N I M A L",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 50),
                MyTextfield(
                  hintText: S.of(context).email,
                  controller: _emailController,
                  validator: Validator.emailValidation,
                ),
                const SizedBox(height: 10),
                MyTextfield(
                  hintText: "Username",
                  controller: _usernameController,
                  validator: (value) => Validator.nullOrEmptyValidation(
                      value, "Please enter username"),
                ),
                const SizedBox(height: 10),
                MyTextfield(
                  hintText: "Password",
                  obscureText: true,
                  controller: _passwordController,
                  validator: Validator.passwordValidation,
                ),
                const SizedBox(height: 10),
                MyTextfield(
                  hintText: "Confirm Password",
                  obscureText: true,
                  controller: _confirmPasswordController,
                  validator: (value) => Validator.confirmPasswordValidation(
                      value, _passwordController.text),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style:
                          TextStyle(color: context.colorScheme.inversePrimary),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                MyButton(
                  text: "Register",
                  onTap: registerUser,
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: context.colorScheme.inversePrimary,
                      ),
                    ),
                    GestureDetector(
                        onTap: widget.onTap,
                        child:
                            Text("Login here", style: const TextStyle().bold)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
