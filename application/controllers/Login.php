<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
	    $this->load->library('session');	
	}

	public function index()
	{

		if ($this->input->server('REQUEST_METHOD') == 'POST'){
			$this->load->library('Auth');
			$this->auth->doLogin($this->input->post('login_string'), $this->input->post('login_pass'));
		}

		if(!empty($this->session->user_id)){
			header('location: ' . $this->session->start_page);
			exit();
		}

		$this->load->view('login', array("error" => $this->session->error));	
		$this->session->error = array();
	}

	public function logout(){
		$this->load->library('Auth');
		$this->auth->doLogout();
	}

	public function install(){
		$this->load->library('Auth');
		$this->auth->installSystem();
		header('Location: /login');
	}

}
