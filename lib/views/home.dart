import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<IconData> _icons = [
    Icons.circle,
    Icons.note,
    Icons.content_cut,
  ];
  IconData _escolhaUsuario = Icons.question_mark;
  IconData _escolhaMaquina = Icons.question_mark;
  String _vencedor = "";

  int maquina = 0;

  String resultado = "Escolha um para continuar...";

  void selecaoUsuario(int selecao) {
    setState(() {
      _escolhaUsuario = _icons[selecao];
    });
  }

  void sorteiaMaquina() {
    setState(() {
      _escolhaMaquina = _icons[Random().nextInt(_icons.length) + 0];
    });
  }

  void calculaVencedor(int selecao) {
    selecaoUsuario(selecao);
    sorteiaMaquina();
    int userChoice = _icons.indexOf(_escolhaUsuario);
    int botChoice = _icons.indexOf(_escolhaMaquina);

    print(userChoice);
    print(botChoice);
    String resultado = "";
    if (userChoice == 1) {
      if (botChoice == 0) {
        resultado = "Usuário";
      } else if (botChoice == 1) {
        resultado = "Empate";
      } else {
        resultado = "Máquina";
      }
    } else if (userChoice == 0) {
      if (botChoice == 2) {
        resultado = "Usuário";
      } else if (botChoice == 0) {
        resultado = "Empate";
      } else {
        resultado = "Máquina";
      }
    } else if (userChoice == 2) {
      if (botChoice == 1) {
        resultado = "Usuário";
      } else if (botChoice == 2) {
        resultado = "Empate";
      } else {
        resultado = "Máquina";
      }
    }

    setState(() {
      _vencedor = resultado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jo-Ken-Po"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
        child: Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: Column(
                      children: [
                        const Text(
                          "Seleção do Jogador",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Icon(
                          _escolhaUsuario,
                          size: 50,
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "VS",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: Column(
                      children: [
                        const Text(
                          "Seleção da Máquina",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Icon(
                          _escolhaMaquina,
                          size: 50,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  const Text(
                    "Vencedor: ",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    _vencedor,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 50),
                          maximumSize: const Size(200, 50),
                          elevation: 5,
                        ),
                        onPressed: () {
                          calculaVencedor(0);
                        },
                        child: const Text("Pedra"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 50),
                          maximumSize: const Size(200, 50),
                          elevation: 5,
                        ),
                        onPressed: () {
                          calculaVencedor(1);
                        },
                        child: const Text("Papel"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 50),
                          maximumSize: const Size(200, 50),
                          elevation: 5,
                        ),
                        onPressed: () {
                          calculaVencedor(2);
                        },
                        child: const Text("Tesoura"),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
