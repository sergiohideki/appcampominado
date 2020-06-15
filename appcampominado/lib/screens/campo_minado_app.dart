import 'package:appcampominado/components/campo_widget.dart';
import 'package:appcampominado/components/tabuleiro_widget.dart';
import 'package:appcampominado/models/tabuleiro.dart';
import 'package:flutter/material.dart';
import '../components/resultado_widget.dart';
import '../models/campo.dart';
import '../models/explosao_exception.dart';

class CampoMinadoApp extends StatefulWidget {
  @override
  _CampoMinadoAppState createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
  void _reiniciar() {
    print('reiniciar');
  }

  void _abrir(Campo campo) {
    print('abrir');
  }

  void _alternarMarcacao(Campo campo) {
    print('alternar marcação');
  }

  @override
  Widget build(BuildContext context) {
    Campo vizinho1 = Campo(linha: 1, coluna: 0);
    vizinho1.minar();
    Campo vizinho2 = Campo(linha: 1, coluna: 1);
    vizinho1.minar();

    Campo campo = Campo(linha: 0, coluna: 0);
    campo.adicionarVizinho(vizinho1);
    campo.adicionarVizinho(vizinho2);

    try {
      // campo.minar();
      campo.alternarMarcacao();
    } on ExplosaoException {}

    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: false,
          onReiniciar: _reiniciar,
        ),
        body: Container(
          child: TabuleiroWidget(
            tabuleiro: Tabuleiro(
              linhas: 15,
              colunas: 15,
              qtdeBombas: 10,
            ),
            onAbrir: _abrir,
            onAlternarMarcacao: _alternarMarcacao,
          ),
        ),
      ),
    );
  }
}
