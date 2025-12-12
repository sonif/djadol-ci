<?php 

$class_name = ucfirst($name);

$string = "
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './".$name."_main.dart';

class ".$class_name."Edit extends StatefulWidget {
  final List list;
  final int index;

  ".$class_name."Edit({this.list, this.index});

  @override
  _".$class_name."EditState createState() => new _".$class_name."EditState();
}

class _".$class_name."EditState extends State<".$class_name."Edit> {

  ";
  foreach ($non_pk as $row) {
  $string .= '
  TextEditingController controller'.$row->column_name.';';
  }
  $string .="

  void editData() async {
    var url=\"http://10.0.2.2/adi/zing-crawler/web/index.php/formx/formx/form_action\";
    final response = http.post(url,body: {
      \"form_id\" : '$form_id',
      \"id\": widget.list[widget.index]['".$pk."'],";
      foreach ($non_pk as $row) {
      $string .= '
      "'.$row->column_name.'": controller'.$row->column_name.'.text,';
      }
      $string .="
    });
    // print(response.body);

  }


  @override
    void initState() {
      ";
      foreach ($non_pk as $row) {
      $string .= "
      controller".$row->column_name." = new TextEditingController(text: widget.list[widget.index]['$row->column_name'] );";
      }
      $string .="
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(\"EDIT DATA\"),
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
                  child: new Text(\"EDIT DATA\"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context)=>new ".$class_name."()
                      )
                    );
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
