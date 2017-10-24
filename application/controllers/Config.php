<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Config extends CI_Controller {
	public function __construct()
   {
   		parent::__construct();
        $this->load->library('Auth');
     	$this->auth->check(strtolower(get_class($this)));
        $this->load->library('session');
   }
	public function index()
	{
		header('Location: ' . $this->session->start_page);
	}

	public function users(){
		$this->load->model("ConfigModel", "config_model");
		/* Users overview */
		$users = $this->config_model->getUsers();
		$users_data = array(
			"users" => $users,
			"deleted" => !empty($this->input->get('deleted')) ? 1 : 0
		);
		render('config/users_overview', $users_data);
	}

	public function editUser($f_id = 0){
		$this->load->model("ConfigModel", "config_model");
		if ($this->input->server('REQUEST_METHOD') == 'POST'){
			$saveData = array(
				"name" => $this->input->post('name'),
				"username" => $this->input->post('username'),
				"email" => $this->input->post('email'),
				"password" => $this->input->post('password'),
				"profile_id" =>$this->input->post('profile_id')
			);

			$newId = $f_id > 0 ?  $this->config_model->updateUser($saveData, $this->input->post('id')) : $this->config_model->insertUser($saveData);
			header('Location: /config/editUser/' . $newId);
		}

		/* User Edit */
		$line = $this->config_model->getUser($f_id);
		if($line){
			$pageType = "Bewerken";
		} else {
			$pageType = "Nieuw";
		}

		$saved = !empty($this->input->get('saved')) ? 1 : 0;

		$profiles = $this->config_model->getProfiles();
		$user_data = array(
			"id" => $f_id,
			"line" => $line,
			"saved" => $saved,
			"type" => $pageType,
			"profiles" => $profiles
		);
		render('config/user_edit', $user_data);
	}

	public function rights(){
		$this->load->model("ConfigModel", "config_model");
		$profiles = $this->config_model->getProfiles();
		$rights_data = array(
			'profiles' => $profiles
		);
		render('config/rights_overview', $rights_data);
	}

	public function editRights($f_id = 0){
		$this->load->model("ConfigModel", "config_model");
		$saved = 0;
		if ($this->input->server('REQUEST_METHOD') == 'POST'){
			$this->config_model->clearRights($f_id);
			if(is_array($this->input->post('right'))){
				foreach($this->input->post('right') as $key => $value){
					$insertData = array(
						"profile_id" => $f_id,
						"rights_id" => $value
					);
					$this->config_model->insertRights($insertData);
				}
			} else {
				if(!empty($this->input->post('right'))){
					$insertData = array(
						"profile_id" => $f_id,
						"rights_id" => $this->input->post('right')
					);
					$this->config_model->insertRights($insertData);
				}
			}
			
			$saved = 1;
		}
		$rights_data = array(
			"profile_id" => $f_id,
			"rights" => $this->config_model->getRights($f_id),
			"saved" => $saved
		);
		render('config/rights_edit', $rights_data);
	}

	public function saveProfile(){
		if ($this->input->server('REQUEST_METHOD') == 'POST'){
			if(!empty($this->input->post('profile_name'))){
				$this->load->model("ConfigModel", "config_model");
				$this->config_model->saveProfile($this->input->post('profile_name'));
			}
		}
	}

	public function deleteUser($f_id = 0){
		if($f_id > 0){
			$this->load->model("ConfigModel", "config_model");
			$this->config_model->deleteUser($f_id);
			header('Location: /config/users');
		}
	}
}