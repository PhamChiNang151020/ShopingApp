import 'package:flutter/material.dart';
import 'package:shopping/presentation/presentation.dart';
import 'package:shopping/presentation/widget/btn_default.dart';
import 'package:shopping/presentation/widget/icon_custom.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ValueNotifier _isShowPasswordNotifier = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(MyAssets.imgWelcome),
              )),
              child: Container(),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: IconCustom(iConURL: MyAssets.icUser, size: 10),
                      ),
                      hintText: "User name",
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    obscureText: _isShowPasswordNotifier.value,
                    decoration: InputDecoration(
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child:
                            IconCustom(iConURL: MyAssets.icPassword, size: 10),
                      ),
                      suffixIcon: ValueListenableBuilder(
                        valueListenable: _isShowPasswordNotifier,
                        builder: (context, value, child) => GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            _isShowPasswordNotifier.value =
                                !_isShowPasswordNotifier.value;
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: IconCustom(
                                iConURL: _isShowPasswordNotifier.value == true
                                    ? MyAssets.icEyeOff
                                    : MyAssets.icEyeOn,
                                size: 25),
                          ),
                        ),
                      ),
                      hintText: "Password",
                    ),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {},
                    child: const Text("Forgot Password ?"),
                  ),
                  const SizedBox(height: 15),
                  DefaultButton(buttonText: "Sign in", onPressed: () {}),
                  const SizedBox(height: 15),
                  const Text("Forgot Password ?"),
                  DefaultButton(
                    buttonText: "Sign in with Google",
                    onPressed: () {},
                    isCustomOnButton: true,
                    buttonColor: MyColor.colorInput,
                    widgetLeft:
                        const IconCustom(iConURL: MyAssets.icGoogle, size: 25),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Need to create an account ?"),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "Sign up",
                          style: TextStyle(color: MyColor.defaultColor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
