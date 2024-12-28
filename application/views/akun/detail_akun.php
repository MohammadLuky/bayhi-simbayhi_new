<section class="content">
    <div class="container-fluid">
        <div class="col-lg-12">
            <div class="row">
                <!-- <div class="col-md-6">
                    <div class="card card-widget widget-user-2">
                        <div class="widget-user-header bg-warning">
                            <div class="widget-user-image">
                                <img class="img-circle elevation-2" src="<?= base_url('assets/'); ?>database.jpg" alt="User Avatar">
                            </div>
                            <h3 class="widget-user-username">Data <?= $title; ?></h3>
                            <h5 class="widget-user-desc">Akun <?= $GetAkunInduk['nama_akun']; ?></h5>
                        </div>
                        <div class="card-footer p-0">
                            <ul class="nav flex-column">
                                <?php foreach ($NomorSubAkun as $sub): ?>
                                    <li class="nav-item">
                                        <a href="#" class="nav-link list-nomorsubakun" data-id="<?= $sub['id_nomor_subakun']; ?>" data-idakuninduk="<?= $GetAkunInduk['id_akun_induk']; ?>">
                                            Sub Akun <?= $GetAkunInduk['nama_akun']; ?> <?= $sub['id_nomor_subakun']; ?> <span class="float-right badge bg-primary">Jumlah Sub Akun</span>
                                        </a>
                                    </li>
                                <?php endforeach; ?>
                            </ul>
                        </div>
                    </div>
                </div> -->

                <div class="col-md-12">
                    <div id="FormSubAkun">
                        <div class="card">
                            <div class="card-header bg-info">
                                <h3 class="card-title">Form Sub Akun 1</h3>
                            </div>
                            <div class="card-body">
                                <form action="<?= base_url('akun/DetailAkun/' . $GetAkunInduk['id_akun_induk']); ?>" method="post">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Pilih Sub Akun Induk</label>
                                                <select class="form-control select2 <?= (form_error('PilihSubAkunInduk') != '') ? 'is-invalid' : ''; ?>" id="PilihSubAkunInduk" name="PilihSubAkunInduk" style="width: 100%;">
                                                    <option value="">Pilih SubInduk</option>
                                                    <?php foreach ($SubJadiInduk as $SJI): ?>
                                                        <option value="<?= $SJI['id_subakun_induk']; ?>" data-id="<?= $SJI['kode_subakun']; ?>" data-nomorsubakun="<?= $SJI['nomor_subakun_id']; ?>"><?= $SJI['kode_subakun']; ?> - <?= $SJI['nama_subakun']; ?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </div>
                                            <div class="invalid-feedback"><?= form_error('PilihSubAkunInduk'); ?></div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="">Kode Sub Akun Induk</label>
                                                <input name="kode_subakun_tampil" id="kode_subakun_tampil" type="text" class="form-control" readonly>
                                                <input name="nomor_subakun" id="nomor_subakun" type="hidden" class="form-control" readonly>
                                            </div>
                                        </div>
                                        <div class="col-md-10">
                                            <div class="form-group">
                                                <label for="">Kode Akun</label>
                                                <input name="kode_subakun" id="kode_subakun" type="text" class="form-control <?= (form_error('kode_subakun') != '') ? 'is-invalid' : ''; ?>" autocomplete="off" placeholder="Isikan Kode Akun">
                                                <input name="id_subakun_induk" id="id_subakun_induk" type="hidden" class="form-control" readonly>
                                            </div>
                                            <div class="invalid-feedback"><?= form_error('kode_subakun'); ?></div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="">Nama Akun</label>
                                                <input type="text" name="nama_subakun" id="nama_subakun" class="form-control <?= (form_error('nama_subakun') != '') ? 'is-invalid' : ''; ?>" autocomplete="off" placeholder="Isikan Nama Akun">
                                                <div class="form-check mb-4">
                                                    <input type="checkbox" class="form-check-input" value="1" name="Validasi_SubAkunJadiInduk" id="Validasi_SubAkunJadiInduk">
                                                    <label class="form-check-label">Apakah Menjadi Sub Akun Induk ?</label>
                                                </div>
                                            </div>
                                            <div class="invalid-feedback"><?= form_error('nama_subakun'); ?></div>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-sm btn-success">Simpan</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="DataPerSubAkun">

                <div class="card">
                    <div class="card-header bg-success">
                        <h3 class="card-title">Data Sub Akun Nomor 1</h3>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered table-striped dataSimbayhi">
                            <!-- <thead class="text-center text-white" style="background-color: teal;">
                                <tr>
                                    <th style="width: 5%;">No.</th>
                                    <th style="width: 20%;">Kode Sub Akun</th>
                                    <th style="width: 50%;">Nama Sub Akun</th>
                                    <th style="width: 15%;">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $no = 1;
                                foreach ($DataSubAkun as $row): ?>

                                    <tr>
                                        <td class="text-center"><?= $no++ ?></td>
                                        <td><?= $row['kode_subakun'] ?></td>
                                        <td class="text-center"><?= $row['nama_subakun'] ?></td>
                                        <td class="text-center">
                                            <a href="#" class="badge badge-danger" data-toggle-tooltip="tooltip" title="Hapus Data" data-toggle="modal" data-target="#hapus_DataSubAkun<?= $row['id_subakun_induk'] ?>"><i class="fas fa-trash-alt"></i>
                                            </a>
                                        </td>
                                    </tr>

                                <?php endforeach; ?>
                            </tbody> -->
                            <thead>
                                <tr>
                                    <th style="width: 20%;">Kode Sub Akun</th>
                                    <th style="width: 50%;">Nama Sub Akun</th>
                                    <th style="width: 15%;">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php function render_hierarki($items)
                                { ?>
                                    <?php
                                    foreach ($items as $item) { ?>
                                        <tr>
                                            <td><?= $item['kode_subakun']; ?></td>
                                            <td><?= $item['nama_subakun']; ?></td>
                                            <td class="text-center">
                                                <a href="#" class="badge badge-danger" data-toggle-tooltip="tooltip" title="Hapus Data" data-toggle="modal" data-target="#hapus_DataSubAkun<?= $item['id_subakun_induk'] ?>"><i class="fas fa-trash-alt"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <?php if (!empty($item['children'])) { ?>
                                            <?php render_hierarki($item['children']); ?>
                                        <?php } ?>
                                    <?php } ?>
                                <?php } ?>
                                <?php render_hierarki($hierarki); ?>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>

        </div>
    </div>
</section>

<?php foreach ($DataSubAkun as $subakun): ?>
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
<?php endforeach; ?>