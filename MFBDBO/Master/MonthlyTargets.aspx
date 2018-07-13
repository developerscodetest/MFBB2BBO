<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="MonthlyTargets.aspx.cs" Inherits="MFBDBO.Master.MonthlyTargets" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
     
        <section class="content-header">
            <h1>Monthly Targets List</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                   <li class="#">Sales</li>
                <li class="active">Monthly Targets</li>
            </ol>
        </section>

     <section class="content">
            <div class="box">
                <div class="box-body">
                   <div class="form-row">
                     <div class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12">
                            <asp:Label ID="Label1" class="control-label required" runat="server" Text="Agent"><b>Year :</b></asp:Label>
                            <select class="form-control select2">
                                <option>2018</option>
                                   <option></option>
                                   <option></option>
                                   <option></option>
                                   <option></option>
                            </select>
                        </div>
                        <div class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12">
                            <asp:Label ID="lblAgent" class="control-label required" runat="server" Text="Agent"><b>Month :</b></asp:Label>
                            <select class="form-control select2">
                                <option>May</option>
                                <option></option>
                            </select>
                        </div>
                        <div class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12">
                            <asp:Label ID="lblBookingID" class="control-label required" runat="server" Text="Booking ID"><b>Employee :</b></asp:Label>
                            <select class="form-control select2">
                                <option>All</option>
                                <option>Admin</option>
                                <option>Karthik</option>
                            </select>
                        </div>
                        
                     <div class="form-group col-xl-2 col-lg-2 col-md-2 col-sm-12 col-12" style="margin-top: 20px;">
                            <asp:Button ID="btnSearch" class="btn btn-primary" runat="server" Text="Search" Style="width: 100px;" />
                        </div>
                    </div>


                    <table id="list1" class="table table-bordered table-striped dataTable" style="width:100%">
                        <thead>
                            <tr>
                                <th>Employee</th>
                                <th>Target Amount</th>
                                <th>Achieved Amount</th>
                                <th>Status</th>
                              
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Karthik</td>
                                <td>20000</td>
                                <td>5000</td>
                                <td> <span class="dtr-data"><span class="label label-primary">Not Achieved</span></span></td>
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

            $('#list1').dataTable({
                "pageLength": 50,
                dom: 'frtip',
                responsive: true
               
            });

        </script>

    
</asp:Content>
