<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="Registrations.aspx.cs" Inherits="MFBDBO.Master.Registrations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    <form runat="server">
        <section class="content-header">
            <h1>Registrations</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">Sales</li>
                <li class="active">Registrations</li>
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

                    <div class="tab-content">
                        <!--Tab1-->
                        <table id="RegistrationTable" class="table table-bordered datatable table-striped" style="width: 100%">
                            <thead>
                                <tr>
                                    <th>Agency Name</th>
                                    <th>Agent</th>
                                    <th>Mobile</th>
                                    <th>Email</th>
                                    <th>City</th>
                                    <th>Category</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>

                                    <td>SVR Agency</td>
                                    <td>Ramesh</td>
                                    <td>9876543210</td>
                                    <td>ramesh123@gmail.com</td>
                                    <td>Hyderabad</td>
                                    <td>B2B</td>
                                    <td><span class="dtr-data"><span class="label label-success">Approved</span></span></td>
                                    <td>
                                        <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="RegistrationView.aspx"><i class="fa fa-file-text-o"></i>View</a></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>

                            </tbody>
                        </table>

                    </div>

                </div>
                <!--End Navbar Tabs --->
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

            $('#RegistrationTable').dataTable({
                "pageLength": 50,
                dom: 'frtip',
                responsive: true

            });

        </script>

    </form>
</asp:Content>
