import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qanoun_sahl/utils/assets_manager.dart';
import 'package:qanoun_sahl/views/auth/login_screen.dart';
import 'package:qanoun_sahl/views/core/qanoun_sahl_screen.dart';
import 'package:qanoun_sahl/views/themes/q_colors.dart';

class RecoverPasswordScreen extends StatefulWidget {
  const RecoverPasswordScreen({super.key});

  @override
  State<RecoverPasswordScreen> createState() => _RecoverPasswordScreenState();
}

class _RecoverPasswordScreenState extends State<RecoverPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController(),
      _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool showPassword = false;

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
              padding: const EdgeInsets.fromLTRB(15, 135, 15, 100),
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
                            "الرجاء إنشاء كلمة سر قوية، لتسجيل الدخول إلى حسابك",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 320,
                          height: 88,
                          child: TextFormField(
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "ملء هذا الحقل إجباري";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 20.0),
                              labelText: "كلمة المرور",
                              labelStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                  AssetsManager.iconify("lock"),
                                  color: QColors.primaryColor,
                                ),
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SvgPicture.asset(
                                    showPassword
                                        ? AssetsManager.iconify("hide")
                                        : AssetsManager.iconify("show"),
                                  ),
                                ),
                              ),
                            ),
                            obscureText: showPassword,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 320,
                          height: 88,
                          child: TextFormField(
                            controller: _confirmPasswordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "ملء هذا الحقل إجباري";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 20.0),
                              labelText: "تأكيد كلمة المرور",
                              labelStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                  AssetsManager.iconify("lock"),
                                  color: QColors.primaryColor,
                                ),
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                    AssetsManager.iconify("hide")),
                              ),
                            ),
                            obscureText: true,
                          ),
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
                                  builder: (context) => const QanounSahlScreen(),
                                ),
                              );
                            }
                          },
                          child: const Center(
                            child: Text(
                              "تأكيـــــد",
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
