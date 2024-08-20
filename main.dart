import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MiPaginaPrincipal(titulo: 'Calculadora Flutter'),
    );
  }
}

class MiPaginaPrincipal extends StatefulWidget {
  const MiPaginaPrincipal({super.key, required this.titulo});

  final String titulo;

  @override
  State<MiPaginaPrincipal> createState() => _MiPaginaPrincipalEstado();
}

class _MiPaginaPrincipalEstado extends State<MiPaginaPrincipal> {
  double _num1 = 0;
  double _num2 = 0;
  double _resultado = 0;
  String _operacion = '';

  final TextEditingController _controladorNum1 = TextEditingController();
  final TextEditingController _controladorNum2 = TextEditingController();

  void _calcular(String operacion) {
    setState(() {
      _num1 = double.tryParse(_controladorNum1.text) ?? 0;
      _num2 = double.tryParse(_controladorNum2.text) ?? 0;
      _operacion = operacion;

      switch (operacion) {
        case '+':
          _resultado = _num1 + _num2;
          break;
        case '-':
          _resultado = _num1 - _num2;
          break;
        case '*':
          _resultado = _num1 * _num2;
          break;
        case '/':
          _resultado = _num2 != 0 ? _num1 / _num2 : double.nan;
          break;
        default:
          _resultado = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.titulo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controladorNum1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Primer Número',
              ),
            ),
            TextField(
              controller: _controladorNum2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Segundo Número',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => _calcular('+'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('*'),
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('/'),
                  child: const Text('/'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              '$_num1 $_operacion $_num2 = $_resultado',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
