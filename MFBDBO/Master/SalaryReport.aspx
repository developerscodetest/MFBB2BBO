<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="SalaryReport.aspx.cs" Inherits="MFBDBO.Master.SalaryReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    
        <section class="content-header">
            <h1>Salary Report</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">Payroll Management</li>
                <li class="active">Salary Report</li>
            </ol>
        </section>
        <section class="content">
            <div class="box box-body">
                <div class="box-header"></div>
                <!--1st row-->
                <div class="form-row">
                    <div class="col-md-6">
                        <asp:Label ID="lblSMonth" class="control-label col-sm-3" runat="server" Text="SELECT MONTH"><b>SELECT MONTH </b>
                        </asp:Label>
                        <div class="col-sm-9">
                            <select class="form-control select2">
                                <option>select month</option>
                                <option>january</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lblSYear" class="control-label col-sm-3" runat="server" Text="SELECT YEAR"><b>SELECT YEAR </b>
                        </asp:Label>
                        <div class="col-sm-9">
                            <select class="form-control select2">
                                <option>select Year</option>
                                <option>2016</option>
                                <option>2017</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 modal-footer pull-right">
                                <asp:Button ID="btnGetSalaries" class="btn btn-primary" runat="server" Text="Get Salaries" />
                            </div>

                <!--Table-->
                <table id="Users" class="table table-bordered datatable table-striped" style="width: 100%">
                    <thead>
                        <tr>
                            <th>Employee Number</th>
                            <th>Name</th>
                            <th>Gross Salary</th>
                            <th>Deductions</th>
                            <th>Netpay</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Emp1001</td>
                            <td>Prasanth</td>
                            <td>15000</td>
                            <td>13000</td>
                            <td>200</td>
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
            </div>
        </section>

    
</asp:Content>
