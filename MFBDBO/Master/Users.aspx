<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="MFBDBO.Master.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    <form runat="server">
        <section class="content-header">
            <h1>Users</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">User Management</li>
                 <li class="active">Users</li>
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
                    <!--1st row-->
                    <form>
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblRole" class="control-label col-sm-3" runat="server" Text="Label"><b>Role :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-9">
                                   <select class="form-control select2">
                                       <option>--select--</option>
                                       <option></option>
                                   </select>
                                </div>
                            </div>
                             <div class="col-md-6">
                                <asp:Label ID="lblName" class="control-label col-sm-3" runat="server" Text="Label"><b>Name :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-9">
                                  <select class="form-control select2">
                                       <option>--select--</option>
                                       <option></option>
                                   </select>
                                </div>
                            </div>
                            </div>

                            <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblUserName" class="control-label col-sm-3" runat="server" Text="Username"><b>Username :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-9">
                    <asp:TextBox ID="txtUserName" class="form-control" placeholder="Enter Username" runat="server"></asp:TextBox> 
                                </div>
                            </div>
                             <div class="col-md-6">
                                <asp:Label ID="lblPassword" class="control-label col-sm-3" runat="server" Text="Password"><b>Password :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-9">
                    <asp:TextBox ID="txtPassword" class="form-control" placeholder="Enter Password" runat="server"></asp:TextBox> 
                                </div>
                            </div>
                            </div>
                         
                                <div class="form-group pull-right">
                                    <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" Style="width: 100px;" />
                                    <asp:Button ID="Button1" class="btn btn-danger" runat="server" Text="Reset" Style="width: 100px;" />

                                </div>
                        
                    </form>
                    <!--2nd row--->


                    <table id="Users" class="table table-bordered datatable table-striped" style="width: 100%">
                        <thead>
                            <tr>
                                <th>Role</th>
                                <th>Name</th>
                                <th>Username</th>
                                <th>Password</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Operations</td>
                                <td>Prasanth Vinti</td>
                                <td>Prasanth123</td>
                                <td>prasanth@dc</td>
                                <td>Active</td>
                                <td>
                                    <div class="btn-group text-left">
                                        <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                        <ul class="dropdown-menu pull-right" role="menu">
                                            <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                            <li><a href="#"><i class="fa fa-file-text-o"></i>Mark As Inactive</a></li>
                                        </ul>
                                    </div>

                                </td>
                            </tr>
                        </tbody>
                    </table>



                    <!--End Navbar Tabs --->
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

            $('#Users').dataTable({
                "pageLength": 50,
                dom: 'frtip',
                responsive: true
               
            });

        </script>

    </form>


   
</asp:Content>
