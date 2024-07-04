import 'package:flutter/material.dart';
import 'package:responsi_helfrans/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 10.0),
            Column(
              children: <Widget>[
                Image.asset('assets/venom.jpg'),
                const SizedBox(height: 1.0),
                Text(
                  'SHRINE',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 44.0),
            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.primary,
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    elevation: 7.0,
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
                ),
                ElevatedButton(
                  child: const Text('NEXT'),
                  onPressed: () {
                    String name = _usernameController.text;
                    String password = _passwordController.text;
                    if (name == '2200016149' && password == 'helfrans') {
                      Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text('Nama user atau password salah'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.primary,
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    elevation: 7.0,
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 44.0),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Belum punya akun?',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(width: 8.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
