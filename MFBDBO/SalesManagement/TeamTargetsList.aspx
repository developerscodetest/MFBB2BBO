<%@ Page Title="" Language="C#" MasterPageFile="~/SalesManagement/SalesManagement.Master" AutoEventWireup="true" CodeBehind="TeamTargetsList.aspx.cs" Inherits="MFBDBO.SalesManagement.TeamTargetsList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SalesPlaceHolder" runat="server">
    <form runat="server">
        <section class="content-header">
            <h1>Team Targets List </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Team Targets List</li>
            </ol>
        </section>

        <section class="content">
            <div class="box">
                <div class="box-body">
                    <div class="box-footer" style="text-align: right">
                        <asp:Button ID="btnAssignTarget" class="btn btn-primary" runat="server" PostBackUrl="TeamTargets.aspx" Text="Assign Target" />
                    </div>

                    <table id="list1" class="table table-bordered table-striped dataTable">
                        <thead>
                            <tr>
                                <th>Year</th>
                                <th>Month</th>
                                <th>Target</th>
                                <th>Achieved</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>2018</td>
                                <td>May</td>
                                <td>100000</td>
                                <td>50000</td>
                                <td>Not Achieved</td>
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
                                <td>2018</td>
                                <td>June</td>
                                <td>100000</td>
                                <td>50000</td>
                                <td>Not Achieved</td>
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
                                <td>2018</td>
                                <td>July</td>
                                <td>100000</td>
                                <td>50000</td>
                                <td>Not Achieved</td>
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
                                <td>2018</td>
                                <td>August</td>
                                <td>100000</td>
                                <td>50000</td>
                                <td>Not Achieved</td>
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
                                <td>2018</td>
                                <td>September</td>
                                <td>100000</td>
                                <td>50000</td>
                                <td>Not Achieved</td>
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
                                <td>2018</td>
                                <td>October</td>
                                <td>100000</td>
                                <td>50000</td>
                                <td>Not Achieved</td>
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
            </div>
        </section>

        <!-- jQuery 2.2.3 -->
        <script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
        <!-- Bootstrap 3.3.6 -->
        <script src="../bootstrap/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
        <!--Data Tables-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
        <link type="text/css" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" rel="stylesheet">
        <link type="text/css" href="https://cdn.datatables.net/buttons/1.1.2/css/buttons.dataTables.min.css" rel="stylesheet">
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.1.2/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.1.2/js/buttons.flash.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
        <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.1.2/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.1.2/js/buttons.print.min.js"></script>

        <!-- Data Table Function-->
        <script type="text/javascript">
            $('#list1').dataTable({
                "pageLength": 50,
                dom: 'frtip',
                buttons: ['excelHtml5']
            });

        </script>
    </form>
</asp:Content>



