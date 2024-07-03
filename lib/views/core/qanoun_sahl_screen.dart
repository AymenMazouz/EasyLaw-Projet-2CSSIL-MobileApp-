import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qanoun_sahl/providers/navigation_provider.dart';
import 'package:qanoun_sahl/views/core/chat/chat_screen.dart';
import 'package:qanoun_sahl/views/core/drawer/q_drawer.dart';
import 'package:qanoun_sahl/views/core/notifications/notifications_screen.dart';
import 'package:qanoun_sahl/views/themes/q_colors.dart';
import 'package:qanoun_sahl/views/widgets/circle_button.dart';

class QanounSahlScreen extends StatefulWidget {
  const QanounSahlScreen({super.key});

  @override
  State<QanounSahlScreen> createState() => _QanounSahlScreenState();
}

class _QanounSahlScreenState extends State<QanounSahlScreen> {
  double width = 20;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationProvider>(
          create: (context) => NavigationProvider(),
        ),
      ],
      child: Consumer<NavigationProvider>(
          builder: (context, naviagtionProvider, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 8, 10),
                          child: Row(
                            children: [
                              CircleButton(
                                icon: "menu",
                                onTap: () {
                                  setState(() {
                                    width = 300;
                                  });
                                },
                              ),
                              const Spacer(),
                              CircleButton(
                                icon: "gpt",
                                onTap: () {
                                  naviagtionProvider
                                      .saveAndGoto(const ChatScreen());
                                },
                              ),
                              const SizedBox(width: 10),
                              CircleButton(
                                icon: "notification",
                                onTap: () {
                                  naviagtionProvider
                                      .saveAndGoto(const NotificationsScreen());
                                },
                              ),
                            ],
                          ),
                        ),
                        naviagtionProvider.selectedScreen,
                      ],
                    ),
                  ),
                  if (width > 20)
                    Expanded(
                      child: Container(
                        color: QColors.blackColor.withOpacity(.2),
                      ),
                    ),
                  QDrawer(
                    onClick: () {
                      setState(() {
                        width = 20;
                      });
                    },
                    width: width,
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class TopBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double height = size.height, width = size.width;
    final double centerX = size.width * .5, centerY = size.height * .5;
    final paint = Paint();
    paint.color = QColors.primaryColor;
    final path = Path();
    path.moveTo(width * .5, 15);
    path.quadraticBezierTo(width * .6, height * .15, width * .62, height * .6);
    path.quadraticBezierTo(width * .64, height * .95, width * .8, height);
    path.lineTo(width, height);
    path.lineTo(width, 0);
    path.lineTo(0, 0);
    path.moveTo(width * .5, 15);
    path.quadraticBezierTo(width * .4, height * .15, width * .38, height * .6);
    path.quadraticBezierTo(width * .36, height * .95, width * .2, height);
    path.lineTo(0, height);
    path.lineTo(0, 0);
    path.moveTo(width * .5, height * .5);
    path.addOval(
      Rect.fromCenter(
          center: Offset(centerX, centerY + 10),
          width: height * .65,
          height: height * .65),
    );
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
