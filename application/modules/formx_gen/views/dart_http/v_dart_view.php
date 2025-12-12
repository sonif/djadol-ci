<?php 

$class_name = ucfirst($name);

$string = "
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './".$name."_main.dart';
import './".$name."_edit.dart';

class ".$class_name."View extends StatefulWidget {
  List list;
  int index;
  ".$class_name."View({this.index,this.list});
  @override
  _".$class_name."ViewState createState() => new _".$class_name."ViewState();
}

class _".$class_name."ViewState extends State<".$class_name."View> {

void deleteData(){
  var idDelete =widget.list[widget.index]['".$pk."'];
  var url=\"http://10.0.2.2/adi/zing-crawler/web/index.php/formx/formx/delete/$form_id/\"+idDelete;
  http.post(url, body: {
    'id': widget.list[widget.index]['".$pk."']
  });
}

void confirm (){
  AlertDialog alertDialog = new AlertDialog(
    content: new Text(\"Are You sure want to delete '\${widget.list[widget.index]['".$label."']}'\"),
    actions: <Widget>[
      new RaisedButton(
        child: new Text(\"OK DELETE!\",),
        textColor: Colors.white,
        color: Colors.red,
        onPressed: (){
          deleteData();
          Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (BuildContext context)=> new ".$class_name."(),
            )
          );
        },
      ),
      new RaisedButton(
        child: new Text(\"CANCEL\",),
        textColor: Colors.white,
        color: Colors.green,
        onPressed: ()=> Navigator.pop(context),
      ),
    ],
  );

  showDialog(context: context, child: alertDialog);
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(\"\${widget.list[widget.index]['".$label."']}\")),
      body: new Container(
        height: 270.0, 
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[

                new Padding(padding: const EdgeInsets.only(top: 30.0),),";
        foreach ($non_pk as $row) {
          $string .= "     
                new Text(widget.list[widget.index]['".$row->column_name."'], style: new TextStyle(fontSize: 20.0),),
                ";
        }

      $string .="new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text(\"EDIT\"),
                      textColor: Colors.white,
                      color: Colors.green,
                      onPressed: ()=>Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context)=>new ".$class_name."Edit(list: widget.list, index: widget.index,),
                        )
                      ),
                    ),
                    new RaisedButton(
                      child: new Text(\"DELETE\"),
                      textColor: Colors.white,
                      color: Colors.red,
                      onPressed: ()=>confirm(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

";
echo $string;
?>
