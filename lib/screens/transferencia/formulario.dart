import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloApp = 'Criando Transferencia';

const _rotuloConta = 'Número da conta';
const _dicaConta = '000';

const _rotuloValor = 'Valor';
const _dicaValor = '0.00';

const _confirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controllerValor = TextEditingController();
  final TextEditingController _controllerNumeroConta = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloApp),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controller: _controllerNumeroConta,
              rotulo: _rotuloConta,
              dica: _dicaConta,
            ),
            Editor(
              controller: _controllerValor,
              rotulo: _rotuloValor,
              dica: _dicaValor,
              icon: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text(_confirmar),
              onPressed: () => _criaTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controllerNumeroConta.text);
    final double valor = double.tryParse(_controllerValor.text);

    if (numeroConta != null && valor != null) {
      final transferencia = Transferencia(valor, numeroConta);
      debugPrint('$transferencia');
      Navigator.pop(context, transferencia);
    }
  }
}
