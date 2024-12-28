<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Dashboard extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('Simbayhi_model', 'sm');
	}

	public function index()
	{
		$data['title'] = 'Dashboard';

		$this->load->view('template/header_template', $data);
		$this->load->view('template/sidebar_template', $data);
		$this->load->view('dashboard/index', $data);
		$this->load->view('template/footer_template', $data);
	}
}
