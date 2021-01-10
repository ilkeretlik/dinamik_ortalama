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
  int dersKredi = 1;
  double dersHarfDegeri = 4;

  List<ListItem> _dropdownItems = [
    ListItem(1, "Ocak"),
    ListItem(2, "Şubat"),
    ListItem(3, "Mart"),
    ListItem(4, "Nisan")
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

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
            color: Colors.pink.shade200,
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
                    }),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal:12,vertical: 5 ),
                      margin: EdgeInsets.only(top: 10),
                      
                      decoration: BoxDecoration(border: Border.all(),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: DropdownButton(
                        
                          value: _selectedItem,
                          items: _dropdownMenuItems,
                          onChanged: (value) {
                            setState(() {
                              _selectedItem = value;
                            });
                          }),
                    )
                  ],
                ),
              ],
            )),
          )),
          Expanded(
              child: Container(
            color: Colors.green.shade200,
            child: Column(
              children: [
             Text("SEÇTİĞİNİZ DEĞER ${_selectedItem.name}"),

              ],
            ),
          ))
        ],
      ),
    );
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
