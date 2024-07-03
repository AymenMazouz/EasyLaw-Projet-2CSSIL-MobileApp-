import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qanoun_sahl/utils/assets_manager.dart';
import 'package:qanoun_sahl/views/auth/login_screen.dart';
import 'package:qanoun_sahl/views/auth/recover_password_screen.dart';
import 'package:qanoun_sahl/views/themes/q_colors.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SvgPicture.asset(
                AssetsManager.imagify("top_wave", type: ImageType.svg),
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 135, 15, 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetsManager.iconify("balance"),
                        height: 60,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "مرحبا بك في\n القانون السهل",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          width: 320,
                          alignment: Alignment.topRight,
                          child: const Text(
                            "تفقد بريدك الإلكتروني\nتم إرسال رمز يتكون من 4 أرقام إلى بريدك الإلكتروني",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 68,
                              height: 88,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                textAlignVertical: TextAlignVertical.center,
                                textInputAction: TextInputAction.next,
                                maxLength: 1,
                                decoration: const InputDecoration(
                                  counterText: "",
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 20.0),
                                ),
                              ),
                            ),
                            Container(
                              width: 68,
                              height: 88,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                textAlignVertical: TextAlignVertical.center,
                                maxLength: 1,
                                decoration: const InputDecoration(
                                  counterText: "",
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 20.0),
                                ),
                              ),
                            ),
                            Container(
                              width: 68,
                              height: 88,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                textAlignVertical: TextAlignVertical.center,
                                maxLength: 1,
                                decoration: const InputDecoration(
                                  counterText: "",
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 20.0),
                                ),
                              ),
                            ),
                            Container(
                              width: 68,
                              height: 88,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                textAlignVertical: TextAlignVertical.center,
                                maxLength: 1,
                                decoration: const InputDecoration(
                                  counterText: "",
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 20.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                          width: double.infinity,
                        ),
                        TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RecoverPasswordScreen(),
                                ),
                              );
                            }
                          },
                          child: const Center(
                            child: Text(
                              "مواصلة",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "تذكرت كلمة المرور؟ ",
                        style: TextStyle(
                          color: QColors.blackColor,
                          fontSize: 18,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "سجل الدخول",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: QColors.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
