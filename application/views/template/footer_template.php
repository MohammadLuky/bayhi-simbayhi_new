</div>
<!-- /.content-wrapper -->
<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
</aside>
<!-- /.control-sidebar -->

<!-- Main Footer -->
<footer class="main-footer">
    <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
        <b>Version</b> 3.2.0
    </div>
</footer>
</div>
<!-- ./wrapper -->
<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->
<script src="<?= base_url('assets/theme/'); ?>plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="<?= base_url('assets/theme/'); ?>plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- overlayScrollbars -->
<script src="<?= base_url('assets/theme/'); ?>plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="<?= base_url('assets/theme/'); ?>dist/js/adminlte.js"></script>

<!-- PAGE PLUGINS -->
<!-- jQuery Mapael -->
<script src="<?= base_url('assets/theme/'); ?>plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
<script src="<?= base_url('assets/theme/'); ?>plugins/raphael/raphael.min.js"></script>
<script src="<?= base_url('assets/theme/'); ?>plugins/jquery-mapael/jquery.mapael.min.js"></script>
<script src="<?= base_url('assets/theme/'); ?>plugins/jquery-mapael/maps/usa_states.min.js"></script>
<!-- ChartJS -->
<script src="<?= base_url('assets/theme/'); ?>plugins/chart.js/Chart.min.js"></script>

<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<?= base_url('assets/theme/'); ?>dist/js/pages/dashboard2.js"></script>
<script src="<?= base_url('assets/theme/'); ?>plugins/select2/js/select2.full.min.js"></script>
<!-- Toastr -->
<script src="<?= base_url('assets/theme/'); ?>plugins/toastr/toastr.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="<?= base_url('assets/theme/'); ?>plugins/datatables/jquery.dataTables.min.js"></script>
<script src="<?= base_url('assets/theme/'); ?>plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="<?= base_url('assets/theme/'); ?>plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="<?= base_url('assets/theme/'); ?>plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="<?= base_url('assets/theme/'); ?>plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="<?= base_url('assets/theme/'); ?>plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="<?= base_url('assets/theme/'); ?>plugins/jszip/jszip.min.js"></script>
<script src="<?= base_url('assets/theme/'); ?>plugins/pdfmake/pdfmake.min.js"></script>
<script src="<?= base_url('assets/theme/'); ?>plugins/pdfmake/vfs_fonts.js"></script>
<script src="<?= base_url('assets/theme/'); ?>plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="<?= base_url('assets/theme/'); ?>plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="<?= base_url('assets/theme/'); ?>plugins/datatables-buttons/js/buttons.colVis.min.js"></script>


<script>
    $(function() {
        $('.select2').select2()
    });
    $(function() {
        $(".dataSimbayhi").DataTable({
            "responsive": true,
        });
    });
    $(document).ready(function() {
        $('[data-toggle-tooltip="tooltip"]').tooltip();
    });
    $(document).ready(function() {
        <?php if ($this->session->flashdata('pesan')): ?>
            toastr.success('<?= $this->session->flashdata('pesan'); ?>');
        <?php elseif ($this->session->flashdata('error')): ?>
            toastr.error('<?= $this->session->flashdata('error'); ?>');
        <?php endif; ?>
    });
</script>
<script>
    $(document).ready(function() {
        $('#pengguna_simbayhi').select2({
            placeholder: "Pilih Pegawai",
            ajax: {
                url: '<?php echo base_url("pengguna/GetPegawai_api"); ?>',
                dataType: 'json',
                processResults: function(data) {
                    return {
                        results: data
                    };
                }
            }
        });

        $('#TambahPengguna').click(function() {
            var rolepengguna = $('#role_pengguna').val();
            var selectedData = $('#pengguna_simbayhi').select2('data');
            if (selectedData.length === 0) {
                toastr.error('Silakan pilih pegawai terlebih dahulu!.')
                return;
            }

            if (!rolepengguna) {
                toastr.error('Silakan pilih Role terlebih dahulu!.')
                return;
            }

            var dataToSend = {
                role_pengguna: rolepengguna,
                niy_pegawai: selectedData[0].id,
                nama_lengkap: selectedData[0].text
            };

            $.ajax({
                url: '<?= base_url("pengguna/tambahData"); ?>',
                type: 'POST',
                data: dataToSend,
                success: function(response) {
                    console.log(response);
                    if (response.status === 'success') {
                        toastr.success(response.pesan);
                        setTimeout(function() {
                            window.location.reload();
                        }, 1500);
                    } else {
                        toastr.error(response.pesan);
                        setTimeout(function() {
                            window.location.reload();
                        }, 1500);
                    }

                },
                error: function() {
                    toastr.error('Terjadi kesalahan saat mengirim data!.');
                    setTimeout(function() {
                        window.location.reload();
                    }, 1500);
                }
            });

        });

        // $('#FormSubAkun').hide();
        // $("#DataSubAkun").DataTable({
        //     "responsive": true,
        // });


        // $('#DataPerSubAkun').hide();

        // $('.list-nomorsubakun').on('click', function(e) {
        //     e.preventDefault();
        //     var nomorSubAkun = $(this).data('id');
        //     var idAkunInduk = $(this).data('idakuninduk');

        //     $('#FormSubAkun').slideDown();
        //     $('#DataPerSubAkun').slideDown();
        //     $('#nomor_subakun').val(nomorSubAkun);

        //     $.ajax({
        //         url: "<?= base_url("akun/get_subakun_pernomor/"); ?>",
        //         method: "POST",
        //         data: {
        //             nomorSubAkun: nomorSubAkun,
        //             idAkunInduk: idAkunInduk
        //         },
        //         success: function(response) {
        //             $('#DataPerSubAkun').html(response);
        //             $("#DataSubAkun").DataTable({
        //                 "responsive": true,
        //             });
        //             // $('#loading').hide();
        //             // activateTableEdit();
        //         },
        //         error: function() {
        //             // $('#loading').hide();
        //             toastr.error('Terjadi kesalahan saat memuat data.');
        //         }
        //     });
        // });

        $('#PilihSubAkunInduk').change(function() {
            var selectedOption = $(this).find(':selected');
            var KodeAkun = selectedOption.data('id');
            var NomorSubAkun = selectedOption.data('nomorsubakun');

            $('#kode_subakun_tampil').val(KodeAkun);
            $('#nomor_subakun').val(NomorSubAkun);
        });

        document.getElementById('kode_subakun').addEventListener('input', function() {
            let kodeSubAkun = this.value;
            let kodeSubAkunCleaned = kodeSubAkun.replace(/\./g, '');
            document.getElementById('id_subakun_induk').value = kodeSubAkunCleaned;
        });


    });
</script>
</body>

</html>