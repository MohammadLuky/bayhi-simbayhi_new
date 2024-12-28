<section class="content">
    <div class="container-fluid">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header bg-success">
                    <h3 class="card-title">Data <?= $title; ?></h3>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-striped dataSimbayhi">
                        <thead class="text-center text-white" style="background-color: teal;">
                            <tr>
                                <th>Kode</th>
                                <th>Nama Akun Induk</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            foreach ($AkunInduk as $ai): ?>
                                <tr class="text-center">
                                    <td><?= $ai['id_akun_induk']; ?></td>
                                    <td><?= $ai['nama_akun']; ?></td>
                                    <td>
                                        <a href="<?= base_url('akun/DetailAkun/' . $ai['id_akun_induk']); ?>" class="badge badge-success" data-toggle-tooltip="tooltip" title="Detail Data"><i class="fas fa-plus"></i></a>
                                    </td>
                                </tr>
                            <?php endforeach ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>