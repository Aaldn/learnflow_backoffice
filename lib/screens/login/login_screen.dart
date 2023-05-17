import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learnflow_backoffice/screens/home_screen.dart';
import 'package:learnflow_backoffice/screens/login/login_elevated_button.dart';
import 'package:learnflow_backoffice/screens/login/login_form_card.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                constraints: BoxConstraints(
                  minHeight: boxConstraints.maxHeight,
                ),
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
                        const SizedBox(
                          width: 400,
                          child: MyLoginFormCard(),
                        ),
                        const SizedBox(height: 50),
                        MyLoginElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const HomeScreen();
                                },
                              ),
                            );
                          },
                          child: const Text("Se connecter"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
