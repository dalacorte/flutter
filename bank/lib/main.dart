import 'package:flutter/material.dart';

void main() {
  runApp(Bank());
}

class Bank extends StatelessWidget {
  const Bank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controllerConta = TextEditingController();
  final TextEditingController _controllerValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent.shade100,
        title: Text("Criando transferencia"),
      ),
      body: Column(
        children: <Widget>[
          Editor(
            controller: _controllerConta,
            label: "Número da conta",
            hint: "000",
          ),
          Editor(
            controller: _controllerValor,
            label: "Valor",
            hint: "0.00",
            icon: Icons.monetization_on,
          ),
          ElevatedButton(
            onPressed: () {
              _transferencia(_controllerConta, _controllerValor);
            },
            child: Text("Confirmar"),
          )
        ],
      ),
    );
  }
}

void _transferencia(TextEditingController _controllerConta,
    TextEditingController _controllerValor) {
  final int? conta = int.tryParse(_controllerConta.text);
  final double? valor = double.tryParse(_controllerValor.text);
  if (conta != null && valor != null) {
    final transferencia = Transferencia(valor, conta);
    debugPrint('$transferencia');
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final IconData? icon;

  Editor({this.controller, this.label, this.hint, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent.shade100,
        title: Text('Transferencias'),
      ),
      body: Column(children: <Widget>[
        ItemTransferencia(Transferencia(100.0, 1000)),
        ItemTransferencia(Transferencia(200.0, 2000)),
        ItemTransferencia(Transferencia(300.0, 3000)),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.conta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double? valor;
  final int? conta;

  Transferencia(this.valor, this.conta);

  @override
  String toString() {
    return '{valor: $valor, conta: $conta}';
  }
}
