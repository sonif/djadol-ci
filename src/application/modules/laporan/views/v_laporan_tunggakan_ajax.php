<div class="row">
    <div class="col-md-12">
        <button class="btn btn-default btn-sm" id="btn_print_report"><i class="fa fa-print"></i> Print</button>
    </div>
</div>

<div id="divprint">
    <style>
        table .table-report {
            border-collapse: collapse;
        }
        td th .table-report {
            padding: 5px;
        }
        .trow{
            -webkit-print-color-adjust: exact;
            background-color: #ffd200;
        }
        table thead{
            background-color: #39e1e5;
            -webkit-print-color-adjust: exact;
        }
    </style>

    <center>
        <?php
            $tt = "Laporan Presensi";
            if(!empty($rtitle)){
                $tt = $rtitle;
            }
        ?>
        <h2><?php echo $tt; ?></h2>
        <div>
            <?php echo "(Bulan : ".$input_month.", Tahun ".$input_year.")"; ?><br/>
            Nama User : 
        </div>
    </center>

    <table align="center" class="table-report" border="1" width="98%" cellspacing="0" cellpadding="2px" style="width: 98%;">
        <thead>                            
            <tr>
                <th rowspan="2" align="center">Tanggal</th>
                <th colspan="2">Absen</th>
                <th rowspan="2">Keterangan</th>
            </tr>
            <tr>
                <th>Datang</th>
                <th>Pulang</th>
            </tr>
        </thead>
    <tbody>
        <?php
            $i=0;
            $tstyle = " ";
            // var_dump($v_report->result());
            foreach($v_report->result() as $r):
                $i++;
                if($i % 2 == 0):
                    $tstyle = " class='trow' ";
                else:
                    $tstyle = "";
                endif;

                $jam_dtg = explode(" ",$r->datang);
                $jam_plg = explode(" ",$r->pulang);
                
                $mystring = $r->status_datang;
                $findme   = '##';
                $pos = strpos($mystring, $findme);
                
                $keterangan = "";
                if($pos == false){
                    $report_in = (isset($jam_dtg[1])) ? $jam_dtg[1] : "";
                }else{
                    $report_in = explode("##",$mystring);
                    $keterangan = $report_in[1];
                    $report_in = $report_in[0];    
                }
                
                $mystring = $r->status_pulang;
                $findme   = '##';
                $pos = strpos($mystring, $findme);
                
                if($pos == false){
                    $report_out = (isset($jam_plg[1])) ? $jam_plg[1] : "";
                }else{
                    $report_out = explode("##",$mystring);
                    $keterangan .= " | ".$report_out[1];
                    $report_out = $report_out[0];
                }
        ?>
        
            <tr <?php echo $tstyle; ?>>
                <td align="center"><?php echo $r->date_field;?></td>
                <td><?php echo $report_in;?> </td>
                <td><?php echo $report_out;?> </td>
                <td><?php echo $keterangan;?></td>
            </tr>
            
        <?php
            endforeach;
        ?>
    </tbody>
    </table>
</div>

<script>    

    $("#btn_print_report").on('click',function(e){
        $('#divprint').printThis({
            loadCSS : "<?php echo base_url('assets/css/table_print2.css')?>",
        });
    });
    
</script>
