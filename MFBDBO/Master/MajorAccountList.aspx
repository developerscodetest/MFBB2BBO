<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="MajorAccountList.aspx.cs" Inherits="MFBDBO.Master.MajorAccountList" %>

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
            <h1>Major Accounts</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">Settings</li>
                <li class="active">Major Accounts</li>
            </ol>
        </section>
        <section class="content">
            <div class="box box-body">
                <!--Begin 1st row-->
                <div>
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblAccountName" class="control-label col-md-4" runat="server" Text="Account Name"><b>Account Name :</b>
                            <span style="color: red;">*</span>
                            </asp:Label>
                            <div class="col-md-8">
                                
                                <asp:TextBox ID="TxtMAName" CssClass="form-control" placeholder="Enter Account Name" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="rfvMAname" runat="server" ErrorMessage="Account Name is Required" ForeColor="Red" ControlToValidate="TxtMAName" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revMAName" runat="server" ErrorMessage="Account Name Must be Alphabets" ForeColor="Red" ControlToValidate="TxtMAName" ValidationExpression="^[a-zA-Z'.\s]{1,100}$" Display="Dynamic"></asp:RegularExpressionValidator>
                                 </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblAccountCode" class="control-label col-md-4" runat="server" Text="Account Code"><b>Account Code :</b>
                            </asp:Label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtMACode" CssClass="form-control" placeholder="Enter Account Code" runat="server"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="rfvMACode" runat="server" ErrorMessage="Account Code is Required" ForeColor="Red" ControlToValidate="txtMACode" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="form-group pull-right">
                        <asp:Button ID="btnSave" class="btn btn-primary" runat="server"   Text="Save" Style="width: 100px;" OnClick="btnSave_Click" />
                        <asp:Button ID="btnUpdate" class="btn btn-primary" runat="server" Text="Update" Style="width: 100px;" OnClick="btnUpdate_Click" />
                        <asp:Button ID="btnReset" class="btn btn-danger" runat="server" Text="Reset" Style="width: 100px;" OnClick="btnReset_Click" CausesValidation ="false" />
                        <asp:HiddenField ID="hdnMajorAccountID" runat="server" />
                        <asp:HiddenField ID="hdnStatus" runat="server" />
                    </div>

                </div>

                <!--End 1st row--->
               
                <asp:GridView ID="gdvAccount" CssClass="table table-bordered datatable table-striped" runat="server" ShowHeader ="false" AutoGenerateColumns="False" OnRowDataBound="gdvAccount_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="MajorAccountID" HeaderText="Account ID" ItemStyle-CssClass="hidden-bound">
                            <ItemStyle CssClass="hidden-bound"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="MajorAccountName" HeaderText="Account Name" />

                        <asp:BoundField DataField="MajorAccountCode" HeaderText="Account Code" />
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
                                            <asp:LinkButton ID="lbtnLMarkAsInActive" runat="server" Text="MarkAsInActive" CausesValidation="False" OnClick="lbtnLMarkAsActive_Click"><i class="fa fa-file-text-o"></i>MarkAsInActive</asp:LinkButton>

                                        </li>
                                        <li>
                                            <asp:LinkButton ID="lbtnLMarkAsActive" runat="server" Text="MarkAsActive" OnClick="lbtnLMarkAsActive_Click" CausesValidation="False"><i class="fa fa-file-text-o"></i>MarkAsActive</asp:LinkButton>

                                        </li>
                                    </ul>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>



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

            $('#MajorAccount').dataTable({
                "pageLength": 50,
                dom: 'frtip',
                responsive: true

            });

            $("#AdminPlaceHolder_gdvAccount").prepend($("<thead><tr><th class='hidden-bound'>AccountID</th><th>Account Name</th><th>Account Code</th><th>Status</th><th>Actions</th></tr></thead>").append($(this).find("tr:first")));
            $("#AdminPlaceHolder_gdvAccount").css('width', '100%');
            $("#AdminPlaceHolder_gdvAccount").dataTable({
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
