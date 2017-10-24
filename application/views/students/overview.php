<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>

	<div class="content-wrapper">
        <section class="content-header">
          <h1>
            Teams
            <small>Overzicht</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-users"></i> Home</a></li>
            <li class="active">Teams</li>
          </ol>
        </section>

   <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box box-success">
                  <div class="box-header">
                      <h3 class="box-title">Teams</h3>
                  </div>
                  <div class="box-body">
                    <table id="users" class="table profileTable table-bordered table-hover dataTable">
                        <thead>
                            <tr>
                              <th width="30">Team</th>
                              <th>Studenten</th>
                              <th width="60">&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php
                          foreach($teams as $team){
                        ?>
                <tr>
                  <td><?=$team->team_id?></td>
                  <td><?=$team->students?></td>
                  <td width="60">
                    <a class="btn btn-success" href="/teams/showteam/<?=$team->team_id?>"><i class="fa fa-search"></i></a>
                  </td>
                </tr>
                        <?php
                          }
                        ?>
                        </tbody>
                    </table>  
                  </div>
                </div>
            </div>
        </div>
    </section>


    </div>