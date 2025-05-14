<?php 

$tile_title="";
$tile_description="";
foreach ($dt as $key => $value) {
  if($key == 0 ) $tile_title = $value->column_name;
  if($key == 1 ) $tile_description = $value->column_name;
}

$class_name = ucfirst($name);

$string = "
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:antrian/ui/itemList.dart';

import '".$name."_add.dart';
import '".$name."_edit.dart';
import '".$name."_details.dart';
import '".$name."_service.dart';
import '".$name."_model.dart';


class ".$class_name."MainPage extends StatefulWidget {
  @override
  _".$class_name."State createState() => new _".$class_name."State();
}

class _".$class_name."State extends State<".$class_name."MainPage> {
String uid;
  final TextEditingController _filter = new TextEditingController();
  String _searchText = '';
  List names = new List(); // names we get from API
  List filteredNames = new List(); // names filtered by search text
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('".$class_name."');

  @override
  void initState() {
    super.initState();
    getUid();
  }

  Future getUid() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();   
    setState(() {uid = user.uid;});
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          style: new TextStyle(color: Colors.white),
          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.search, color: Colors.white),
            hintText: 'Type here...',
            hintStyle: TextStyle(color: Colors.white),
          ),
          onSubmitted: (value) => {print(value)},
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Note');
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _appBarTitle,
        actions: <Widget>[
          IconButton(
            icon: _searchIcon,
            onPressed: _searchPressed,
          )
        ],
      ),
      body: StreamBuilder(
        stream: ".$class_name."Service().getListOwner(uid),
        builder: (BuildContext context, AsyncSnapshot<List<".$class_name.">> snapshot) {
          if (snapshot.hasError || !snapshot.hasData || uid.isEmpty)
            return LinearProgressIndicator();
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              ".$class_name." item = snapshot.data[index];
              return ListTile(
                title: Text(item.".$tile_title."),";
                if($tile_description != "")
                $string.="
                subtitle: Text(item.".$tile_description."),";
                $string.="
                trailing: IconButton(
                  color: Colors.red,
                  icon: Icon(Icons.edit),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ".$class_name."EditPage(
                        item: item,
                      ),
                    ),
                  ),
                  //{_delete(context, item.id)}
                  
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ".$class_name."DetailsPage(
                      item: item,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => ".$class_name."AddPage()));
        },
      ),
    );
  }

  void _delete(BuildContext context, String id) async {
    if (await _showConfirmationDialog(context)) {
      try {
        await ".$class_name."Service().delete(id);
      } catch (e) {
        print(e);
      }
    }
  }

  Future<bool> _showConfirmationDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
              content: Text('Are you sure you want to delete ?'),
              actions: <Widget>[
                FlatButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text('Delete'),
                  onPressed: () => Navigator.pop(context, true),
                ),
                FlatButton(
                  child: Text('No'),
                  onPressed: () => Navigator.pop(context, false),
                ),
              ],
            ));
  }
}
";
echo $string;
?>
