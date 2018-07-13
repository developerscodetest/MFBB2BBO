<%@ Page Title="" Language="C#" MasterPageFile="~/Salesmanagement/SalesManagement.Master" AutoEventWireup="true" CodeBehind="SalesTeam.aspx.cs" Inherits="MFBDBO.Salesmanagement.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SalesPlaceHolder" runat="server">


     <section class="content-header">
        <h1>Sales Team
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Sales Team</li>
        </ol>
    </section>
     <section class="content">
     <div class="box">
        <div class="box-header">
            <h3 class="box-title"></h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table id="example1" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Employee</th>
                        <th>Mobile</th>
                        <th>Email</th>
                        <th>Agents</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Suresh</td>
                        <td>9325265458</td>
                        <td>suri123@gmail.com</td>
                        
                        <td>
                            <label class="label label-success">80</label></td>
                        <td>
                             <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>View</a></li>
                                            </ul>
                                        </div>
                         
                        </td>
                    </tr>
                    <tr>
                        <td>Dinesh</td>
                        <td>9494585756</td>
                        <td>dinnu123@gmail.com</td>
                        
                        <td>
                            <label class="label label-success">120</label></td>
                        <td>
                           <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>View</a></li>
                                            </ul>
                                        </div>
                 
                        </td>
                    </tr>
                    <tr>
                        <td>Ramesh</td>
                        <td>7478758596</td>
                        <td>rami456@gmail.com</td>
                        
                        <td>
                            <label class="label label-success">100</label></td>
                        <td>
                         <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>View</a></li>
                                            </ul>
                                        </div>
                         
                        </td>
                    </tr>
                     <tr>
                        <td>Prathap</td>
                        <td>9966966821</td>
                        <td>velamala256@gmail.com</td>
                        
                        <td>
                            <label class="label label-success">150</label></td>
                        <td>
                          <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>View</a></li>
                                            </ul>
                                        </div>

                        </td>
                    </tr>
                    <tr>
                        <td>Pradeep</td>
                        <td>9988988661</td>
                        <td>deep253@gmail.com</td>
                        
                        <td>
                            <label class="label label-success">60</label></td>
                        <td>
                           <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>View</a></li>
                                            </ul>
                                        </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Mujaffar</td>
                        <td>8585654595</td>
                        <td>mujaffar@gmail.com</td>
                        
                        <td>
                            <label class="label label-success">69</label></td>
                        <td>
                          <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>View</a></li>
                                            </ul>
                                        </div>
                   
                        </td>
                    </tr>
                   <tr>
                        <td>Rahaman</td>
                        <td>9966554477</td>
                        <td>raham123@gmail.com</td>
                        
                        <td>
                            <label class="label label-success">180</label></td>
                        <td>
                           <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>View</a></li>
                                            </ul>
                                        </div>
                          
                        </td>
                    </tr>
                   <tr>
                        <td>Hidayath</td>
                        <td>8341256474</td>
                        <td>hidayath@gmail.com</td>
                        
                        <td>
                            <label class="label label-success">195</label></td>
                        <td>
                           <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>View</a></li>
                                            </ul>
                                        </div>
                      
                        </td>
                    </tr>
                    <tr>
                        <td>Kalam</td>
                        <td>9111111221</td>
                        <td>legendkalam@gmail.com</td>
                        
                        <td>
                            <label class="label label-success">80</label></td>
                        <td>
                           <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>View</a></li>
                                            </ul>
                                        </div>
                    
                        </td>
                    </tr>
                    <tr>
                        <td>Abbu Bakkar</td>
                        <td>7858784785</td>
                        <td>siddique@gmail.com</td>
                        
                        <td>
                            <label class="label label-success">80</label></td>
                        <td>
                          <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>View</a></li>
                                            </ul>
                                        </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Tharun</td>
                        <td>9874563256</td>
                        <td>tharun@gmail.com</td>
                        
                        <td>
                            <label class="label label-success">80</label></td>
                        <td>
                        <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>View</a></li>
                                            </ul>
                                        </div>
               
                        </td>
                    </tr>
                     <tr>
                        <td>Somesh</td>
                        <td>8547145236</td>
                        <td>somee@gmail.com</td>
                        
                        <td>
                            <label class="label label-success">80</label></td>
                        <td>
                          <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>View</a></li>
                                            </ul>
                                        </div>
                      
                        </td>
                    </tr>
                   
                </tbody>
            </table>
        </div>
        <!-- /.box-body -->
    </div>
         </section>
</asp:Content>
