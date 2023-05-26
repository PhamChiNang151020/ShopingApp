import 'package:flutter/material.dart';
import 'package:shopping/presentation/presentation.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final userNameController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Register Account",
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: IconCustom(iConURL: MyAssets.icMail, size: 10),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: userNameController,
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: IconCustom(iConURL: MyAssets.icUser, size: 10),
                    ),
                    hintText: "User name",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "User Name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: "Password",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: IconCustom(iConURL: MyAssets.icPassword, size: 10),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                DefaultButton(
                  buttonText: "Register",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
