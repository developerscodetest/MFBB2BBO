<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="IssuesList.aspx.cs" Inherits="MFBDBO.Master.IssuesList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .hidden-bound {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    
        <section class="content-header">
            <h1>Issues List</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Issues List</li>
            </ol>
        </section>
        <section class="content">
        <div class="box">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box-body">
                        <div class="form-group pull-right">
                      <asp:Button ID="btnNewIssue" CssClass="btn btn-primary" PostBackUrl="Issues.aspx"  runat="server" Text="New Issue" />
                        </div>
                        <asp:GridView ID="gdvIssues" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" OnRowDataBound="gdvIssues_RowDataBound" ShowHeader="False">
                            <Columns>
                                <asp:BoundField DataField="IssuesId" HeaderText="IssuesId" ItemStyle-CssClass="hidden-bound" >
                                    <ItemStyle CssClass="hidden-bound"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="BookingID" HeaderText="Booking ID" />
                                <asp:BoundField DataField="Issue" HeaderText="Issue" />
                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                                <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
                                <asp:BoundField DataField="AssignToEmployee" HeaderText="Assign To Employee" SortExpression="AssignToEmployee" />
                                <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" ItemStyle-CssClass="hidden-bound" />
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li>
                                                    <asp:LinkButton ID="lbtnView" runat="server" Text="View" CausesValidation="False" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' OnClick="lbtnView_Click" ><i class="fa fa-file-text-o"></i>View</asp:LinkButton>
                                                </li>                                                
                                            </ul>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>
                     
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

            $("#AdminPlaceHolder_gdvIssues").prepend($("<thead><tr><th class='hidden-bound'>IssuesID</th><th>BookingID</th><th>Issue</th><th>Status</th><th>Priority</th><th>Assign To Employee</th><th  class='hidden-bound'>Note</th><th>Actions</th></tr></thead>").append($(this).find("tr:first")));
            $("#AdminPlaceHolder_gdvIssues").css('width', '100%');
            $("#AdminPlaceHolder_gdvIssues").dataTable({
                "pageLength": 50,
                dom: 'Bfrtip',
                buttons: [
                    //{
                    //    extend: 'copy',
                    //    exportOptions: {
                    //        columns: [0, 1, 2, 3, 4, 5]
                    //    }
                    //},
                    //{
                    //    extend: 'csv',
                    //    exportOptions: {
                    //        columns: [0, 1, 2, 3, 4, 5]
                    //    }
                    //},
                    {
                        extend: 'excel',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5]
                        }
                    },
                    //{
                    //    extend: 'pdf',
                    //    exportOptions: {
                    //        columns: [0, 1, 2, 3, 4, 5]
                    //    }
                    //},
                    //{
                    //    extend: 'print',
                    //    exportOptions: {
                    //        columns: [0, 1, 2, 3, 4, 5]
                    //    }
                    //},

                ]
            });

        </script>


      
</asp:Content>
