import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) => GestureDetector(
  onTap: () => FocusScope.of(context).unfocus(),
    child: Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 65.0,),
              //Icon Logo
              Container(
                height: 140,
                child: Image.asset("assets/logo.png"),
              ),
              //greeting text
              Text("DOSS",
                style: GoogleFonts.roboto(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF006BDE),
                ),
              ),
              const Expanded(
                flex: 1,
                child: Text('Bem-vindo!',
                    style: TextStyle(
                      fontSize: 16,
                    )),
              ),

              const SizedBox(height: 15.0,),

              //email text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      suffixIcon: const Icon(
                        Icons.mail,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0,),
              //password text field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        suffixIcon: const Icon(
                          Icons.lock,
                        ),
                      ),
                    ),
                  ),
              //login button
              const SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        // Respond to button press
                      },
                      style:  ElevatedButton.styleFrom(
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
                ),
              //not a member? register now

              const SizedBox(height: 15.0),
               Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Esqueçeu a senha? ',
                      style: TextStyle(
                        color: Colors.black87,
                        fontStyle: FontStyle.italic,
                      ),),
                    Text('recupere-a',
                      style: TextStyle(
                        color: Color(0xFF1C3C5E),
                        fontWeight: FontWeight.bold,
                      ),)
                  ],
                ),
              ),

              const Expanded(child: SizedBox(
                height: 250,
              ))

            ],
          ),
        ),
      ),
    ) );
}
