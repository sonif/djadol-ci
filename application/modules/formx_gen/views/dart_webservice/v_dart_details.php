<?php 

$class_name = ucfirst($name);

$string = "
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './".$name."_model.dart';
import 'package:antrian/utils/constants.dart';


class ".$class_name."DetailsPage extends StatelessWidget {
  final ".$class_name." item;

  const ".$class_name."DetailsPage({Key key, @required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: SingleChildScrollView(
        // padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[";
            foreach ($non_pk as $row) {
              if ($row->type == 'latitude' || $row->type == 'longitude') { continue;
              
              }else{
                $string.="
            ListTile(
              title: Text(
                  '".$row->column_name."',
                  style: TextStyle(color: Colors.deepOrange, fontSize: 12.0),
                ),
                subtitle: ";
                  if($row->type == 'int')
                    $string.="Text(item.".$row->column_name.".toString())";
                  elseif($row->type == 'date')
                    $string.="Text(DateFormat('dd MMM yyyy').format(item.".$row->column_name."))";
                  elseif($row->type == 'select')
                    $string.="Text((".$row->table_ref.".containsKey(item.".$row->column_name."))?".$row->table_ref."[item.".$row->column_name."]:'')";
                  elseif ($row->type == 'img'){ 
                    $string.="
                  (item.".$row->column_name." == null || item.".$row->column_name.".isEmpty)
                    ? Container(
                        color: Colors.grey,
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text('No data foto'),
                        ),
                      )
                    : Center(
                        child: CachedNetworkImage(
                          imageUrl: item.".$row->column_name.",
                          placeholder: (context, url) =>
                              new CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              new Icon(Icons.error),
                        ),
                      ),";
                    }
                  else
                    $string.="Text(item.".$row->column_name."),";
                  $string.="
              ),
            Divider(),";
          }
            }
            $string .="

            
          ],
        ),
      ),
    );
  }
}

";
echo $string;
?>
