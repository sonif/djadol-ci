<?php 

$class_name = ucfirst($name);

$string = "
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import ".$name."_add.dart';
import ".$name."_view.dart';


class $class_name extends StatefulWidget {
  @override
  _".$class_name."State createState() => new _".$class_name."State();
}

class _".$class_name."State extends State<$class_name> {
  Future<List> getData() async {
    final response = await http.get(\"http://10.0.2.2/adi/zing-crawler/web/index.php/api/get_data/$table_name\");
    // print(response.body);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(\"MY STORE\"),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: ()=>Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (BuildContext context)=> new ".$class_name."Add(),
          )
        ),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: ()=>Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context)=> new ".$class_name."View(list:list , index: i,)
              )
            ),
            child: new Card(

              child: new ListTile(
                title: new Text(list[i]['".$label."']),
                leading: new Icon(Icons.widgets),
                // subtitle: new Text(\"Stock : \${list[i]['stock']}\"),
              ),
            ),
          ),
        );
      },
    );
  }
}

";
echo $string;
?>
