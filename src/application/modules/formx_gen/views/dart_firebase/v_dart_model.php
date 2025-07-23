<?php 
$type_class = array(
  'text' => 'String', 
  'img' => 'String', 
  'int' => 'int',
  'date' => 'DateTime',
  'select' => 'String',
  'latitude' => 'double',
  'longitude' => 'double',
);
$class_name = ucfirst($name);
$string = "
class $class_name {

  final String id;";
  //--------variable init-------------------
  foreach ($non_pk as $row) {
    $string.='
  final '.$type_class[$row->type].' '.$row->column_name.';';
  }
  //----------------------------------------
$string.="
  int createdAt;
  String createdBy;

  $class_name({
    this.id,";
  //--------construct-----------------------
  foreach ($non_pk as $row) {
    $string.='
    this.'.$row->column_name.',';
  }
  //----------------------------------------
  $string.="
  });

  $class_name.fromMap(Map<String,dynamic> data, String id):";
    //-----------------------------------------
    foreach ($non_pk as $row) {
      if ($row->type == 'date') {
        $string.='
    '.$row->column_name."=data['".$row->column_name."'].toDate(),";
      }else{
      $string.='
    '.$row->column_name."=data['".$row->column_name."'],";
      }
    }
    //----------------------------------------
    $string.="
    createdAt=data['createdAt'],
    createdBy=data['createdBy'],
    id=id;

  Map<String, dynamic> toMap(){
    return {";
    //-----------------------------------------
    foreach ($non_pk as $row) {
      $string.="
      '".$row->column_name."':".$row->column_name.",";
    }
    //----------------------------------------
    $string.="
      'createdAt' : createdAt,
      'createdBy' : createdBy
    };
  }

}
";
echo $string;

 ?>
