<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

function load_image($file='')
{
    if (empty($file)) {
        return "data:image/gif;base64,R0lGODlhAQABAIAAAMLCwgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==";
    }else{
        $filename = './'.$file;

        if (is_file($filename)  && file_exists($filename) ) {
            return base_url($file);
        } else {
            return base_url('assets/global/img/noimage.jpg');
        }
    }
}

function load_thumb($file='')
{
    if (empty($file)) {
        return "data:image/gif;base64,R0lGODlhAQABAIAAAMLCwgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==";
    }else{
        $file = get_thumb($file);

        $filename = './'.$file;

        if (is_file($filename)  && file_exists($filename) ) {
            return base_url($file);
        } else {
            return base_url('assets/global/img/noimage.jpg');
        }
    }
}

function get_thumb($file='')
{
    $extension_pos = strrpos($file, '.'); // find position of the last dot, so where the extension starts
    $file = substr($file, 0, $extension_pos) . '_thumb' . substr($file, $extension_pos);
    return $file;
}

function delete_image($file)
{
    //delete main file
    if (is_file($file)  && file_exists($file) ) {
        unlink($file);
    }
    //delete thumb file
    $extension_pos = strrpos($file, '.'); // find position of the last dot, so where the extension starts
    $file = substr($file, 0, $extension_pos) . '_thumb' . substr($file, $extension_pos);
    if (is_file($file)  && file_exists($file) ) {
        unlink($file);
    }
}

function terbilang($x){
  $abil = array("", "Satu", "Dua", "Tiga", "Empat", "Lima", "Enam", "Tujuh", "Delapan", "Sembilan", "Sepuluh", "Sebelas");
  if ($x < 12)
    return " " . $abil[$x];
  elseif ($x < 20)
    return Terbilang($x - 10) . " Belas";
  elseif ($x < 100)
    return Terbilang($x / 10) . " Puluh" . Terbilang($x % 10);
  elseif ($x < 200)
    return " Seratus" . Terbilang($x - 100);
  elseif ($x < 1000)
    return Terbilang($x / 100) . " Ratus" . Terbilang($x % 100);
  elseif ($x < 2000)
    return " Seribu" . Terbilang($x - 1000);
  elseif ($x < 1000000)
    return Terbilang($x / 1000) . " Ribu" . Terbilang($x % 1000);
  elseif ($x < 1000000000)
    return Terbilang($x / 1000000) . " Juta" . Terbilang($x % 1000000);
    elseif ($x < 1000000000000)
    return Terbilang($x / 1000000000) . " Milyar" . Terbilang($x % 1000000000);
}

function convert_numeric($value='')
{
    $value = str_replace('.', '', $value);
    $value = str_replace(',', '.', $value);
    return $value;
}

function to_numeric($value='')
{
    $new = number_format($value, 0 , ",", ".");
    return $new;
}

function tgl_indo($tanggal){
    $bulan = array (
        1 =>   'Januari',
        'Februari',
        'Maret',
        'April',
        'Mei',
        'Juni',
        'Juli',
        'Agustus',
        'September',
        'Oktober',
        'November',
        'Desember'
    );
    $pecahkan = explode('-', $tanggal);
    
    // variabel pecahkan 0 = tanggal
    // variabel pecahkan 1 = bulan
    // variabel pecahkan 2 = tahun
 
    return $pecahkan[2] . ' ' . $bulan[ (int)$pecahkan[1] ] . ' ' . $pecahkan[0];
}

function date_to_indonesia($value)
{
    return date_reverse($value);
}

function date_from_indonesia($value)
{
    return date_reverse($value);
}

function date_reverse($tanggal){
    if (empty($tanggal)) {
        return NULL;
    }
    $pecahkan = explode('-', $tanggal);
    
    // variabel pecahkan 0 = tanggal
    // variabel pecahkan 1 = bulan
    // variabel pecahkan 2 = tahun
 
    return $pecahkan[2] . '-' . $pecahkan[1] . '-' . $pecahkan[0];
}


function convert_arr_primary_key($object,$column_id)
{
    $res= [];
    foreach ($object as $r) {
        $res[$r->{$column_id}]=$r;
    }
    return $res;
}

function getDistanceBetweenPoints($lat1, $lon1, $lat2, $lon2, $unit = 'K')
{
    $theta = $lon1 - $lon2;
    $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +
            cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
    $dist = acos($dist);
    $dist = rad2deg($dist);
    $miles = $dist * 60 * 1.1515;

    switch (strtoupper($unit)) {
        case 'K':
            return $miles * 1.609344; // Kilometers
        case 'N':
            return $miles * 0.8684;   // Nautical miles
        default:
            return $miles;            // Miles
    }
}
