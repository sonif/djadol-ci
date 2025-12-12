<?php 

$class_name = ucfirst($name);
$is_location =false;
$is_datepicker =false;
$is_image =false;

foreach ($non_pk as $row) {
  if($row->type == 'latitude') $is_location = true;
  if($row->type == 'date') $is_datepicker = true;
  if($row->type == 'img') $is_image = true;
}


$string = "
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:antrian/widget/alertx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:intl/intl.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

import 'package:dio/dio.dart';
import 'package:antrian/utils/constants.dart';
import '".$name."_model.dart';
import '".$class_name."_service.dart';

class ".$class_name."AddPage extends StatefulWidget {
  @override
  _".$class_name."AddState createState() => new _".$class_name."AddState();
}

class _".$class_name."AddState extends State<".$class_name."AddPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  ProgressDialog pr;

  ";
// ----------------------declaration--------------------------------
foreach ($non_pk as $row) {
if ($row->type == 'img'){ 
  $string.="
  File _".$row->column_name.";
  Future getImage".$row->column_name."Camera() async {
    try {
      var image = await ImagePicker.pickImage(source: ImageSource.camera,maxHeight: 450.0, 
          maxWidth: 450.0);
      setState(() {_".$row->column_name." = image;});
    } catch (e) {
      print(e);
    }
  }
  Future getImage".$row->column_name."Gallery() async {
    try {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery,maxHeight: 450.0, 
          maxWidth: 450.0);
      setState(() {_".$row->column_name." = image;});
    } catch (e) {
      print(e);
    }
  }";
}elseif($row->type == 'date'){
  $string .= '
  DateTime _'.$row->column_name.' = new DateTime.now();';
}elseif($row->type == 'select'){
  $string .= '
  String _'.$row->column_name.';';
}elseif($row->type == 'latitude' || $row->type == 'longitude'){
  $string .= '
  double _'.$row->column_name.';
  TextEditingController _'.$row->column_name.'Controller = new TextEditingController();';
}else{
  $string .= '
  TextEditingController _'.$row->column_name.'Controller = new TextEditingController();';
}
}//end foreach


// ----------------------function--------------------------------
if ($is_location){
  $string .= "
  Location _locationService  = new Location();
  bool _permission = false;
  Future getLocation() async {    
    
    await _locationService.changeSettings(accuracy: LocationAccuracy.HIGH, interval: 1000);
    
    LocationData location;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      bool serviceStatus = await _locationService.serviceEnabled();
      print('Service status: \$serviceStatus');
      if (serviceStatus) {
        _permission = await _locationService.requestPermission();
        print('Permission: \$_permission');
        if (_permission) {
          location = await _locationService.getLocation();

          _latitude = location.latitude;
          _longitude = location.longitude;
          setState(() {
            _latitudeController.text=_latitude.toString();
            _longitudeController.text=_longitude.toString();
          });
        }
      } else {
        bool serviceStatusResult = await _locationService.requestService();
        print('Service status activated after request: \$serviceStatusResult');
        if(serviceStatusResult){
          getLocation();
        }else{
          Alertx.error(context, 'please turn on gps');
        }
      }

    } catch (e) {
      print('error gps \$e');
    }
  }  
  ";
}


// ------------------------widget----------------------------------
  $string .="  

  @override
  void initState() {
    super.initState();";
    if ($is_location) {
    $string .=" 
    getLocation();";
    }
   $string .=" 
  }
  
    @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Add ".$class_name."'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[";
          // ------------------------Form widget----------------------------------
          foreach ($non_pk as $row) {
            // if ($row->type == 'latitude' || $row->type == 'longitude') continue;
            
              $string .="
              Text('$row->label_name'),
              const SizedBox(height: 5.0),";
            if ($row->type == 'foto') {
              $string .="
              ListTile(
                leading: new RawMaterialButton(
                  onPressed: getImagefotoCamera,
                  child: new Icon(
                    Icons.camera_alt,
                    color: Colors.amber,
                    //  size: 35.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(15.0),
                ),
                title: Text('".$row->info."'),
                subtitle: Text('".$row->info."'),
              ),";
            }elseif ($row->type == 'img') {
              $string .="
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                new OutlineButton(
                  child: Icon(Icons.camera_alt,color: Colors.amber,),
                  onPressed: getImage".$row->column_name."Camera,
                  padding: EdgeInsets.all(15),
                  shape: new CircleBorder(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('".$row->info."'),
                  ],
                ),
                new OutlineButton(
                  child: Icon(Icons.image,color: Colors.amber,),
                  onPressed: getImage".$row->column_name."Gallery,
                  padding: EdgeInsets.all(15),
                  shape: new CircleBorder(),
                ),
                ]
              ),
              _".$row->column_name." == null ?const SizedBox(height: 5.0) :
              new Container(
                height: 200.0,
                width: 400,
                color: Colors.grey[300],
                padding: new EdgeInsets.all(5.0),
                child: Image.file(_".$row->column_name."),
              ),
              const SizedBox(height: 15.0),
              ";
            }elseif($row->type == 'date'){
              $string .= "
              RaisedButton(
                color: Colors.white,
                child: Row(children: <Widget>[
                    Icon(Icons.date_range),
                    Text(DateFormat('dd MMM yyyy').format(_".$row->column_name.")),
                  ]
                ), 
                onPressed: ()=>{
                  DatePicker.showDatePicker(
                    context,
                    pickerTheme: DateTimePickerTheme(
                      showTitle: true,
                      confirm: Text('Done', style: TextStyle(color: Colors.cyan)),
                      cancel: Text('Cancel', style: TextStyle(color: Colors.red)),
                    ),
                    dateFormat: 'dd-MMMM-yyyy',
                    onConfirm: (dateTime, List<int> index) {
                      setState(() {
                        _".$row->column_name." = dateTime;
                      });
                    },
                  )
                },
              ),
              const SizedBox(height: 15.0),
              ";
            }elseif($row->type == 'select'){
              $string .= "
              new DropdownButton<String>(
                value: _".$row->column_name.",
                isExpanded: true,
                items: ".$row->table_ref.".entries.map((MapEntry map) {
                  return new DropdownMenuItem<String>(
                    value: map.key,
                    child: new Text(map.value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _".$row->column_name." = value;
                  });
                },
              ),
              const SizedBox(height: 15.0),
              ";
            }elseif($row->type == 'latitude'||$row->type == 'longitude'){
              $string .= "
              TextFormField(
                enabled:false,
                controller: _".$row->column_name."Controller,
                decoration: InputDecoration(
                  hintText: '".$row->info."',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15.0),
              ";
            }else{
              $string .= "
              TextFormField(
                controller: _".$row->column_name."Controller,
                decoration: InputDecoration(
                  hintText: '".$row->info."',
                  border: OutlineInputBorder(),
                ),";
                if ($row->type == 'int'){$string .="
                keyboardType: TextInputType.number,";   
                }
                if ($row->required){$string .="
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },";   
                }     
                $string .="
              ),
              const SizedBox(height: 15.0),
              ";
            }
          }

          // ------------------------Save and action----------------------------------
            $string .="
              new Container(
                width: double.infinity,
                child:RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text('Save'),
                  onPressed: () async {
                    if (_key.currentState.validate()) {";
                    if ($is_location) {
                      $string.="
                      if(_latitude == null || _longitude == null){
                        return getLocation();
                      }";
                    }
                    $string.="
                      try {
                        pr.show();
                        ";
                        // foreach ($non_pk as $row) {
                        //   if ($row->type == 'img') 
                        //     $string.="".
                        //   "var _url".$row->column_name." = ( _".$row->column_name."== null) ? '' :await ".$class_name."Service().uploadImage(_".$row->column_name.");";

                        // }
                        $string .="
                        Map<String, dynamic> data ={";
                          foreach ($non_pk as $row) {
                            if ($row->type == 'img') continue;
                              // $string.="
                            // ".$row->column_name.": _url".$row->column_name.",";
                            elseif ($row->type == 'int') 
                              $string.="
                            '".$row->column_name."': (_".$row->column_name."Controller.text.isNotEmpty) ? int.parse(_".$row->column_name."Controller.text) : 0,";
                            elseif ($row->type == 'text') 
                              $string.="
                            '".$row->column_name."': _".$row->column_name."Controller.text,";
                            else 
                              $string.="
                            '".$row->column_name."': _".$row->column_name.",";
                          }
                          $string .="
                        };";
                        // add image to form data
                        foreach ($non_pk as $row) {
                          if ($row->type == 'img')
                            $string.="
                        if(_foto !=null)
                          data['".$row->column_name."'] = await MultipartFile.fromFile(_".$row->column_name.".path);";
                        }
                        $string .="
                        await ".$class_name."Service().add(data);

                        pr.hide();
                        Navigator.pop(context);
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}

";
echo $string;
?>
