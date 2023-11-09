import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tip Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double billAmount = 0.0;
  double tipAmount = 0.0;
  int serviceQuality = 0; // 0 represents normal service, 1 represents outstanding service
  static const double tipPercentage = 0.15;

  void calculateTip() {
    setState(() {
      tipAmount = billAmount * tipPercentage * (serviceQuality == 0 ? 1.0 : 1.5);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

    children: <Widget>[
    TextField(
    decoration: InputDecoration(labelText: 'Enter Bill Amount'),
    keyboardType: TextInputType.number,
    onChanged: (value) {
    setState(() {
    billAmount = double.tryParse(value) ?? 0.0;
    });
    },
    ),
    SizedBox(height: 20),
    Row(
    children: <Widget>[
    Text('Service Quality:'),
    SizedBox(width: 10),
    DropdownButton<int>(
    value: serviceQuality,
    items: <DropdownMenuItem<int>>[
    DropdownMenuItem<int>(
    value: 0,
    child: Text('Normal Service'),
    ),
    DropdownMenuItem<int>(
    value: 1,
    child: Text('Outstanding Service'),
    ),
    ],
    onChanged: (value) {
    setState(() {
    serviceQuality = value ?? 0;
    });
    },
    ),
    ],
    ),
    SizedBox(height: 20),
    ElevatedButton(
    onPressed: calculateTip,
    child: Text('Calculate Tip'),
    ),
    SizedBox(height: 20),
    Text('Tip Amount: \$${tipAmount.toStringAsFixed(2)}'),
    ],
    ),
  }
}
