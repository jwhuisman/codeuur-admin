<?php
	class StudentModel extends CI_Model  {

		public function getTeams(){
			$this->db->select("GROUP_CONCAT(CONCAT(first_name , ' ' , last_name, ' (' , student_id ,')') SEPARATOR ', ') as students, team_id");
			$this->db->group_by("team_id");
			return $this->db->get("students")->result();
		}

	}
?>
