import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(Signin());
}

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _googleSignIn.currentUser;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Signin (signed ' + (user == null ? 'out' : 'in') + ' )'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: Text('Sign In'),
                onPressed: user != null
                    ? null
                    : () async {
                        await _googleSignIn.signIn();
                        setState(() {});
                      },
              ),
              ElevatedButton(
                child: Text('Sign Out'),
                onPressed: user == null
                    ? null
                    : () async {
                        await _googleSignIn.signOut();
                        setState(() {});
                      },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
