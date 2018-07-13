<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Department.aspx.cs" Inherits="MFBDBO.Master.InactiveHRM" %>

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
            <h1>Department</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">HRM</li>
                <li class="active">Department</li>
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
                                <asp:Label ID="lblDepartment" class="control-label col-sm-4" runat="server" Text="Label"><b>Department :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtDepartment" class="form-control" placeholder="Enter Department" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvDept" runat="server" ErrorMessage="Department Name is Required" ForeColor="Red" ControlToValidate="txtDepartment" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revDept" runat="server" ErrorMessage="Department Name Must be Alphabets" ForeColor="Red" ControlToValidate="txtDepartment" ValidationExpression="^[a-zA-Z'.\s]{1,100}$" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-md-3 col-md-offset-3">
                                <div class="form-group pull-right">
                                    <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" Style="width: 100px;" OnClick="btnSave_Click" />
                                    <asp:Button ID="btnUpdate" class="btn btn-primary" runat="server" Text="Update" Style="width: 100px;" OnClick="btnUpdate_Click" />
                                    <asp:Button ID="btnReset" class="btn btn-danger" runat="server" Text="Reset" Style="width: 100px;" CausesValidation="False" OnClick="btnReset_Click" />
                                    <asp:HiddenField ID="hdnDepartmentId" runat="server" />
                                    <asp:HiddenField ID="hdnStatus" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--2nd row--->

                    <asp:GridView ID="gdvDeparment" CssClass="table table-bordered dataTable table-striped" runat="server" AutoGenerateColumns="False" ShowHeader="false" OnRowDataBound="gdvDeparment_RowDataBound1">
                        <Columns>
                            <asp:BoundField DataField="DepartmentId" HeaderText="DepartmentId" ItemStyle-CssClass="hidden-bound" />
                            <asp:BoundField DataField="DepartmentName" HeaderText="DepartmentName" />
                            <asp:BoundField DataField="IsActive" HeaderText="IsActive" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <div class="btn-group text-left">
                                        <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                        <ul class="dropdown-menu pull-right" role="menu">
                                            <li>
                                                <asp:LinkButton ID="lbtnCEdit" runat="server" Text="Edit" CausesValidation="False" OnClick="lbtnCEdit_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Edit</asp:LinkButton>
                                                <%-- <asp:LinkButton ID="lbtnLEdit" runat="server" Text="Edit" CausesValidation="False" OnClick="lbtnLEdit_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Edit</asp:LinkButton>--%>
                                            </li>
                                            <li>
                                                <asp:LinkButton ID="lbtnCMarkAsInActive" runat="server" Text="Mark As InActive" CausesValidation="False" OnClick="lbtnCMarkAsActive_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Mark As InActive</asp:LinkButton>
                                            </li>
                                            <li>
                                                <asp:LinkButton ID="lbtnCMarkAsActive" runat="server" Text="Mark As Active" CausesValidation="False" OnClick="lbtnCMarkAsActive_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Mark As Active</asp:LinkButton>
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

            $("#AdminPlaceHolder_gdvDeparment").prepend($("<thead><tr><th class='hidden-bound'>DepartmentId</th><th>Department</th><th>Status</th><th>Actions</th></tr></thead>").append($(this).find("tr:first")));
            $("#AdminPlaceHolder_gdvDeparment").css('width', '100%');
            $("#AdminPlaceHolder_gdvDeparment").dataTable({
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
