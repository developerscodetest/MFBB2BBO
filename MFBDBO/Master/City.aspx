<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="City.aspx.cs" EnableEventValidation="false" Inherits="MFBDBO.Master.City" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function alertMessage(text) {
            alert(text);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    <form runat="server">
        <section class="content-header">
            <h1>City</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">Settings</li>
                <li class="active">CCity</li>
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
                    <form>
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="Label1" class="control-label col-sm-3" runat="server" Text="Country"><b>Country :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddlCountry" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" AutoPostBack="True">
                                        <asp:ListItem Enabled="true" Text="--Select--"></asp:ListItem>
                                        <%--<asp:ListItem Enabled="true" Text="1" ></asp:ListItem>
                                        <asp:ListItem Enabled="true" Text="2" ></asp:ListItem>   --%>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ErrorMessage="Select Country" ForeColor="Red" ControlToValidate="ddlCountry" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblState" class="control-label col-sm-3" runat="server" Text="State"><b>State :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddlState" CssClass="form-control" runat="server" AutoPostBack="True">
                                        <asp:ListItem Enabled="true" Text="--Select--" Value="0"></asp:ListItem>
                                        <%--<asp:ListItem Enabled="true" Text="ap"  Value="1"></asp:ListItem>
                                        <asp:ListItem Enabled="true" Text="MP" Value="2" ></asp:ListItem>    --%>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="Select State" ForeColor="Red" ControlToValidate="ddlState" Display="Dynamic"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblCity" class="control-label col-sm-3" runat="server" Text="City"><b>City :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtCity" class="form-control" placeholder="Enter City" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="City Name is Required" ForeColor="Red" ControlToValidate="txtCity" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revCity" runat="server" ErrorMessage="City Name Must be Alphabets" ForeColor="Red" ControlToValidate="txtCity" ValidationExpression="^[a-zA-Z'.\s]{1,100}$" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>

                        <div class="form-group pull-right">
                            <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" Style="width: 100px;" OnClick="btnSave_Click1" />
                            <asp:Button ID="btnReset" class="btn btn-danger" runat="server" CausesValidation="false" Text="Reset" Style="width: 100px;" OnClick="btnReset_Click" />
                            <asp:Button ID="btnUpdate" class="btn btn-danger" runat="server" Text="Update" Style="width: 100px;" OnClick="btnUpdate_Click" />
                            <asp:HiddenField ID="hdnCityID" runat="server" />
                        </div>
                    </form>
                    <!--2nd row--->
                    <asp:GridView ID="gdvCity" CssClass="table table-bordered datatable table-striped" runat="server" AutoGenerateColumns="False" OnRowDataBound="gdvcity_RowDataBound" >
                        <Columns>
                            <asp:BoundField DataField="CityID" HeaderText="City ID" ItemStyle-CssClass="hidden-bound">
                                <ItemStyle CssClass="hidden-bound"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="StateID" HeaderText="State Name" />

                            <asp:BoundField DataField="CityName" HeaderText="City Name" />

                            <asp:BoundField DataField="IsActive" HeaderText="Status" />

                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <div class="btn-group text-left">
                                        <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                        <ul class="dropdown-menu pull-right" role="menu">
                                            <li>
                                                <asp:LinkButton ID="lbtnLEdit" runat="server" Text="Edit" CausesValidation="False"
                                                    CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' OnClick="lbtnLEdit_Click"><i class="fa fa-file-text-o"></i>Edit</asp:LinkButton>
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

            $("#AdminPlaceHolder_gdvCity").prepend($("<thead><tr><th class='hidden-bound'>CityID</th><th>State Name</th><th>City Name</th><th>Status</th><th>Actions</th></tr></thead>").append($(this).find("tr:first")));
            $("#AdminPlaceHolder_gdvCity").css('width', '100%');
            $("#AdminPlaceHolder_gdvCity").dataTable({
                "pageLength": 50,
                dom: 'Bfrtip',
                buttons: [
                    {
                        extend: 'copy',
                        exportOptions: {
                            columns: [0, 1, 2, 3]
                        }
                    },
                    {
                        extend: 'csv',
                        exportOptions: {
                            columns: [0, 1, 2, 3]
                        }
                    },
                    {
                        extend: 'excel',
                        exportOptions: {
                            columns: [0, 1, 2, 3]
                        }
                    },
                    {
                        extend: 'pdf',
                        exportOptions: {
                            columns: [0, 1, 2, 3]
                        }
                    },
                    {
                        extend: 'print',
                        exportOptions: {
                            columns: [0, 1, 2, 3]
                        }
                    },

                ]
            });

        </script>




    </form>



</asp:Content>
