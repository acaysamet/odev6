import 'package:flutter/material.dart';

void main() {
  runApp(BenimUygulamam());
}

class BenimUygulamam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KayitFormu(),
    );
  }
}

class KayitFormu extends StatefulWidget {
  @override
  _KayitFormuDurum createState() => _KayitFormuDurum();
}

class _KayitFormuDurum extends State<KayitFormu> {
  final _formKey = GlobalKey<FormState>();

  String _isim = '';
  String _email = '';
  String _sifre = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kayıt Formu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'İsim'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen isminizi girin';
                  }
                  return null;
                },
                onSaved: (value) {
                  _isim = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-posta'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen e-posta adresinizi girin';
                  }
                  String pattern = r'\w+@\w+\.\w+';
                  if (!RegExp(pattern).hasMatch(value)) {
                    return 'Geçerli bir e-posta adresi girin';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Şifre'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen şifrenizi girin';
                  }
                  if (value.length < 6) {
                    return 'Şifreniz en az 6 karakter olmalıdır';
                  }
                  return null;
                },
                onSaved: (value) {
                  _sifre = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Form başarıyla kaydedildi')),
                    );
                  }
                },
                child: Text('Kaydet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
