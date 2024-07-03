import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:qanoun_sahl/models/user.dart';
import 'package:qanoun_sahl/utils/assets_manager.dart';
import 'package:qanoun_sahl/views/auth/auth_provider.dart';
import 'package:qanoun_sahl/views/auth/recover_email_screen.dart';
import 'package:qanoun_sahl/views/auth/register_screen.dart';
import 'package:qanoun_sahl/views/core/qanoun_sahl_screen.dart';
import 'package:qanoun_sahl/views/themes/q_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController =
          TextEditingController(text: ""),
      _passwordController = TextEditingController(text: "");

  final _formKey = GlobalKey<FormState>();

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
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
                                "أدخل معلوماتك للمواصلة",
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
                                controller: _emailController,
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "ملء هذا الحقل إجباري";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 20.0),
                                  labelText: "البريد الإلكتروني",
                                  labelStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SvgPicture.asset(
                                      AssetsManager.iconify("message"),
                                      color: QColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
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
                                        !showPassword
                                            ? AssetsManager.iconify("hide")
                                            : AssetsManager.iconify("show"),
                                      ),
                                    ),
                                  ),
                                ),
                                obscureText: !showPassword,
                              ),
                            ),
                            SizedBox(
                              width: 320,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RecoverEmailScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "نسيت كلمة المرور؟",
                                    style: TextStyle(
                                      color: QColors.primaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                              width: double.infinity,
                            ),
                            TextButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  User? user = await authProvider.login(
                                      email: _emailController.text,
                                      password: _passwordController.text);
                                  if (user == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "حصل خطأ، يرجي المحاولة مرة أخرى")),
                                    );
                                  } else {
                                    while (Navigator.canPop(context)) {
                                      Navigator.pop(context);
                                    }
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const QanounSahlScreen(),
                                      ),
                                    );
                                  }
                                }
                              },
                              child: const Center(
                                child: Text(
                                  "تسجيل الدخول",
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
                            "ليس لديك حساب؟ ",
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
                                  builder: (context) => const RegisterScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "أنشء حسابا",
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
      },
    );
  }
}
