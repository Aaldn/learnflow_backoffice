import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learnflow_backoffice/widgets/elevated_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _authFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFFA384), Color(0xFFFFD27A)],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
            ),
          ),
          child: LayoutBuilder(
            builder: (context, boxConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: boxConstraints.maxHeight),
                  child: Form(
                    key: _authFormKey,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 80, bottom: 80),
                        child: Column(
                          children: [
                            Text(
                              "Learn Flow",
                              style: GoogleFonts.lalezar().copyWith(
                                color: Colors.white,
                                fontSize: 48,
                              ),
                            ),
                            const SizedBox(height: 100),
                            SizedBox(
                              width: 400,
                              child: Column(
                                children: [
                                  Card(
                                    //TODO: add elevation card to theme
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 20, 15, 40),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          TextField(
                                            decoration: InputDecoration(
                                              hintText: "Email",
                                              prefixIcon: Icon(Icons.email),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          TextField(
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              hintText: "Mot de passe",
                                              prefixIcon: Icon(Icons.key),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 50),
                            MyElevatedButton(
                              onPressed: () {},
                              child: const Text("Se connecter"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
