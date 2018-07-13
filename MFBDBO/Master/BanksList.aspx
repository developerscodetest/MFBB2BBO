<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="BanksList.aspx.cs" Inherits="MFBDBO.Master.BanksList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .hidden-bound {
            display:none;
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
            <h1>Banks List</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">Accounts</li>
                 <li class="active">Banks List</li>
            </ol>
        </section>
        <section class="content">
             <div class="box">
            <div class="box-body">
                <div class="form-group pull-right">
                           
               <asp:Button ID="btnBank" CssClass="btn btn-primary" runat="server" Text="Add Bank" OnClick="btnBank_Click"  />
                    </div>
            <asp:HiddenField ID="hdnBankID" runat="server" />
     <asp:GridView ID="gdvBank" CssClass="table table-bordered datatable table-striped"  ShowHeaderWhenEmpty="true" runat="server"  ShowHeader="false" EmptyDataText="No records found." AutoGenerateColumns="False" OnRowDataBound="gdvBank_RowDataBound" >
                        <Columns>
                            <asp:BoundField DataField="BankID" HeaderText="Bank ID" ItemStyle-CssClass="hidden-bound">
                                <ItemStyle CssClass="hidden-bound"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="BankName" HeaderText="Bank Name" />

                            <asp:BoundField DataField="Branch" HeaderText="Branch" />
                            <asp:BoundField DataField="AccountNumber" HeaderText="Account Number" />
                            <asp:BoundField DataField="AccountName" HeaderText="Account Name" />
                            <asp:BoundField DataField="IfscCode" HeaderText="Ifsc Code " />
                              <asp:BoundField DataField="Type" HeaderText="Type" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />

                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <div class="btn-group text-left">
                                        <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                        <ul class="dropdown-menu pull-right" role="menu">
                                            <li>
                                                <asp:LinkButton ID="lbtnLEdit" runat="server" Text="Edit" CausesValidation="False"
                                                    CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                                     OnClick="lbtnLEdit_Click"><i class="fa fa-file-text-o"></i>Edit</asp:LinkButton>
                                            </li>
                                            <li>
                                                <asp:LinkButton ID="lbtnLMarkAsInActive" runat="server" Text="MarkAs InActive" CausesValidation="False" OnClick="lbtnLMarkAsActive_Click"><i class="fa fa-file-text-o"></i>MarkAs InActive</asp:LinkButton>

                                            </li>
                                            <li>
                                                <asp:LinkButton ID="lbtnLMarkAsActive" runat="server" Text="MarkAs Active" OnClick="lbtnLMarkAsActive_Click" CausesValidation="False"><i class="fa fa-file-text-o"></i>MarkAs Active</asp:LinkButton>

                                            </li>
                                        </ul>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
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

            
            $("#AdminPlaceHolder_gdvBank").prepend($("<thead><tr><th class='hidden-bound'>BankID</th><th>Bank Name</th><th>Branch</th><th>Account Number</th><th>Account Name</th><th>Ifsc Code</th><th>Type</th><th>Status</th><th>Actions</th></tr></thead>").append($(this).find("tr:first")));
            $("#AdminPlaceHolder_gdvBank").css('width', '100%');
            $("#AdminPlaceHolder_gdvBank").dataTable({
                "pageLength": 10,
                dom: 'Bfrtip',
                buttons: [
                    
                    {
                        extend: 'excel',
                        exportOptions: {
                            columns: [0, 1, 2, 3]
                        }
                    },
                   
                ]
            });


        </script>

</asp:Content>
