import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learnflow_backoffice/dto/login_information.dto.dart';
import 'package:learnflow_backoffice/screens/home/home_screen.dart';
import 'package:learnflow_backoffice/screens/login/widgets/login_elevated_button.dart';
import 'package:learnflow_backoffice/screens/login/widgets/login_form_card.dart';
import 'package:learnflow_backoffice/services/api/api_service.dart';
import 'package:learnflow_backoffice/services/authentication/secure_storage.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
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
                          onPressed: () async {
                            final loginInformation = LoginInformation(
                              email: ref.watch(loginInputProvider),
                              password: ref.watch(passwordInputProvider),
                            );
                            try {
                              final apiToken = await ref
                                  .watch(secureStorageProvider)
                                  .getApiToken();
                              final manager = await ref
                                  .read(apiServiceProvider(apiToken))
                                  .login(loginInformation);
                              debugPrint(manager);
                              SnackBar loginSuccessSnackbar = const SnackBar(
                                  content: Text("Vous êtes bien connecté"));
                              if (!mounted) return;
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(loginSuccessSnackbar);
                              if (!mounted) return;
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const HomeScreen();
                                  },
                                ),
                              );
                            } catch (e) {
                              SnackBar loginErrorSnackbar = const SnackBar(
                                content: Text("Identifiants incorrectes"),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(loginErrorSnackbar);
                            }
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
