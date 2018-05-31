<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="HoldAgents.aspx.cs" Inherits="MFBDBO.Master.HoldAgents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    <form runat="server">
        <section class="content-header">
            <h1>Hold Agents</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                 <li class="#">Agents</li>
                <li class="active">Hold</li>
            </ol>
        </section>
        <section class="content">
        <div class="box">
            <!-- /.box-header -->
            <div class="box-header">
                <h3 class="box-title"></h3>
            </div>
            <!-- /.box-body -->
            <div class="box-body">
            <table id="Hold" class="table table-bordered datatable table-striped" style="width:100%">
                    <thead>
                        <tr>
                            <th>Agency Code</th>
                            <th>Agency Name</th>
                            <th>Contact Person</th>
                            <th>Mobile</th>
                            <th>Email</th>
                            <th>Sales Executive</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>fgjff345</td>
                            <td>Priority Services</td>
                            <td>Ramesh</td>
                            <td>9876543210</td>
                            <td>ramesh123@gmail.com</td>
                            <td>Karthik</td>
                            <td>
                              <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>View</a></li>
                                            </ul>
                                        </div>
                            </td>
                        </tr>
                       <tr>
                            <td>fgjff345</td>
                            <td>Priority Services</td>
                            <td>Ramesh</td>
                            <td>9876543210</td>
                            <td>ramesh123@gmail.com</td>
                             <td>Karthik</td>
                            <td>
                                 <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>View</a></li>
                                            </ul>
                                        </div>
                            </td>
                        </tr>
                       <tr>
                            <td>fgjff345</td>
                            <td>Priority Services</td>
                            <td>Ramesh</td>
                            <td>9876543210</td>
                            <td>ramesh123@gmail.com</td>
                             <td>Karthik</td>
                            <td>
                                 <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>View</a></li>
                                            </ul>
                                        </div>
                            </td>
                        </tr>
                        <tr>
                             <td>fgjff345</td>
                            <td>Priority Services</td>
                            <td>Ramesh</td>
                            <td>9876543210</td>
                            <td>ramesh123@gmail.com</td>
                              <td>Karthik</td>
                            <td>
                          <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>View</a></li>
                                            </ul>
                                        </div>
                            </td>
                        </tr>
                        <tr>
                             <td>fgjff345</td>
                            <td>Priority Services</td>
                            <td>Ramesh</td>
                            <td>9876543210</td>
                            <td>ramesh123@gmail.com</td>
                              <td>Karthik</td>
                           <td>
                                  <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>View</a></li>
                                            </ul>
                                        </div>
                            </td>
                        </tr>
                        
                    </tbody>
                </table>


            </div>
        </div>

    </section>

   <!-- jQuery 2.2.3 -->
        <script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
        <!--Data Tables-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
        <link type="text/css" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" rel="stylesheet">
        <!--Responsive css--->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.dataTables.min.css" />
        <link type="text/css" href="https://cdn.datatables.net/buttons/1.1.2/css/buttons.dataTables.min.css" rel="stylesheet">
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
        <!--Responsive js--->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/responsive/2.2.1/js/dataTables.responsive.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.1.2/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.1.2/js/buttons.flash.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
        <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.1.2/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.1.2/js/buttons.print.min.js"></script>

        <script type="text/javascript">
            //Data Table Function

            $('#Hold').dataTable({
                "pageLength": 50,
                dom: 'frtip',
                responsive: true
               
            });

        </script>


    </form>
</asp:Content>
