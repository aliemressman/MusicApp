import 'package:flutter/material.dart';
import 'package:music_app/context_extension.dart';
import 'package:music_app/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:music_app/features/auth/view/widgets/custom_field.dart';

import '../../../../core/theme/app_pallet.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
    formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign Up.",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: context.dynamicHeight(0.1)),
              CustomField(hintText: "Name", controller: nameController),
              SizedBox(height: context.dynamicHeight(0.025)),
              CustomField(hintText: "Email", controller: emailController),
              SizedBox(height: context.dynamicHeight(0.025)),
              CustomField(
                  hintText: "Password",
                  controller: passwordController,
                  obscureText: true),
              SizedBox(height: context.dynamicHeight(0.1)),
              const AuthGradientButton(),
              SizedBox(height: context.dynamicHeight(0.1)),
              RichText(
                text: TextSpan(
                  text: "Al ready have an account? ",
                  style: Theme.of(context).textTheme.titleMedium,
                  children: const [
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(
                          color: Pallete.gradient2,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
