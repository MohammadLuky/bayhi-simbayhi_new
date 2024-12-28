<section class="content">
    <div class="container-fluid">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header bg-success">
                    <h3 class="card-title">Data <?= $title; ?></h3>
                </div>
                <div class="card-body">
                    <form action="" id="FormTambahPenggunaSimbayhi">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Pengguna</label>
                                    <select id="pengguna_simbayhi" name="pengguna_simbayhi" class="form-control" style="width: 100%;">
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Role</label>
                                    <select id="role_pengguna" name="role_pengguna" class="form-control select2" style="width: 100%;">
                                        <option value="">Pilih Role</option>
                                        <?php foreach ($rolePengguna as $role): ?>
                                            <option value="<?= $role['id_role']; ?>"><?= $role['nama_role']; ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <button type="button" id="TambahPengguna" class="btn btn-sm btn-primary mb-4">Tambah</button>
                    </form>
                    <div class="card">
                        <div class="card-header bg-danger">
                            <h3 class="card-title">Data <?= $title; ?></h3>
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered table-striped dataSimbayhi">
                                <thead class="text-center text-white" style="background-color: teal;">
                                    <tr>
                                        <th>No</th>
                                        <th>Nama Pengguna</th>
                                        <th>Role</th>
                                        <th>Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $no = 1;
                                    foreach ($AllPengguna as $pengguna): ?>
                                        <tr class="text-center">
                                            <td><?= $no++; ?></td>
                                            <td><?= $pengguna['nama_pengguna']; ?></td>
                                            <td><?= $pengguna['nama_role']; ?></td>
                                            <td>
                                                <a href="#" class="badge badge-info" data-toggle-tooltip="tooltip" title="Detail Data" data-toggle="modal" data-target="#detail_Pengguna<?= $pengguna['id_users']; ?>"><i class="fas fa-eye"></i></a>
                                                <a href="#" class="badge badge-danger" data-toggle-tooltip="tooltip" title="Hapus Data" data-toggle="modal" data-target="#hapus_Pengguna<?= $pengguna['id_users']; ?>"><i class="fas fa-trash-alt"></i></a>
                                            </td>
                                        </tr>
                                    <?php endforeach ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<?php foreach ($AllPengguna as $pengguna): ?>
    <div class="modal fade" id="detail_Pengguna<?= $pengguna['id_users']; ?>">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-info">
                    <h4 class="modal-title">Detail <?= $title; ?></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="exampleInputEmail1">NIY Pegawai</label>
                                <input type="text" class="form-control" value="<?= $pengguna['id_users']; ?>" readonly>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Nama Pegawai</label>
                                <input type="text" class="form-control" value="<?= $pengguna['nama_pengguna']; ?>" readonly>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Username</label>
                                <input type="text" class="form-control" value="<?= $pengguna['username']; ?>" readonly>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Password</label>
                                <input type="text" class="form-control" value="<?= $pengguna['pass_tampil']; ?>" readonly>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer justify-content-end">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Keluar</button>
                </div>
            </div>
        </div>
    </div>
<?php endforeach; ?>

<?php foreach ($AllPengguna as $pengguna): ?>
    <div class="modal fade" id="hapus_Pengguna<?= $pengguna['id_users']; ?>">
        <div class="modal-dialog modal-lg">
            <form action="<?= base_url('pengguna/hapusData/' . $pengguna['id_users']); ?>" method="POST">
                <div class="modal-content">
                    <div class="modal-header bg-danger">
                        <h4 class="modal-title">Detail <?= $title; ?></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Apakah Anda akan menghapus Data Pengguna <strong><?= $pengguna['nama_pengguna']; ?></strong> ?</p>
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