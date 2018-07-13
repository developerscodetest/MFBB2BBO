<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="ReceiptsList.aspx.cs" Inherits="MFBDBO.Master.ReceiptsList" %>
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
            <h1>Receipts List</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">Accounts</li>
                <li class="active">Receipts List</li>
            </ol>
        </section>

        <section class="content">
            <div class="box">
                <!-- /.box-body -->
                <div class="box-body">
                    <div class="form-group pull-right">
               <asp:Button ID="btnPAReceipt" PostBackUrl="Receipts.aspx" CssClass="btn btn-primary"  runat="server" Text="Prepare A Receipt"  />
                    </div>
                    <%--<table id="Receipts" class="table table-bordered datatable table-striped" style="width: 100%">
                        <thead>
                            <tr>
                                <th>Transaction ID</th>
                                <th>Date</th>
                                <th>Voucher No</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>4563217895</td>
                                <td>20-06-2018</td>
                                <td>VCH2017</td>
                                <td>Pending</td>
                                <td>
                                    <div class="btn-group text-left">
                                        <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                        <ul class="dropdown-menu pull-right" role="menu">
                                            <li><a href="#"><i class="fa fa-edit"></i>Edit</a></li>
                                            <li><a href="#"><i class="fa fa-eye"></i>View</a></li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>

                        </tbody>
                    </table>--%>

                    <asp:GridView ID="gdvAccReceipts" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="False"  ShowHeader="False" OnRowDataBound="GdvAccReceipts_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="ReceiptID" HeaderText="ReceiptID" ItemStyle-CssClass="hidden-bound" >
                                    <ItemStyle CssClass="hidden-bound"></ItemStyle>
                                </asp:BoundField>     
                                <asp:BoundField DataField="VoucherNo" HeaderText="Voucher No" />
                                <asp:BoundField DataField="FromAccount" HeaderText="Received From" />
                                <asp:BoundField DataField="ReceiveDate" HeaderText="Date" />                                
                                <asp:BoundField DataField="ReceivedThrough" HeaderText="Received Through" />
                                <asp:BoundField DataField="ReceivingAmount" HeaderText="Receiving Amount" />
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li>
                                                    <asp:LinkButton ID="lbtnREdit" runat="server" Text="Edit" OnClick="lbtnREdit_Click" CausesValidation="False" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Edit</asp:LinkButton>                                                        
                                                    <%--<asp:Button ID="btnBack" class="btn btn-danger" PostBackUrl="SuppliersList.aspx" runat="server" Text="Back" style="width: 90px" />--%>
                                                </li>
                                                <li>
                                                    <asp:LinkButton ID="lbtnRView" runat="server" OnClick="lbtnRView_Click" Text="View" CausesValidation="False" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'  ><i class="fa fa-file-text-o"></i>View</asp:LinkButton>
                                                </li>                                                    
                                                <%--<li>
                                                    <asp:LinkButton ID="lbtnRMarkAsInActive" runat="server" OnClick="lbtnRMarkAsActive_Click" Text="Mark As InActive"  CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Mark As InActive</asp:LinkButton>
                                                </li>
                                                <li>
                                                    <asp:LinkButton ID="lbtnRMarkAsActive" runat="server"  OnClick="lbtnRMarkAsActive_Click" Text="Mark As Active"  CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Mark As Active</asp:LinkButton>
                                                </li>--%>                                                
                                            </ul>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>


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

            $("#AdminPlaceHolder_gdvAccReceipts").prepend($("<thead><tr><th class='hidden-bound'>ReceiptID</th><th>Voucher No</th><th>Received From</th><th>Date</th><th>Received Through</th><th>Receiving Amount</th><th>Actions</th></tr></thead>").append($(this).find("tr:first")));
            $("#AdminPlaceHolder_gdvAccReceipts").css('width', '100%');
            $("#AdminPlaceHolder_gdvAccReceipts").dataTable({
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
