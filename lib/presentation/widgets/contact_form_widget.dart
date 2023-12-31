// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/responsive_layout_constants.dart';
import 'package:portfolio/data/models/message_data_model.dart';
import 'package:portfolio/data/repo/repository.dart';
import 'package:portfolio/presentation/widgets/animated_button_large.dart';
import 'package:portfolio/presentation/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

final _formKey = GlobalKey<FormState>();

class ContactFormWidget extends StatefulWidget {
  const ContactFormWidget({
    super.key,
  });

  @override
  State<ContactFormWidget> createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends State<ContactFormWidget> {
  late final TextEditingController _nameControler;
  late final TextEditingController _emailControler;
  late final TextEditingController _subjectControler;
  late final TextEditingController _messageControler;
  bool loading = false;

  @override
  void initState() {
    _nameControler = TextEditingController();
    _emailControler = TextEditingController();
    _subjectControler = TextEditingController();
    _messageControler = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameControler.dispose();
    _emailControler.dispose();
    _subjectControler.dispose();
    _messageControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final phone = MediaQuery.of(context).size.width < fBP;
    return Container(
      constraints: const BoxConstraints(maxWidth: 700),
      padding: const EdgeInsets.only(left: 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            !phone
                ? Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField1(
                          nameControler: _nameControler,
                          hintText: "Your Name",
                          validator: (value) {
                            if (value != null && value.isNotEmpty) {
                              return null;
                            }
                            return "Empty Field!";
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: CustomTextFormField1(
                          nameControler: _emailControler,
                          hintText: "Your Email",
                          validator: (value) {
                            if (value != null &&
                                value.endsWith("@gmail.com") &&
                                value.length > 15 &&
                                value.length < 50) {
                              return null;
                            }
                            return "Invalid Email!";
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: CustomTextFormField1(
                          nameControler: _subjectControler,
                          hintText: "Your Subject",
                          validator: (value) {
                            if (value != null && value.isNotEmpty) {
                              return null;
                            }
                            return "Empty Field!";
                          },
                        ),
                      ),
                    ],
                  )
                : Column(children: [
                    CustomTextFormField1(
                      nameControler: _nameControler,
                      hintText: "Your Name",
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          return null;
                        }
                        return "Empty Field!";
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField1(
                      nameControler: _emailControler,
                      hintText: "Your Email",
                      validator: (value) {
                        if (value != null &&
                            value.endsWith("@gmail.com") &&
                            value.length > 15 &&
                            value.length < 50) {
                          return null;
                        }
                        return "Invalid Email!";
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField1(
                      nameControler: _subjectControler,
                      hintText: "Your Subject",
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          return null;
                        }
                        return "Empty Field!";
                      },
                    ),
                  ]),
            const SizedBox(
              height: 30,
            ),
            CustomTextFormField1(
              nameControler: _messageControler,
              hintText: "Your Message",
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                }
                return "Empty Field!";
              },
              maxLength: 100,
              maxLines: 10,
            ),
            const SizedBox(height: 30),
            !loading
                ? AnimatedButtonLarge(
                    iconData: Icons.send_rounded,
                    label: "Send Message".toUpperCase(),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        loading = true;
                        setState(() {});
                        final send = await Provider.of<FirebaseRepository>(
                                context,
                                listen: false)
                            .sendMessage(
                          MessageDataModel(
                            name: _nameControler.text,
                            email: _emailControler.text,
                            subject: _subjectControler.text,
                            message: _messageControler.text,
                            dateTime: DateTime.now(),
                          ),
                        );
                        loading = false;
                        final resMsg = send
                            ? "Message send successfully"
                            : "Message sending faild";
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(resMsg)),
                        );
                        setState(() {});
                      }
                    },
                    size: const Size(220, 48),
                  )
                : const SizedBox(
                    width: 220,
                    height: 48,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CircularProgressIndicator(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
