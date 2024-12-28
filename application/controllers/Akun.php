<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Akun extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('Simbayhi_model', 'sm');
		$this->load->library('Curl');
	}

	public function index()
	{
		$data['title'] = 'Akun';

		$data['AkunInduk'] = $this->sm->show_data('simbayhi_data_akun_induk');

		$this->load->view('template/header_template', $data);
		$this->load->view('template/sidebar_template', $data);
		$this->load->view('akun/index', $data);
		$this->load->view('template/footer_template', $data);
	}

	public function DetailAkun($id_akun_induk)
	{
		$data['title'] = 'Detail Akun';

		$data['DataSubAkun'] = $this->sm->Data_SubAkun($id_akun_induk);
		$dataHerarki = $this->sm->Data_SubAkun($id_akun_induk);
		// $DataSubJadiInduk = $this->sm->Data_SubAkun($id_akun_induk);

		// $data['SubJadiInduk'] = $this->format_hierarki($DataSubJadiInduk);
		$data['SubJadiInduk'] = $this->sm->SubJadiInduk($id_akun_induk);
		$data['hierarki'] = $this->format_hierarki($dataHerarki);

		$data['GetAkunInduk'] = $this->sm->getId_data($id_akun_induk, 'simbayhi_data_akun_induk', 'id_akun_induk');
		$data['NomorSubAkun'] = $this->sm->show_data('simbayhi_data_nomor_subakun');
		$data['DataAkunInduk'] = $this->sm->show_data('simbayhi_data_akun_induk');

		$this->form_validation->set_rules('PilihSubAkunInduk', 'Pilih Sub Akun Induk', 'trim|required');
		$this->form_validation->set_rules('kode_subakun', 'Kode Sub Akun', 'trim|required');
		$this->form_validation->set_rules('nama_subakun', 'Nama Sub Akun', 'trim|required');

		if ($this->form_validation->run() == false) {
			$this->load->view('template/header_template', $data);
			$this->load->view('template/sidebar_template', $data);
			$this->load->view('akun/detail_akun', $data);
			$this->load->view('template/footer_template', $data);
		} else {
			$subakun_jadi_induk = htmlspecialchars($this->input->post('Validasi_SubAkunJadiInduk'));
			$kode_subakun = htmlspecialchars($this->input->post('kode_subakun'));
			$kode_subakun_tampil = htmlspecialchars($this->input->post('kode_subakun_tampil'));
			$nama_subakun = htmlspecialchars($this->input->post('nama_subakun'));
			$subakun_id = htmlspecialchars($this->input->post('PilihSubAkunInduk'));
			$nomor_subakun = htmlspecialchars($this->input->post('nomor_subakun'));

			if ($subakun_jadi_induk == 1) {
				$DataSubAkun =
					[
						'id_subakun_induk' => htmlspecialchars($this->input->post('id_subakun_induk')),
						'akun_induk_id' => $id_akun_induk,
						'subakun_id' => $subakun_id,
						'subakun_jadi_induk' => 1,
						'nomor_subakun_id' => $nomor_subakun + 1,
						'kode_subakun' => $kode_subakun_tampil . '.' . $kode_subakun,
						'nama_subakun' => $nama_subakun,
					];
				$this->sm->insert_data($DataSubAkun, 'simbayhi_data_subakun_induk');
				$this->session->set_flashdata('pesan', 'Data Berhasil Ditambahkan.');
				redirect('akun/DetailAkun/' . $id_akun_induk);
			} else {
				$DataSubAkun =
					[
						'id_subakun_induk' => htmlspecialchars($this->input->post('id_subakun_induk')),
						'akun_induk_id' => $id_akun_induk,
						'subakun_id' => $subakun_id,
						'subakun_jadi_induk' => 0,
						'nomor_subakun_id' => $nomor_subakun + 1,
						'kode_subakun' => $kode_subakun,
						'nama_subakun' => $nama_subakun,
					];
				$this->sm->insert_data($DataSubAkun, 'simbayhi_data_subakun_induk');
				$this->session->set_flashdata('pesan', 'Data Berhasil Ditambahkan.');
				redirect('akun/DetailAkun/' . $id_akun_induk);
			}
		}
	}

	private function format_hierarki($data, $parent_kode = '0')
	{
		$output = [];
		foreach ($data as $item) {
			if ($item['subakun_id'] == $parent_kode) {
				$children = $this->format_hierarki($data, $item['id_subakun_induk']);
				if (!empty($children)) {
					$item['children'] = $children;
				}
				$output[] = $item;
			}
		}
		return $output;
	}

	public function get_subakun_pernomor()
	{
		$nomorSubAkun = $this->input->post('nomorSubAkun');
		$idAkunInduk = $this->input->post('idAkunInduk');

		$this->db->select('*');
		$this->db->from('simbayhi_data_subakun_induk');
		$this->db->join('simbayhi_data_akun_induk', 'simbayhi_data_akun_induk.id_akun_induk=akun_induk_id', 'left');
		$this->db->join('simbayhi_data_nomor_subakun', 'simbayhi_data_nomor_subakun.id_nomor_subakun=nomor_subakun_id', 'left');
		$this->db->where('akun_induk_id', $idAkunInduk);
		$this->db->where('nomor_subakun_id', $nomorSubAkun);
		$query = $this->db->get();
		$filtered_data = $query->result_array();

		$output = '
		<div class="card">
                    <div class="card-header bg-success">
                        <h3 class="card-title">Data Sub Akun Nomor 1</h3>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered table-striped" id="DataSubAkun">
                            <thead class="text-center text-white" style="background-color: teal;">
                                <tr>
                                    <th style="width: 5%;">No.</th>
                                    <th style="width: 20%;">Kode Sub Akun</th>
                                    <th style="width: 50%;">Nama Sub Akun</th>
                                    <th style="width: 15%;">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
		';

		$no = 1;
		foreach ($filtered_data as $row) {
			$output .= '<tr>';
			$output .= '<td class="text-center">' . $no++ . '</td>';
			$output .= '<td>' . $row['kode_subakun'] . '</td>';
			$output .= '<td class="text-center">' . $row['nama_subakun'] . '</td>';
			$output .= '<td class="text-center"><a href="#" class="badge badge-danger" data-toggle-tooltip="tooltip" title="Hapus Data" data-toggle="modal" data-target="#hapus_DataSubAkun' . $row['id_subakun_induk'] . '"><i class="fas fa-trash-alt"></i></a></td>';
			$output .= '</tr>';
		}

		$output .= '</tbody></table></div></div>';

		echo $output;
	}

	public function hapusData($id_akun_induk, $id_subakun_induk)
	{
		$this->sm->delete_data('simbayhi_data_subakun_induk', 'id_subakun_induk', $id_subakun_induk);
		$this->session->set_flashdata('pesan', 'Data Berhasil Dihapus!');
		redirect('akun/DetailAkun/' . $id_akun_induk);
	}
}
