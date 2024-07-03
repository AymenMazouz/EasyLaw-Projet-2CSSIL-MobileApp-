import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qanoun_sahl/utils/assets_manager.dart';
import 'package:qanoun_sahl/views/themes/q_colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  List<String> messages = [];
  bool writing = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Text(
                "محادثة",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            const Divider(
              thickness: 5,
              color: QColors.primaryColor,
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    messages.length,
                    (index) => SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: index % 2 == 0
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.end,
                        children: [
                          Container(
                            alignment: index % 2 != 0
                                ? Alignment.topLeft
                                : Alignment.topRight,
                            margin: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            width: 240,
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: QColors.primaryColor.withOpacity(.5),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                topLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              messages[index],
                              textAlign: index % 2 == 0
                                  ? TextAlign.right
                                  : TextAlign.left,
                              // "هذا نص تجريبي، عبارة عن سؤال في مجال القانون والأعمال الحرة المرتبطة بالبنوك؟",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Center(
                child: SizedBox(
                  width: 320,
                  height: 88,
                  child: TextFormField(
                    onSaved: (v) {
                      setState(() {
                        writing = false;
                      });
                    },
                    onEditingComplete: () {
                      setState(() {
                        writing = false;
                      });
                    },
                    onFieldSubmitted: (v) {
                      setState(() {
                        writing = false;
                      });
                    },
                    controller: _messageController,
                    onTap: () {
                      setState(() {
                        writing = true;
                      });
                    },
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
                      labelText: "اكتب شيئا ما",
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      prefixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            writing = false;
                            messages.add(_messageController.text);
                            _messageController.clear();
                            messages.add(
                              "...",
                            );
                          });
                          Future.delayed(const Duration(seconds: 2))
                              .then((value) {
                            setState(() {
                              messages.removeLast();
                              messages.add(
                                "هذا نص تجريبي، عبارة عن سؤال في مجال القانون والأعمال الحرة المرتبطة بالبنوك؟",
                              );
                            });
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            AssetsManager.iconify("send"),
                            color: QColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: writing ? 265 : 0,
            ),
          ],
        ),
      ),
    );
  }
}
