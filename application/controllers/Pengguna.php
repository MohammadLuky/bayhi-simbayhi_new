<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Pengguna extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('Simbayhi_model', 'sm');
		$this->load->library('Curl');
	}

	public function index()
	{
		$data['title'] = 'Pengguna';

		$data['rolePengguna'] = $this->sm->show_data('simbayhi_role_user');
		$data['AllPengguna'] = $this->sm->AllPengguna();


		$this->load->view('template/header_template', $data);
		$this->load->view('template/sidebar_template', $data);
		$this->load->view('pengguna/index', $data);
		$this->load->view('template/footer_template', $data);
	}

	public function GetPegawai_api()
	{
		$url = 'http://localhost/simpegawai/apidata/datapegawai';
		$response = $this->curl->request($url);

		$DataPegawai = [];
		if ($response['status'] == true) {
			foreach ($response['data'] as $data) {
				$DataPegawai[] = [
					"id" => $data['niy_pegawai'],
					"text" => $data['nama_lengkap']
				];
			}
		}

		echo json_encode($DataPegawai);
	}

	public function tambahData()
	{
		header('Content-Type: application/json');
		$niy_pegawai = $this->input->post('niy_pegawai');
		$nama_lengkap = $this->input->post('nama_lengkap');
		$role_pengguna = $this->input->post('role_pengguna');

		if (empty($niy_pegawai) || empty($nama_lengkap)) {
			echo json_encode(['status' => 'error', 'pesan' => 'Data tidak lengkap']);
			return;
		}

		$cekData = $this->sm->checkIfExists($niy_pegawai, 'id_users', 'simbayhi_users');

		if ($cekData) {
			echo json_encode(['status' => 'error', 'pesan' => 'Data Pengguna Sudah Ada']);
			return;
		}

		$data = [
			'id_users' => $niy_pegawai,
			'nama_pengguna' => $nama_lengkap,
			'username' => $niy_pegawai,
			'password' => password_hash($niy_pegawai, PASSWORD_DEFAULT),
			'pass_tampil' => $niy_pegawai,
			'role_id' => $role_pengguna,
			'user_aktif' => 1,
		];

		$this->sm->insert_data($data, 'simbayhi_users');
		$insert = $data;

		if ($insert) {
			echo json_encode(['status' => 'success', 'pesan' => 'Data berhasil disimpan']);
		} else {
			echo json_encode(['status' => 'error', 'pesan' => 'Gagal menyimpan data']);
		}
	}

	public function hapusData($id_users)
	{
		$this->sm->delete_data('simbayhi_users', 'id_users', $id_users);
		$this->session->set_flashdata('pesan', 'Data Berhasil Dihapus!');
		redirect('pengguna');
	}
}
