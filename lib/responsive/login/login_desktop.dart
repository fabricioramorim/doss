// ignore_for_file: camel_case_types
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class loginPageDesktop extends StatefulWidget {
  const loginPageDesktop({Key? key}) : super(key: key);

  @override
  State<loginPageDesktop> createState() => _loginPageState();
}

class _loginPageState extends State<loginPageDesktop> {
  final emailController = TextEditingController();
  final passwdController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwdController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFF007BFF),
        body: SafeArea(
            child: Row(
          children: [
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  SvgPicture.asset(
                    'assets/images/login_left.svg',
                    width: 400,
                  )
                ])),
            Expanded(
              child: Scaffold(
                backgroundColor: const Color(0xFFFFFFFF),
                body: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Doss",
                          style: GoogleFonts.roboto(
                            fontSize: 48.0,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF006BDE),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(2, 0, 0, 30),
                          child: Text('Bem-vindo!',
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                              minWidth: 100, maxWidth: 350),
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: 'E-mail',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              suffixIcon: const Icon(
                                Icons.mail,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 20.0,
                        ),

                        Container(
                          constraints: const BoxConstraints(
                              minWidth: 100, maxWidth: 350),
                          child: TextField(
                            controller: passwdController,
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              suffixIcon: const Icon(
                                Icons.lock,
                              ),
                            ),
                          ),
                        ),

                        //login button
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 140,
                              height: 48,
                              child: ElevatedButton(
                                onPressed: signIn,
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    primary: Colors.dossBlueLigth,
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                child: const Text('Entrar'),
                              ),
                            ),
                            /*Expanded(
                              flex: 2,
                              child: Row(
                                children: const [
                                  Text(
                                    'Esqueçeu a senha? ',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    'recupere-a',
                                    style: TextStyle(
                                      color: Color(0xFF1C3C5E),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            )*/
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
      ));
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwdController.text.trim());
  }
}
