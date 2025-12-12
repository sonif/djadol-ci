<table class="table table-striped table-hover table-bordered" id="tb_by_dusun"
    width="100%" cellspacing="0" role="grid" aria-describedby="example_info" style="width: 100%;">
<thead class="thead-dark">                            
    <tr role="row" class="heading">
        <th width="30">No.</th>
        <th width="100" align="center">Dusun</th>
        <?php
            foreach($month as $r){
                echo '<th width="30">'.$r.'</th>';
            }
        ?>      
    </tr>
</thead>
<tbody>
    <?php
        $i=0;
        foreach($dusun as $r1):
            $i++;
    ?>
        <tr>
            <td><?php echo $i; ?></td>
            <td><?php echo $r1->dusun_name;?></td>
            <?php
                foreach($month as $m => $val){
                    $q = "SELECT sum(transaksi_total) as sum_transaksi_total FROM v_input_tagihan WHERE transaksi_year_issue='".$year."'"
                        ." AND transaksi_status='tagihan'"
                        ." AND transaksi_month_issue='".$m."'"
                        ." AND dusun_name='".$r1->dusun_name."'";
                    $sql = $this->db->query($q);
                    $row = $sql->row();
                    echo '<td><button data-url="'.site_url('laporan/laporan/list_tagihan_by_dusun/'.$year.'/'.$r1->dusun_id.'/'.$m)
                    .'"  class="btn btn-sm btn-default openmodal"><i class="fa fa-database"></i></button> '.number_format($row->sum_transaksi_total).'</td>';
                }
            ?>  
        </tr>
    <?php
        endforeach;
    ?>
</tbody>
</table>
<style>
    .total_dusun:hover{
        cursor : pointer;
        text-decoration : underline;
    }
</style>