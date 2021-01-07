import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dersAdi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ortalama Hesapla"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: UygulamaGovdesi(),
    );
  }

  Widget UygulamaGovdesi() {
    return Container(
          
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
            color: Colors.pink,
            child: Form(
                child: Column(
              children: <Widget>[
                TextFormField(
                    decoration: InputDecoration(
                      labelText: "Ders Adı",
                      hintText: "Ders Adını Giriniz",
                      border: OutlineInputBorder(),
                    ),
                    validator: (girilendeger) {
                      if (girilendeger.length > 0) {
                        return null;
                      } else {
                        return "Ders Adını giriniz";
                      }
                    },
                    onSaved: (kaydedilecekdeger) {
                      dersAdi = kaydedilecekdeger;
                    })
              ],
            )),
          )),
          Expanded(
              child: Container(
            color: Colors.green,
            child: Column(
              children: [],
            ),
          ))
        ],
      ),
    );
  }
}
