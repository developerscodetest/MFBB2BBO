<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="Credits.aspx.cs" Inherits="MFBDBO.Master.Credits" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
     <form runat="server">
        <section class="content-header">
            <h1>Credit Details</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                  <li class="#">Agents</li>
                <li class="active">Credits</li>
            </ol>
        </section>
         <section class="content">
        <div class="box">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box-body">
                        <div class="form-group row">
                            <div class="col-md-6">
              <asp:Label ID="lblName" class="control-label col-sm-3" runat="server" Text="Name"><b>Agency :</b></asp:Label>
                                <div class="col-sm-9">
          <select class="form-control select2">
                                <option>All</option>
                                   <option>Kaveri Travels</option>
                                   <option></option>
                                   <option></option>
                                   <option></option>
                            </select>
                                </div>
                            </div>
                              <div class="col-md-6">
                              <asp:Label ID="lblAC" class="control-label col-sm-3" runat="server" Text="Assign Credit"><b>Assign Credit :</b></asp:Label>
                                <div class="col-sm-9">
                            <asp:TextBox ID="txtAC" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                       
                        <div class="form-group row">
                            <div class="col-md-6">
                                 <asp:Label ID="lblDueDate" class="control-label col-sm-3" runat="server" Text="Date"><b>Due Date :</b></asp:Label>
                                <div class="col-sm-9">
                       <div class="input-group date">
                             <asp:TextBox ID="txtDueDate" type="date" CssClass="form-control" runat="server"></asp:TextBox>
                             <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                  </div>
                                   
                                </div>
                            </div>
                            <div class="col-md-6">
                              <asp:Label ID="lblName3" class="control-label col-sm-3" runat="server" Text="Name"><b>Credit Balance :</b></asp:Label>
                                <div class="col-sm-9">
                           <asp:Label ID="Label4" class="control-label col-sm-5" runat="server" Text="Name">10000 /-</asp:Label>
                                </div>
                            </div>
                        </div>

                        <div style="text-align: right">
                         <asp:Button ID="btnSave" class="btn btn-success"  runat="server" Text="Save" style="width: 90px" />
                          <asp:Button ID="btnReset" class="btn btn-danger"  runat="server" Text="Reset" style="width: 90px" />                                             
                        </div>
                        <br />
                        <!--Table-->
                           <table id="CreditList" class="table table-bordered datatable table-striped" style="width: 100%">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Transaction No</th>
                                <th>Agency</th>
                                <th>Credit Given (INR)</th>
                                <th>Transaction Date & Time</th>
                                <th>Balance Due</th>
                                <th>Due Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>10001</td>
                                <td>ATT</td>
                                <td>100000.00</td>
                                <td>25-05-2018 11.03 AM</td>
                                <td>10000.00</td>
                                <td>25-05-2018</td>
                              
                            </tr>

                        </tbody>
                    </table>

                    </div>
                </div>
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

            $('#CreditList').dataTable({
                "pageLength": 50,
                dom: 'frtip',
                responsive: true
               
            });

        </script>



    </form>
</asp:Content>
