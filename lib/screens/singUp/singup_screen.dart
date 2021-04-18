import 'package:flutter/material.dart';
import 'package:loja_virtual/helpers/validators.dart';
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class SingupScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  final Usuario usuario = Usuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldMessengerKey,
      appBar: AppBar(
        title: Text('Criar conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Form(
              key: formKey,
              child: Consumer<UserManager>(builder: (_, userManeger, __) {
                return ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(16),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Nome Completo'),
                      enabled: !userManeger.loading,
                      obscureText: false,
                      validator: (nome) {
                        if (nome.isEmpty)
                          return "Campo obrigatorio";
                        else if (nome.trim().split(' ').length <= 1)
                          return "Preencha o nome completo";
                        return null;
                      },
                      onSaved: (nome) => usuario.name = nome,
                      //Está salvando o nome diretamente para para a classe Usuario
                      //sem os controladores.
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Email'),
                      enabled: !userManeger.loading,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        if (email.isEmpty)
                          return "Campo obrigatorio";
                        else if (!emailValid(email)) return "Email invalido";
                        return null;
                      },
                      onSaved: (email) => usuario.email = email,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Senha'),
                      enabled: !userManeger.loading,
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty)
                          return "Campo obrigatorio";
                        else if (value.length < 6) return "Senha muito curta";
                        return null;
                      },
                      onSaved: (senha) => usuario.password = senha,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'confirme a senha'),
                      enabled: !userManeger.loading,
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty)
                          return "Campo obrigatorio";
                        else if (value.length < 6) return "Senha muito curta";
                        return null;
                      },
                      onSaved: (confsenha) =>
                          usuario.comfirmarSenha = confsenha,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        height: 46,
                        width: 180,
                        child: ElevatedButton(
                          onPressed: userManeger.loading ? null : () {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();

                              if (usuario.password != usuario.comfirmarSenha) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text('Senhas diferentes'),
                                  backgroundColor: Colors.red,
                                ));
                                return;
                              }
                              userManeger.signUp(
                                  user: usuario,
                                  onSuccess: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Criado com sucesso!'),
                                        backgroundColor: Colors.green[300],
                                      ),
                                    );
                                    Navigator.of(context).pop();
                                  },
                                  onFail: (e) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text('Falha ao cadastrar: $e'),
                                      backgroundColor: Colors.red,
                                    ));
                                  });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                          child: userManeger.loading
                          ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          )
                          : Text(
                            "Entrar",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              })),
        ),
      ),
    );
  }
}
