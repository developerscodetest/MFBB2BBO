<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="MFBDBO.Master.Users" EnableEventValidation="false" %>

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
            <h1>Users</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">User Management</li>
                <li class="active">Users</li>
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
                    <div>
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblRole" class="control-label col-sm-3" runat="server" Text="Label"><b>Role :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddlRole" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlRole_SelectedIndexChanged">
                                        <asp:ListItem Enabled="true" Text="--Select--" Value="0"></asp:ListItem>
                                        <%--<asp:ListItem Enabled="true" Text="1" ></asp:ListItem>
                                        <asp:ListItem Enabled="true" Text="2" ></asp:ListItem>   --%>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvRole" runat="server" ErrorMessage="Select Role Name" InitialValue="0" ForeColor="Red" ControlToValidate="ddlRole" Display="Dynamic"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblName" class="control-label col-sm-3" runat="server" Text="Label"><b>Name :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddlName" CssClass="form-control" runat="server" AutoPostBack="True">
                                        <asp:ListItem Enabled="true" Text="--Select--" Value="0"></asp:ListItem>
                                        <%--<asp:ListItem Enabled="true" Text="1" ></asp:ListItem>
                                        <asp:ListItem Enabled="true" Text="2" ></asp:ListItem>   --%>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Select Name" InitialValue="0" ForeColor="Red" ControlToValidate="ddlName" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblUserName" class="control-label col-sm-3" runat="server" Text="Username"><b>Username :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtUserName" class="form-control" placeholder="Enter Username" runat="server"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="rfvUN" runat="server" ErrorMessage="Username is Required" ForeColor="Red" ControlToValidate="txtUserName"  Display="Dynamic"></asp:RequiredFieldValidator>
                                 <%--<asp:RegularExpressionValidator ID="revUN" runat="server" ErrorMessage="Username Must be Alphabets" ForeColor="Red" ControlToValidate="txtUserName" ValidationExpression="^[a-zA-Z'.\s]{1,100}$" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblPassword" class="control-label col-sm-3" runat="server" Text="Password"><b>Password :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtPassword" class="form-control" placeholder="Enter Password" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPswd" runat="server" ErrorMessage="Password is Required" ForeColor="Red" ControlToValidate="txtPassword" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <%--<asp:RegularExpressionValidator ID="revPswd" runat="server" ErrorMessage="Enter Valid Password" ForeColor="Red" ControlToValidate="txtPassword" ValidationExpression="[a-zA-Z 0-9@_#!$& ]*$" Display="Dynamic"></asp:RegularExpressionValidator> --%>
                                </div>
                            </div>
                        </div>

                        <div class="form-group pull-right">
                            <asp:Button ID="btnSave" class="btn btn-success" runat="server" Text="Save" Style="width: 100px;" OnClick="btnSave_Click" />
                            <asp:Button ID="btnUpdate" class="btn btn-primary" runat="server" Text="Update" Style="width: 100px;" OnClick="btnUpdate_Click" />
                            <asp:Button ID="btnReset" class="btn btn-danger" runat="server" Text="Reset" Style="width: 100px;" CausesValidation="False" OnClick="btnReset_Click" />

                            <asp:HiddenField ID="hdnUsersId" runat="server" />
                            <asp:HiddenField ID="hdnStatus" runat="server" />

                        </div>

                    </div>
                    <!--2nd row--->

                    <asp:GridView ID="gdvUsers" CssClass="table table-bordered datatable table-striped" ShowHeader="false" runat="server" AutoGenerateColumns="False" OnRowDataBound="gdvUsers_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="UserID" HeaderText="UsersId" ItemStyle-CssClass="hidden-bound">
                                <ItemStyle CssClass="hidden-bound"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="RoleID" HeaderText="RoleId" />
                            <asp:BoundField DataField="LoginUserId" HeaderText="Name" />
                            <asp:BoundField DataField="Username" HeaderText="User Name" />
                            <asp:BoundField DataField="Password" HeaderText="Password" ItemStyle-CssClass="hidden-bound" />
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
                                                <asp:LinkButton ID="lbtnLMarkAsInActive" runat="server" Text="MarkAsInActive" CausesValidation="False" OnClick="lbtnLMarkAsActive_Click"><i class="fa fa-file-text-o"></i>MarkAs InActive</asp:LinkButton>

                                            </li>
                                            <li>
                                                <asp:LinkButton ID="lbtnLMarkAsActive" runat="server" Text="MarkAsActive" OnClick="lbtnLMarkAsActive_Click" CausesValidation="False"><i class="fa fa-file-text-o"></i>MarkAs Active</asp:LinkButton>

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

            $("#AdminPlaceHolder_gdvUsers").prepend($("<thead><tr><th class='hidden-bound'>UserId</th><th>Role</th><th>Name</th><th>User Name</th><th  class='hidden-bound'>Password</th><th>Status</th><th>Actions</th></tr></thead>").append($(this).find("tr:first")));
            $("#AdminPlaceHolder_gdvUsers").css('width', '100%');
            $("#AdminPlaceHolder_gdvUsers").dataTable({
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
