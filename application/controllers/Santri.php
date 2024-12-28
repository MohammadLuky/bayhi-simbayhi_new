<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Santri extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('Simbayhi_model', 'sm');
		$this->load->library('Curl');
	}

	public function index()
	{
		$data['title'] = 'Data Santri';

		$data['AllSantri'] = $this->sm->show_data('simbayhi_data_santri');
		// $data['AllPengguna'] = $this->sm->AllPengguna();

		$this->load->view('template/header_template', $data);
		$this->load->view('template/sidebar_template', $data);
		$this->load->view('santri/index', $data);
		$this->load->view('template/footer_template', $data);
	}

	public function SyncSantri()
	{
		// header('Content-Type: application/json');
		$url = 'http://36.95.178.42:8080/data_api/api/santri_simbayhi_new';

		$response = $this->curl->request($url);

		if ($response['http_code'] !== 200 || empty($response['response'])) {
			$this->session->set_flashdata('error', 'Gagal mengakses API: ' . ($response['error'] ?: 'Server tidak merespon'));
			redirect('santri');
		} else {

			$data = json_decode($response['response'], true);

			if ($data['data']) {
				foreach ($data['data'] as $item) {
					$id_data_santri = $item['nis'];
					$nama_santri = $item['nama_santri_lengkap'];
					$jenis_kelamin = $item['jenis_kelamin'];
					$kelas_santri = $item['id_kelas'];
					if ($item['status'] == 'aktif') {
						$status_santri = 1;
					} elseif (in_array($item['status'], ['tidak', 'boyong'])) {
						$status_santri = 0;
					}
					if (in_array($item['id_kelas'], ['X_1', 'X_2', 'X_3', 'X_4', 'XI_1', 'XI_2', 'XI_3', 'XI_4', 'XII_1', 'XII_2', 'XII_3', 'XII_4'])) {
						$jenjang_santri = 'SMA';
					} elseif (in_array($item['id_kelas'], ['X_DKV', 'XI_DKV', 'XII_DKV'])) {
						$jenjang_santri = 'SMK';
					} elseif (in_array($item['id_kelas'], ['VIIA', 'VIIB', 'VIIC', 'VIID', 'VIIIA', 'VIIIB', 'VIIIC', 'VIIID', 'VIIIE', 'VIIIF', 'IXA', 'IXB', 'IXC', 'IXD'])) {
						$jenjang_santri = 'SMP';
					}

					$SantriSimbayhi = [
						'id_data_santri' => $id_data_santri,
						'nama_santri' => $nama_santri,
						'jenis_kelamin' => $jenis_kelamin,
						'kelas_santri' => $kelas_santri,
						'jenjang_santri' => $jenjang_santri,
						'program_santri' => '',
						'tahun_masuk' => 0,
						'status_santri' => $status_santri,
					];

					if (!$this->sm->checkIfExists($id_data_santri, 'id_data_santri', 'simbayhi_data_santri')) {
						$this->sm->insert_data($SantriSimbayhi, 'simbayhi_data_santri');
					} else {
						$this->sm->update_data('id_data_santri', $id_data_santri, 'simbayhi_data_santri', $SantriSimbayhi);
					}
				}
			} else {
				$this->session->set_flashdata('pesan', 'Data Tidak Ada!');
			}

			$this->session->set_flashdata('pesan', 'Data Berhasil DiUpdate!');
			redirect('santri');
		}
	}
}
