import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _imagemApp = AssetImage("assets/images/padrao.jpeg");
  var _imagemUser = AssetImage("assets/images/padrao.jpeg");
  var _mensagem = "Escolha uma das opções abaixo:";
  var _escolhaUser = 0;
  var _escolhaApp = 0;
  var _empate = 0;

  void _opcaoSelecionada(String escolhaDoUsuario) {
    var opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = Random().nextInt(3);
    var aleatorioApp = opcoes[numero];

switch (escolhaDoUsuario) {
      case 'pedra':
        setState(() {
          _imagemUser = AssetImage("assets/images/pedra.jpeg");
        });
        break;
      case 'papel':
        setState(() {
          _imagemUser = AssetImage("assets/images/papel.jpeg");
        });
        break;
      case 'tesoura':
        setState(() {
          _imagemUser = AssetImage("assets/images/tesoura.jpeg");
        });
        break;
      default:
    }
    switch (aleatorioApp) {
      case 'pedra':
        setState(() {
          _imagemApp = AssetImage("assets/images/pedra.jpeg");
        });
        break;
      case 'papel':
        setState(() {
          _imagemApp = AssetImage("assets/images/papel.jpeg");
        });
        break;
      case 'tesoura':
        setState(() {
          _imagemApp = AssetImage("assets/images/tesoura.jpeg");
        });
        break;
      default:
    }
    if ((escolhaDoUsuario == 'pedra' && aleatorioApp == 'tesoura') ||
        (escolhaDoUsuario == 'tesoura' && aleatorioApp == 'papel') ||
        (escolhaDoUsuario == 'papel' && aleatorioApp == 'pedra')) {
      setState(() {
        _mensagem = 'Você ganhou!';
        _escolhaUser += 1;
      });
    } else if ((escolhaDoUsuario == aleatorioApp)) {
      setState(() {
        _mensagem = 'Empatou!';
        _empate += 1;
      });
    } else {
      setState(() {
        _mensagem = 'App ganhou!';
        _escolhaApp += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogo Jokenpo'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              '1,2,3 . . . Já',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: _imagemUser),
              Image(image: _imagemApp),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada('pedra'),
                child: Image.asset(
                  'assets/images/pedra.jpeg',
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('papel'),
                child: Image.asset(
                  'assets/images/papel.jpeg',
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('tesoura'),
                child: Image.asset(
                  'assets/images/tesoura.jpeg',
                  height: 100,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text('Você: $_escolhaUser',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('App: $_escolhaApp',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('Empate: $_empate',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }
}
