<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="ActiveAgents.aspx.cs" Inherits="MFBDBO.Master.ActiveAgents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
<form runat="server">
        <section class="content-header">
            <h1> Agents</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                 <li class="#">Agents</li>
                <li class="active">Active</li>
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
    <div class="form-row">
                     <div class="form-group col-xl-5 col-lg-5 col-md-5 col-sm-12 col-12">
                            <asp:Label ID="Label1" class="control-label required" runat="server" Text="Agent"><b>Staff :</b></asp:Label>
                            <select class="form-control select2">
                                <option>All</option>
                                   <option></option>
                                   <option></option>
                                   <option></option>
                                   <option></option>
                            </select>
                        </div>
                        <div class="form-group col-xl-5 col-lg-5 col-md-5 col-sm-12 col-12">
                            <asp:Label ID="lblAgent" class="control-label required" runat="server" Text="Agent"><b>Status :</b></asp:Label>
                            <select class="form-control select2">
                                <option>--Select--</option>
                                <option></option>
                            </select>
                        </div>
                        
                      <div class="form-group col-xl-2 col-lg-2 col-md-2 col-sm-12 col-12" style="margin-top: 20px;">
                            <asp:Button ID="btnSearch" class="btn btn-primary" runat="server" Text="Search" Style="width: 100px;" />
                        </div>
                    </div>

                <table id="Active" class="table table-bordered datatable table-striped" style="width:100%">
                    <thead>
                        <tr>
                            <th>Agency Code</th>
                            <th>Agency Name</th>
                            <th>Contact Person</th>
                            <th>Mobile</th>
                            <th>Email</th>
                            <th>Staff</th>
                            <th>Status</th>
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
                            <td><span class="dtr-data"><span class="label label-success">Active</span></span></td>
                            <td>
                              <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="AgentsView.aspx"><i class="fa fa-file-text-o"></i>View</a></li>
                                                  <li><a href="#"><i class="fa fa-file-text-o"></i>Hold</a></li>
                                                  <li><a href="#"><i class="fa fa-file-text-o"></i>Mark As Inactive</a></li>
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

            $('#Active').dataTable({
                "pageLength": 50,
                dom: 'frtip',
                responsive: true
               
            });

        </script>
    </form>
</asp:Content>
