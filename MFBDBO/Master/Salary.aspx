<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="Salary.aspx.cs" Inherits="MFBDBO.Master.Salary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Select2 -->
    <link rel="stylesheet" href="../../plugins/select2/select2.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
      <form runat="server">
 <section class="content-header">
      <h1>Salary</h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="#">Payroll Management</li>
            <li class="active">Salary</li>
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
                     <div class="form-row">
                    <div class="form-group col-md-4">
                        <asp:Label ID="lblDepatment" class="control-label required" runat="server" Text="Depatment"><b>Depatment :</b></asp:Label>
                      <select class="form-control select2">
                          <option>Select Department<option>
                          <option></option>
                      </select>
                    </div>
                    <div class="form-group col-md-4">
                         <asp:Label ID="lblDesignation" class="control-label required" runat="server" Text="Designation"><b>Designation :</b></asp:Label>
                      <select class="form-control select2">
                          <option>Select Designation</option>
                          <option></option>
                      </select>
                    </div>
                    <div class="form-group col-md-4">
                     <asp:Label ID="lblEmployee" class="control-label required" runat="server" Text="Employee"><b>Employee :</b></asp:Label>
                      <select class="form-control select2">
                          <option>Select Employee</option>
                          <option></option>
                      </select>
                    </div>
                </div>
                    <!--2nd row--->
                      <div class="form-row">
                    <div class="form-group col-md-4">
                        <asp:Label ID="lblSPMonth" class="control-label required" runat="server" Text="Salary Per Month"><b>Salary Per Month :</b></asp:Label>
                        <asp:TextBox ID="txtSPMonth" type="number" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-4">
                         <asp:Label ID="lblSTemplate" class="control-label required" runat="server" Text="Salary Template"><b>Salary Template :</b></asp:Label>
                      <select class="form-control select2">
                          <option>Select Salary Template</option>
                          <option>Test Template</option>
                      </select>
                    </div>
                </div>
               <div class="col-md-6 modal-footer pull-right">
                    <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" Style="width: 100px" />
                    <asp:Button ID="btnReset" class="btn btn-danger" runat="server" Text="Reset" Style="width: 100px" />
                </div>
                    <!--Table-->
                    <table id="Users" class="table table-bordered datatable table-striped" style="width: 100%">
                        <thead>
                            <tr>
                                <th>Employee Name</th>
                                <th>Salary Per Month (CTC)</th>
                                <th>Salary Template</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Kiran</td>
                                <td>10000</td>
                                <td>Test Template</td>
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
       <!--Select2 script-->
      <script src="../../plugins/select2/select2.full.min.js"></script>
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

            //Select2 Function
            $(function () {
                $(".select2").select2();
            });

        </script>

</form>
</asp:Content>
