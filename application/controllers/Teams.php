<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Teams extends CI_Controller {
	public function __construct()
   	{
   		parent::__construct();
      	$this->load->library('Auth');
     	$this->auth->check(strtolower(get_class($this)));
      	$this->load->library('session');
   	}

   	public function index(){
   		$this->load->model("StudentModel", "students");
   		$data["teams"] = $this->students->getTeams();

   		render('students/overview', $data);
   	}
}