<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Pembayaran extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('Simbayhi_model', 'sm');
	}

	public function index()
	{
		$data['title'] = 'Pembayaran';

		$this->load->view('template/header_template', $data);
		$this->load->view('template/sidebar_template', $data);
		$this->load->view('pembayaran/index', $data);
		$this->load->view('template/footer_template', $data);
	}

	public function spp()
	{
		$data['title'] = 'Pembayaran SPP';

		$this->load->view('template/header_template', $data);
		$this->load->view('template/sidebar_template', $data);
		$this->load->view('pembayaran/spp', $data);
		$this->load->view('template/footer_template', $data);
	}
}
