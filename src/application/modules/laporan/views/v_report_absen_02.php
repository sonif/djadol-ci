<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Data Rekap Absensi</title>
<?php
    include 'config/koneksi_li.php';    
    include 'config/all_function.php';    
    
	$cb_tahun = (!empty($_GET['tahun']))? $_GET['tahun'] : date("Y");
	$cb_bulan = @$_GET['bulan'];
	$cb_company = (!empty($_GET['company']))? $_GET['company'] : "all";
	
	$tanggal_surat = "Dicetak pada ".tanggal_indo(date('Y-m-d'));
	$bulan_surat = date('m');
	$tahun_surat = date('Y');
	
?>
<style type="text/css" media="screen,print">
	*{
		margin:0;
		padding:0;
	}
	body{
		background-color:black;
		color:white;
		font:normal 8pt/100% Arial,tahoma,sans-serif;
	}
	div.page{
		background-color:white;
		color:black;
		/*min-height:10cm;*/
		margin:0.5cm auto;
		padding: 0.5cm 1cm 1cm 1cm;
		width:22.5cm;		
	}
	div.header{
		background-color:white;
		border-bottom:3px solid black;
		padding-bottom:.3cm;
		text-align:center;
		color:black;
	}
	div.title{
		text-align:center;
		font-size:13pt;
		font-weight:bold;
		line-height:120%;
		padding-top:0.2cm;
	}
	div.header div.h1{
		font-size:18pt;
		font-family:arial;
		font-weight:bold;
		line-height:18pt;	
	}
	div.header div.h2{
		font-size:16pt;	
		font-family:arial;
		font-weight:bold;
		line-height:16pt;	
	}
	div.header div.h3{
		font-family:arial;
		font-size:12pt;	
		line-height:12pt;	
	}
	div.ttd{
		text-align:left;
		font-size:14px;
		font-family:arial;
		font-weight:bold;
		padding-left:14cm;
		line-height:14pt;
	/*	padding-top:1cm; */
	}
	div.content{
		font-family:arial;
		margin-top:.4cm;
		font-size:12px;
		line-height:12pt;	
	}
	div.content p{
		margin-top:.3cm;
	}

	table.data{	
		border-collapse:collapse;
		width:100%;
	}
	table.data th{
		padding:3px;
		border:1px solid black;
		font-size:small;
	}
	table.data td{
		padding:2px 2px 2px 3px;
	}
	span.pilihan{
		border-bottom:1px dotted black;
	}

	footer {
		page-break-after: always;
	}
	
	.vred{
	    background-color : #EA3C53;
	}

</style>

</head>
<?php error_reporting(1); ?>
<body>
	<div class="page">
	<?php
	    if($cb_company == 'all'):
    		$query = "SELECT * FROM s_user
    			WHERE USER_ACTIVE LIKE '%y%' 
    			ORDER BY USER_COMPANY_ID
    			";
		else:
		    $query = "SELECT * FROM s_user
    			WHERE USER_ACTIVE LIKE '%y%' AND USER_COMPANY_ID='".$cb_company."' 
    			ORDER BY USER_COMPANY_ID
    			";
	    endif;
	    //echo $query;
		
		$sql_j = mysqli_query($conn_db,$query);        
		$count_page = 1;
		
		$count_person = 0;
		while($r = mysqli_fetch_array($sql_j)):
		    $cursor_user_id = $r['USER_ID'];
	?>
		
		<div class="content">
			<div style="float:right"><?php echo $tanggal_surat;?></div>
			<div style="clear:both;"></div>
			<br/>
			<br/>
			<div>
				<table class="data" border="1" cellspacing="0" cellpadding="0">
				    <tr>
				        <th colspan="7">
				            <center>
                			<h3>Daftar Absen Bulan <?php echo bulan_indo($cb_bulan)." ".$cb_tahun; ?></h3>
                			<h3><?php echo $r['USER_FULLNAME'];?></h3>
                			</center>
			            </th>
				    </tr>
				    <tr>
				        <th>Senin
			            </th>
			            <th>Selasa
			            </th>
			            <th>Rabu
			            </th>
			            <th>Kamis
			            </th>
			            <th>Jumat
			            </th>
			            <th>Sabtu
			            </th>
			            <th>Minggu
			            </th>
				    </tr>
				    <?php
				        $q_date = "SELECT DISTINCT(date_field)
                                    ,IFNULL(`t_absen_datang`.absen_date_time,0) as datang
                                    ,IFNULL(`t_absen_pulang`.absen_date_time,0) as pulang
                                    ,IFNULL(`t_absen_datang`.absen_date,0)
                                    ,`t_absen_datang`.absen_user_id as uid_datang
                                    ,`t_absen_datang`.absen_status as status_datang
                                    ,`t_absen_pulang`.absen_user_id as uid_pulang
                                    ,`t_absen_pulang`.absen_status as status_pulang
                                    FROM 
                                    (SELECT date_field
                                        FROM
                                        (
                                            SELECT
                                                MAKEDATE(".$cb_tahun.",1) +
                                                INTERVAL ('".$cb_bulan."'-1) MONTH +
                                                INTERVAL daynum DAY date_field
                                            FROM
                                            (
                                                SELECT t*10+u daynum
                                                FROM
                                                    (SELECT 0 t UNION SELECT 1 UNION SELECT 2 UNION SELECT 3) A,
                                                    (SELECT 0 u UNION SELECT 1 UNION SELECT 2 UNION SELECT 3
                                                    UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7
                                                    UNION SELECT 8 UNION SELECT 9) B
                                                ORDER BY daynum
                                            ) AA
                                        ) AAA
                                        WHERE MONTH(date_field) = '".$cb_bulan."') AS tbday
                                     LEFT JOIN 
                                        (SELECT absen_date_time,absen_date,absen_user_id,absen_status FROM t_absen WHERE absen_user_id = '".$cursor_user_id."') as t_absen_datang 
                                        ON tbday.date_field = t_absen_datang.absen_date 
                                     LEFT JOIN 
                                        (SELECT absen_date_time,absen_date,absen_user_id,absen_status FROM t_absen_out WHERE absen_user_id = '".$cursor_user_id."') as t_absen_pulang 
                                        ON tbday.date_field = t_absen_pulang.absen_date 
                                     GROUP BY date_field";
                        //echo $q_date;
                        $sql_date = mysqli_query($conn_db,$q_date);
                        
                        $dayOfWeek = date("w", strtotime($cb_tahun."-".$cb_bulan."-01"));
                        echo "<tr>";
                        for($c=1;$c<$dayOfWeek;$c++):
                            echo "<td>&nbsp;</td>";
                        endfor;
                        
                        while($rdate = mysqli_fetch_array($sql_date)):
                            $count_td = date("w", strtotime($rdate['date_field'])); // hitung angka hari
                            $dayOfWeek2 = date("l", strtotime($rdate['date_field'])); // tampilkan nama hari
                            
                            if($count_td % 7 == 1):
                                echo "<tr>";
                            endif;
                            
                            $jam_dtg = explode(" ",$rdate['datang']);
                            $jam_plg = explode(" ",$rdate['pulang']);
                            
                            $mystring = $rdate['status_datang'];
                            $findme   = '##';
                            $pos = strpos($mystring, $findme);
                            
                            if($pos == false){
                                $report_in = $jam_dtg[1];
                            }else{
                                $report_in = explode("##",$mystring);
                                $report_in = $report_in[0];
                            }
                            
                            $mystring = $rdate['status_pulang'];
                            $findme   = '##';
                            $pos = strpos($mystring, $findme);
                            
                            if($pos == false){
                                $report_out = $jam_plg[1];
                            }else{
                                $report_out = explode("##",$mystring);
                                $report_out = $report_out[0];
                            }
                            
                            if(($count_td==6) || ($count_td==0)){ 
                                $vred="vred"; 
                            }else{ $vred=""; }
				    ?>
				        <td class="<?php echo $vred;?>">
				            <?php echo $rdate['date_field'];?><br/>
    				        <b>IN : </b><?php echo $report_in; ?><br/>
    				        <b>OUT : </b><?php echo $report_out; ?><br/>
				        </td>
				    <?php
				            if($count_td % 7 == 0):
                                echo "</tr>";
                            endif;
				        endwhile; //loop date
				    ?>
				</table>
			</div>
		</div>
		<br/>
		<br/>
		
		<?php
			$count_person++;
		        if($count_person%3==0):
		?>
		<div style="float:right;">
			page-
			<?php
				echo $count_page;
			?>
		</div>
		<div style="clear:both;"></div>
		<?php
		            echo "<footer></footer>";
		            $count_page++;
		        endif;
			endwhile;  //loop user
		?>
		
	</div>
	
	
</body>
</html>