<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="Role.aspx.cs" Inherits="MFBDBO.Master.Role" EnableEventValidation="false" %>

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
            <h1>Role</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">User Management</li>
                <li class="active">Role</li>
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
                    
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblDepartment" class="control-label col-sm-3" runat="server" Text="Label"><b>Role :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtRole" class="form-control" placeholder="Enter Role " runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvRole" runat="server" ErrorMessage="Role Name is Required" ForeColor="Red" ControlToValidate="txtRole" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revRole" runat="server" ErrorMessage="Role Name Must be Alphabets" ForeColor="Red" ControlToValidate="txtRole" ValidationExpression="^[a-zA-Z'.\s]{1,100}$" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-md-3 col-md-offset-3">
                                <div class="form-group pull-right">
                                    <asp:Button ID="btnSave" class="btn btn-success" runat="server" Text="Save" Style="width: 100px;" OnClick="btnSave_Click" />
                                    <asp:Button ID="btnUpdate" class="btn btn-primary" runat="server" Text="Update" Style="width: 100px;" OnClick="btnUpdate_Click" />
                                    <asp:Button ID="btnReset" class="btn btn-danger" runat="server" Text="Reset" Style="width: 100px;" CausesValidation="False" OnClick="btnReset_Click" />
                                    <asp:HiddenField ID="hdnRoleId" runat="server" />
                                </div>
                            </div>
                        </div>
                    
                    <!--2nd row--->
                    <asp:GridView ID="gdvRole" CssClass="table table-bordered dataTable table-striped" runat="server" AutoGenerateColumns="False" ShowHeader="false" OnRowDataBound="gdvRole_RowDataBound1">
                        <Columns>
                            <asp:BoundField DataField="RoleId" HeaderText="RoleId" ItemStyle-CssClass="hidden-bound" />
                            <asp:BoundField DataField="RoleName" HeaderText="RoleName" />
                            <asp:BoundField DataField="IsActive" HeaderText="IsActive" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <div class="btn-group text-left">
                                        <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                        <ul class="dropdown-menu pull-right" role="menu">
                                            <li>
                                                <asp:LinkButton ID="lbtnCEdit" runat="server" Text="Edit" CausesValidation="False" OnClick="lbtnCEdit_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-pencil"></i>Edit</asp:LinkButton>
                                                <%-- <asp:LinkButton ID="lbtnLEdit" runat="server" Text="Edit" CausesValidation="False" OnClick="lbtnLEdit_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Edit</asp:LinkButton>--%>
                                            </li>
                                            <li>
                                                <asp:LinkButton ID="lbtnCMarkAsActive" runat="server" Text="Mark As Active" CausesValidation="False" OnClick="lbtnCMarkAsActive_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-check"></i>Mark As Active</asp:LinkButton>
                                            </li>
                                            <li>
                                                <asp:LinkButton ID="lbtnCMarkAsInActive" runat="server" Text="Mark As InActive" CausesValidation="False" OnClick="lbtnCMarkAsActive_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-close"></i>Mark As InActive</asp:LinkButton>
                                            </li>

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

            $("#AdminPlaceHolder_gdvRole").prepend($("<thead><tr><th class='hidden-bound'>RoleId</th><th>RoleName</th><th>Status</th><th>Actions</th></tr></thead>").append($(this).find("tr:first")));
            $("#AdminPlaceHolder_gdvRole").css('width', '100%');
            $("#AdminPlaceHolder_gdvRole").dataTable({
                "pageLength": 50,
                dom: 'Bfrtip',
                buttons: [
                   
                    {
                        extend: 'excel',
                        exportOptions: {
                            columns: [0, 1]
                        }
                    },
                    
                ]

            });

        </script>

    

</asp:Content>
