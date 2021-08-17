import 'package:flutter/material.dart';

//? realizando import do package que criamos
import 'package:cep_search/cep_search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Cep'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<ViaCepSearch>(
          future: ViaCepSearch.getInstance('15060035'),
          builder: (context, snapshot) {
            return Text(snapshot.data == null ? '' : snapshot.data!.bairro);
          },
        ),
      ),
    );
  }
}
