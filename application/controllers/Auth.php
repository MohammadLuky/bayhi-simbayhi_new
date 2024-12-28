<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Auth extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Simbayhi_model', 'sm');
	}

	public function index()
	{
		if ($this->session->userdata('username')) {
			redirect('dashboard');
		}

		$this->form_validation->set_rules('username', 'Username', 'trim|required');
		$this->form_validation->set_rules('password', 'Password', 'trim|required');

		if ($this->form_validation->run() == false) {
			$data['title'] = 'Login | E-PEGAWAI';
			$this->load->view('login2_header', $data);
			$this->load->view('login2', $data);
			$this->load->view('login2_footer', $data);
		} else {
			// validasinya success
			$this->_login();
		}
	}

	private function _login()
	{
		$username = $this->input->post('username');
		$password = $this->input->post('password');

		// awal
		// $user = $this->db->get_where('pegawai_user', ['username' => $username])->row_array();
		// $status_pegawai = $this->db->get_where('pegawai_data', ['id_pegawai' => $user['pegawai_id']])->row_array();
		// if ($user) {
		// if (password_verify($password, $user['password'])) {
		// 	if ($status_pegawai['aktif_pegawai'] != 0) {
		// 		$data = [
		// 			'username' => $user['username'],
		// 			'role_id' => $user['role_id'],
		// 			'status_pegawai_id' => $status_pegawai['status_pegawai_id']
		// 		];
		// 		$this->session->set_userdata($data);
		// 		redirect('dashboard');

		// baru
		$session_pegawai = $this->sm->getsession_auth($username);

		if ($session_pegawai) {
			if (password_verify($password, $session_pegawai['password'])) {
				if ($session_pegawai['user_aktif'] != 0) {
					$data = [
						'id_users' => $session_pegawai['id_users'],
						'username' => $session_pegawai['username'],
						'role_id' => $session_pegawai['role_id'],
					];
					$this->session->set_userdata($data);
					redirect('dashboard');
				} else {
					$this->session->set_flashdata('message', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
					Akun Anda belum aktif!<br>
					Segera Hubungi HCD.
					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					</div>');
					redirect('auth');
				}
			} else {
				$this->session->set_flashdata('message', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
				Password Anda Salah!
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				</div>');
				redirect('auth');
			}
		} else {
			$this->session->set_flashdata('message', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
			Username tidak terdaftar!
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>');
			redirect('auth');
		}
	}

	public function logout()
	{
		$this->session->unset_userdata('username');
		$this->session->unset_userdata('id_users');
		$this->session->unset_userdata('role_id');

		$this->session->set_flashdata('message', '<div class="alert alert-success alert-dismissible fade show" role="alert">
			Anda Sudah Logout!
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>');
		redirect('auth');
	}
}
