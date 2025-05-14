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
import 'package:antrian/ui/itemList.dart';
import 'package:loadmore/loadmore.dart';



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

  List<".$class_name."> _dataList = List<".$class_name.">();
  int currentLength = 0;
  int page = 0;
  bool isFinish = false;

  @override
  void initState() {
    super.initState();
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

  Future<bool>  _loadMore() async {
    bool success = false;
    List<".$class_name."> newDataList = await ".$class_name."Service().getAll(page);
    if(newDataList.length > 0){
      page += 1;
      success = true;
      setState(() => {
        _dataList.addAll( newDataList)
      });
    }else{
      setState(() {isFinish =true;});
    }
    return success;
  }

  void refresh() {
    page = 0;
    _dataList = List<".$class_name.">();
    _loadMore();
  }

  ListTile _buildItemsForListView(BuildContext context, int index) {
    return ListTile(
      title: Text(_dataList[index].".$tile_title.") , 
      subtitle: Text(_dataList[index].".$tile_description.", style: TextStyle(fontSize: 18)),
      trailing: IconButton(
        icon: Icon(Icons.edit),
        onPressed: () => {Navigator.push(context,MaterialPageRoute(builder: (_) =>    
                  ".$class_name."EditPage(item: _dataList[index]))).whenComplete(refresh)}
        ),
      onTap: () => Navigator.push(context,MaterialPageRoute(
                    builder: (_) => ".$class_name."DetailsPage(
                      item: _dataList[index],
                    ))),
    );
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
      body: LoadMore(
          isFinish: isFinish,
          onLoadMore: _loadMore,
          textBuilder: DefaultLoadMoreTextBuilder.english,
          child:ListView.builder(
            itemCount: _dataList.length,
            itemBuilder: _buildItemsForListView,
          ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(
                    builder: (_) => ".$class_name."AddPage())).whenComplete(refresh);
        },
      ),
    );
  }

  
}
";
echo $string;


$temp = "void _delete(BuildContext context, String id) async {
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
  }";
?>
