<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="PaymentsList.aspx.cs" Inherits="MFBDBO.Master.PaymentsList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    <form runat="server">
        <section class="content-header">
            <h1>Payments List</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Invoice Management</li>
                <li class="active">Payments List</li>
            </ol>
        </section>

        <section class="content">
            <div class="box">
                <div class="box-header">
                    <%--<h3 class="box-title"></h3>--%>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                        <div class="form-group pull-right">
                            <asp:Button ID="btnAP" class="btn btn-primary" runat="server" Text="Add Payment" />
                        </div>
                  
                    <!--2nd Row-->

                    <!--Table-->
                    <!--Table-->
                    <table id="paymentList" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Inv Details</th>
                                <th>Transaction No</th>
                                <th>Agency</th>
                                <th>Agent</th>
                                <th>Amount</th>
                                <th>Payment</th>
                                <th>Balance</th>
                                <th>Status</th>
                                <th>Actions</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><span><b>INV NO :</b> 123456</span><br />
                                    <span><b>INV Date :</b> 29-04-2018</span>
                                </td>
                               <td>123456</td>
                                <td>SVR Services<br />
                                    <span><b>Staff  :</b> Karthik</span><br />

                                </td>
                                <td>Ramesh<br />
                                    <span><b>Mobile :</b> 9876543210</span>
                                </td>
                                <td><span><b>Total :</b> 20000</span><br />
                                    <span><b>Due Date :</b>29-05-2018</span><br />
                                </td>
                                <td><span><b>Amount :</b> 1000</span><br />
                                    <span><b>Date : </b>29-05-2018</span><br />
                                </td>
                                <td>10000</td>
                                <td><span class="dtr-data"><span class="label label-danger">Due</span></span></td>
                                <td>
                                    <div class="btn-group text-left">
                                        <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                        <ul class="dropdown-menu pull-right" role="menu">
                                            <li><a href="AddPayment.aspx"><i class="fa fa-file-text-o"></i>View</a></li>
                                        </ul>
                                    </div>
                                </td>
                        </tbody>
                    </table>

                </div>
                <!-- /.box-body -->
            </div>

        </section>

        <!-- jQuery 2.2.3 -->
        <script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
        <!--Data Tables-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css" />
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.dataTables.min.css" />
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/responsive/2.2.1/js/dataTables.responsive.min.js"></script>
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

        <script type="text/javascript">
            //Data Table Function
            $('#paymentList').dataTable({
                "pageLength": 50,
                dom: 'frtip',
                responsive: true,
            });
        </script>



    </form>
</asp:Content>
