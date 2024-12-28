<section class="content">
    <div class="container-fluid">
        <div class="col-lg-12">

            <div id="DataPerSubAkun">

                <div class="card">
                    <div class="card-header bg-success">
                        <h3 class="card-title">Data Sub Akun Nomor 1</h3>
                    </div>
                    <div class="card-body">

                        <table class="table table-bordered table-striped dataSimbayhi">
                            <thead>
                                <tr>
                                    <th style="width: 20%;">Kode Sub Akun</th>
                                    <th style="width: 50%;">Nama Sub Akun</th>
                                    <th style="width: 15%;">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>

                    </div>
                </div>

            </div>

        </div>
    </div>
</section>

<!-- <?php foreach ($DataSubAkun as $subakun): ?>
    <div class="modal fade" id="hapus_DataSubAkun<?= $subakun['id_subakun_induk']; ?>">
        <div class="modal-dialog modal-lg">
            <form action="<?= base_url('akun/hapusData/' . $GetAkunInduk['id_akun_induk'] . '/' . $subakun['id_subakun_induk']); ?>" method="POST">
                <div class="modal-content">
                    <div class="modal-header bg-danger">
                        <h4 class="modal-title">Detail <?= $title; ?></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Apakah Anda akan menghapus Data Sub Akun <strong><?= $subakun['kode_subakun']; ?></strong> <strong><?= $subakun['nama_subakun']; ?></strong> ?</p>
                    </div>
                    <div class="modal-footer justify-content-end">
                        <button type="submit" class="btn btn-success">Ya. Hapus!</button>
                        <button type="button" class="btn btn-info" data-dismiss="modal">Keluar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
<?php endforeach; ?> -->