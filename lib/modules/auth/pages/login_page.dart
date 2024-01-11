import 'package:flutter/material.dart';
import 'package:learn_material_3/extensions/build_context_extension.dart';
import 'package:learn_material_3/extensions/text_style_extension.dart';
import 'package:learn_material_3/generated/l10n.dart';
import 'package:learn_material_3/widgets/my_button.dart';
import 'package:learn_material_3/widgets/my_textfield.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                MyTextfield(hintText: S.of(context).email, controller: _emailController),
                const SizedBox(height: 10),
                MyTextfield(
                    hintText: S.of(context).password,
                    obscureText: true,
                    controller: _passwordController),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      S.of(context).forgotPassword,
                      style:
                          TextStyle(color: context.colorScheme.inversePrimary),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                MyButton(
                  text: "Login",
                  onTap: () {},
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).dontHaveAnAccount,
                      style: TextStyle(
                        color: context.colorScheme.inversePrimary,
                      ),
                    ),
                    GestureDetector(
                        onTap: widget.onTap,
                        child: Text(S.of(context).registerHere,
                            style: const TextStyle().bold)),
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
