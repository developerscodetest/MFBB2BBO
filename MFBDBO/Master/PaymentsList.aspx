<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="PaymentsList.aspx.cs" Inherits="MFBDBO.Master.PaymentsList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .hidden-bound {
            display: none;
        }
    </style>
    <script type="text/javascript">
        function alertMessage(text) {
            alert(text);
        }
      </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    
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
                            <asp:Button ID="btnAP" PostBackUrl="PreparePayments.aspx" class="btn btn-primary" runat="server" Text="Add Payment" />
                        </div>
                  
                    <!--2nd Row-->

                    <!--Table-->
                    <!--Table-->
                    <%--<table id="paymentList" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Voucher No</th>
                                <th>Date</th>
                                <th>Payment Type</th>
                                <th>Actions</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>PAY-319717</td>
                               <td>25-06-2018</td>
                                <td>Against Purchase</td>
                                <td>
                                    <div class="btn-group text-left">
                                        <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                        <ul class="dropdown-menu pull-right" role="menu">
                                             <li><a href=""><i class="fa fa-edit"></i>Edit</a></li>
                                            <li><a href=""><i class="fa fa-eye"></i>View</a></li>
                                        </ul>
                                    </div>
                                </td>
                        </tbody>
                    </table>--%>

                    <asp:GridView ID="gdvAccPayments" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="False"  ShowHeader="False" OnRowDataBound="GdvAccPayments_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="PaymentID" HeaderText="PaymentID" ItemStyle-CssClass="hidden-bound" >
                                    <ItemStyle CssClass="hidden-bound"></ItemStyle>
                                </asp:BoundField>     
                                <asp:BoundField DataField="VoucherNo" HeaderText="Voucher No" />
                                <asp:BoundField DataField="ToAccount" HeaderText="Paid To" />
                                <asp:BoundField DataField="PaymentDate" HeaderText="Date" /> 
                                <asp:BoundField DataField="PaymentThrough" HeaderText="Payment Through" /> 
                                <asp:BoundField DataField="PayingAmount" HeaderText="Paying Amount" />
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li>
                                                    <asp:LinkButton ID="lbtnPEdit" runat="server" Text="Edit"  OnClick="lbtnPEdit_Click" CausesValidation="False" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Edit</asp:LinkButton>                                                        
                                                    <%--<asp:Button ID="btnBack" class="btn btn-danger" PostBackUrl="SuppliersList.aspx" runat="server" Text="Back" style="width: 90px" />--%>
                                                </li>
                                                <li>
                                                    <asp:LinkButton ID="lbtnPView" runat="server"  Text="View" OnClick="lbtnPView_Click" CausesValidation="False" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'  ><i class="fa fa-file-text-o"></i>View</asp:LinkButton>
                                                </li>                                                    
                                               <%-- <li>
                                                    <asp:LinkButton ID="lbtnPMarkAsInActive" runat="server" OnClick="lbtnPMarkAsActive_Click" Text="Mark As InActive"  CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Mark As InActive</asp:LinkButton>
                                                </li>
                                                <li>
                                                    <asp:LinkButton ID="lbtnPMarkAsActive" runat="server" OnClick="lbtnPMarkAsActive_Click"  Text="Mark As Active"  CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Mark As Active</asp:LinkButton>
                                                </li>    --%>                                            
                                            </ul>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

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

            $("#AdminPlaceHolder_gdvAccPayments").prepend($("<thead><tr><th class='hidden-bound'>PaymentID</th><th>Voucher No</th><th>Paid To</th><th>Date</th><th>Payment Through</th><th>Paying Amount</th><th>Actions</th></tr></thead>").append($(this).find("tr:first")));
            $("#AdminPlaceHolder_gdvAccPayments").css('width', '100%');
            $("#AdminPlaceHolder_gdvAccPayments").dataTable({
                "pageLength": 10,
                dom: 'Bfrtip',

                //buttons: [
                //    'copy', 'csv', 'excel', 'pdf', 'print'
                //]
                buttons: [
                    //{
                    //    extend: 'copy',
                    //    exportOptions: {
                    //        columns: [0, 1, 2, 3, 4]
                    //    }
                    //},
                    //{
                    //    extend: 'csv',
                    //    exportOptions: {
                    //        columns: [0, 1, 2, 3, 4]
                    //    }
                    //},
                    {
                        extend: 'excel',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4]
                        }
                    },
                    //{
                    //    extend: 'pdf',
                    //    exportOptions: {
                    //        columns: [0, 1, 2, 3, 4]
                    //    }
                    //},
                    //{
                    //    extend: 'print',
                    //    exportOptions: {
                    //        columns: [0, 1, 2, 3, 4]
                    //    }
                    //}
                ]
               
            });

        </script>

    
</asp:Content>
