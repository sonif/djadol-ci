<?php 

$class_name = ucfirst($name);

$string = "
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ".$class_name."Add extends StatefulWidget {
  @override
  _".$class_name."AddState createState() => new _".$class_name."AddState();
}

class _".$class_name."AddState extends State<".$class_name."Add> {

  ";
  foreach ($non_pk as $row) {
  $string .= '
  TextEditingController controller'.$row->column_name.' = new TextEditingController();';
  }
  $string .="

  void addData() async {
    var url=\"http://10.0.2.2/adi/zing-crawler/web/index.php/formx/formx/form_action\";
    final response = http.post(url,body: {
      \"form_id\" : '$form_id',";
      foreach ($non_pk as $row) {
      $string .= '
      "'.$row->column_name.'": controller'.$row->column_name.'.text,';
      }
      $string .="
    });
    // print(response.body);

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(\"TAMBAH DATA\"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                ";
                foreach ($non_pk as $row) {
                $string .= "
                new TextField(
                  controller: controller".$row->column_name.",
                  decoration: new InputDecoration(
                      hintText: \"".$row->label_name."\", labelText: \"".$row->label_name."\"),";
                  if ($row->type == 'int'){$string .="
                  keyboardType: TextInputType.number,";   
                  }    
                  $string .="
                ),";
                }
                $string .="
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text(\"TAMBAH DATA\"),
                  textColor: Colors.white,
                  color: Colors.blueAccent,
                  onPressed: () {
                    addData();
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

";
echo $string;
?>
