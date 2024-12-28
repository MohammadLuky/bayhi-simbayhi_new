<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-success elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
        <img src="<?= base_url('assets/theme/'); ?>dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">SIMBAYHI NEW</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="<?= base_url('assets/theme/'); ?>dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block">Alexander Pierce</a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- <li class="nav-item">
                    <a href="" class="nav-link">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Dashboard
                        </p>
                    </a>
                </li> -->
                <li class="nav-item">
                    <a href="<?= base_url('dashboard'); ?>" class="nav-link <?= current_url() == base_url('dashboard') ? "active" : '' ?>">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Dashboard
                        </p>
                    </a>
                </li>
                <li class="nav-header">Menu Admin</li>
                <li class="nav-item <?= current_url() == base_url('pengguna') || current_url() == base_url('akun') || current_url() == base_url('tahun_anggaran') || current_url() == base_url('santri') || current_url() == base_url('unit') ? "menu-open" : '' ?>">
                    <a href="#" class="nav-link <?= current_url() == base_url('pengguna') || current_url() == base_url('akun')  || current_url() == base_url('tahun_anggaran') || current_url() == base_url('santri') || current_url() == base_url('unit') ? "active" : '' ?>">
                        <i class="nav-icon fas fa-server"></i>
                        <p>
                            Data Master
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="<?= base_url('pengguna'); ?>" class="nav-link <?= current_url() == base_url('pengguna') ? "active" : '' ?>">
                                <i class="fas fa-user-tie nav-icon"></i>
                                <p>Data Pengguna</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?= base_url('akun'); ?>" class="nav-link <?= current_url() == base_url('akun') ? "active" : '' ?>">
                                <i class="fas fa-database nav-icon"></i>
                                <p>Data Akun</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?= base_url('santri'); ?>" class="nav-link <?= current_url() == base_url('santri') ? "active" : '' ?>">
                                <i class="fas fa-child nav-icon"></i>
                                <p>Data Santri</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?= base_url('tahun_anggaran'); ?>" class="nav-link <?= current_url() == base_url('tahun_anggaran') ? "active" : '' ?>">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Data Tahun Anggaran</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?= base_url('unit'); ?>" class="nav-link <?= current_url() == base_url('unit') ? "active" : '' ?>">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Data Unit</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-header">Menu Pembayaran</li>
                <li class="nav-item <?= current_url() == base_url('pembayaran/spp') || current_url() == base_url('') ? "menu-open" : '' ?>">
                    <a href="#" class="nav-link <?= current_url() == base_url('pembayaran/spp') || current_url() == base_url('') ? "active" : '' ?>">
                        <i class="nav-icon fas fa-server"></i>
                        <p>
                            Data Pembayaran
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="<?= base_url('pembayaran/spp'); ?>" class="nav-link <?= current_url() == base_url('pembayaran/spp') ? "active" : '' ?>">
                                <i class="fas fa-money-check-alt nav-icon"></i>
                                <!-- <i class="fas fa-user-tie nav-icon"></i> -->
                                <p>Pembayaran SPP</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="<?= base_url('admin/gedung'); ?>" class="nav-link <?= current_url() == base_url('admin/gedung') ? "active" : '' ?>">
                        <i class="nav-icon fas fa-th"></i>
                        <p>
                            Bakcup Data
                        </p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>