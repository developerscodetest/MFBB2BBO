<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="MinorAccountList.aspx.cs" Inherits="MFBDBO.Master.MinorAccountList" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function alertMessage(text) {
            alert(text);
        }
    </script>
    <style>
        .hidden-bound {
            display: none;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    
        <section class="content-header">
            <h1>Minor Accounts</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">Settings</li>
                <li class="active">Minor Accounts</li>
            </ol>
        </section>
        <section class="content">
            <div class="box">
                <!--Begin 1st row-->
                <div class="box-body">
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblMajorAccount" class="control-label col-md-4" runat="server" Text="Major Account"><b>Major Account :</b>
                                <span style="color: red;">*</span>
                            </asp:Label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="DdlMajorAccount" CssClass="form-control" runat="server" AutoPostBack="True">
                                    <%--<asp:ListItem Text="--Select--" Value="0"></asp:ListItem>--%>
                                </asp:DropDownList>
                                <%--<asp:RequiredFieldValidator ID="rfvMajorAccount" runat="server" ErrorMessage="Select Major Account" ForeColor="Red" InitialValue="0" ControlToValidate="DdlMajorAccount" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblMinorAccount" class="control-label col-md-4" runat="server" Text=" Minor Account"><b> Minor Account  :</b>
                            </asp:Label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtMinorAccount" CssClass="form-control" placeholder="Enter Minor  Account" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvMAccount" runat="server" ErrorMessage="Minor Account is Required" ForeColor="Red" ControlToValidate="txtMinorAccount" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revMAccount" runat="server" ErrorMessage="enter Valid Minor Account " ForeColor="Red" ControlToValidate="txtMinorAccount" ValidationExpression="[a-zA-Z0-9 ]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>

                    <!---2nd Row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="Label2" class="control-label col-md-4" runat="server" Text="Account Code"><b>Account Code :</b>
                            </asp:Label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtMinorAccountCode" CssClass="form-control" placeholder="Enter Account Code" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvMACode" runat="server" ErrorMessage="Account Code is Required" ForeColor="Red" ControlToValidate="txtMinorAccountCode" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblAmount" class="control-label col-md-4" runat="server" Text="Amount"><b>Amount :</b>
                            </asp:Label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtAmount" CssClass="form-control" placeholder="Enter Amount" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Account Code is Required" ForeColor="Red" ControlToValidate="txtMinorAccountCode" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <!--Buttons-->
                    <div class="form-group pull-right">
                        <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" Style="width: 100px;" OnClick="btnSave_Click" />
                        <asp:Button ID="btnUpdate" class="btn btn-primary" runat="server" Text="Update" Style="width: 100px;" OnClick="btnUpdate_Click" />
                        <asp:Button ID="btnReset" class="btn btn-danger" runat="server" Text="Reset" Style="width: 100px;" OnClick="btnReset_Click" CausesValidation="false" />
                        <asp:HiddenField ID="hdnMinorAccountID" runat="server" />
                    </div>


                    <!--End 1st row--->
                    <asp:GridView ID="gdvMinorAccount" CssClass="table table-bordered dataTable table-striped" runat="server" AutoGenerateColumns="False" ShowHeader="false" OnRowDataBound="gdvMinorAccount_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="MinorAccountID" HeaderText="Account ID" ItemStyle-CssClass="hidden-bound">
                                <ItemStyle CssClass="hidden-bound"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="MajorAccountID" HeaderText="Major Account" />
                            <asp:BoundField DataField="MinorAccountName" HeaderText="Minor Account" />
                            <asp:BoundField DataField="MinorAccountCode" HeaderText="Account Code" />
                            <asp:BoundField DataField="Amount" HeaderText="Amount" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <div class="btn-group text-left">
                                        <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                        <ul class="dropdown-menu pull-right" role="menu">
                                            <li>
                                                <asp:LinkButton ID="lbtnCEdit" runat="server" Text="Edit" CausesValidation="False" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' OnClick="lbtnEdit_Click"><i class="fa fa-file-text-o"></i>Edit</asp:LinkButton>
                                            </li>
                                            <li>
                                                <asp:LinkButton ID="lbtnCMarkAsInActive" runat="server" Text="Mark As InActive" OnClick="lbtnActive_Click" CausesValidation="False" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Mark As InActive</asp:LinkButton>
                                            </li>
                                            <li>
                                                <asp:LinkButton ID="lbtnCMarkAsActive" runat="server" Text="Mark As Active" CausesValidation="False" OnClick="lbtnActive_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Mark As Active</asp:LinkButton>
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

            $("#AdminPlaceHolder_gdvMinorAccount").prepend($("<thead><tr><th class='hidden-bound'>MinorAccountID</th><th>Major Account</th><th>Minor Account</th><th>MinorAccount Code</th><th>Amount</th><th>Status</th><th>Actions</th></tr></thead>").append($(this).find("tr:first")));
            $("#AdminPlaceHolder_gdvMinorAccount").css('width', '100%');
            $("#AdminPlaceHolder_gdvMinorAccount").dataTable({
                "pageLength": 10,
                dom: 'Bfrtip',
                buttons: [
                    //{
                    //    extend: 'copy',
                    //    exportOptions: {
                    //        columns: [0, 1]
                    //    }
                    //},
                    //{
                    //    extend: 'csv',
                    //    exportOptions: {
                    //        columns: [0, 1]
                    //    }
                    //},
                    {
                        extend: 'excel',
                        exportOptions: {
                            columns: [0, 1]
                        }
                    },
                    //{
                    //    extend: 'pdf',
                    //    exportOptions: {
                    //        columns: [0, 1]
                    //    }
                    //},
                    //{
                    //    extend: 'print',
                    //    exportOptions: {
                    //        columns: [0, 1]
                    //    }
                    //}
                ]

            });

        </script>
    
</asp:Content>
