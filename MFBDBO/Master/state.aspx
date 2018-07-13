<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="state.aspx.cs" Inherits="MFBDBO.Master.state" EnableEventValidation="false" %>

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
            <h1>State</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">Settings</li>
                <li class="active">State</li>
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
                                <asp:Label ID="lblDepartment" class="control-label col-sm-4" runat="server" Text="Department"><b>Country :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="DDlCountry" CssClass="form-control" runat="server" AutoPostBack="True">
                                        <asp:ListItem>--Select--</asp:ListItem>
                                        
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ErrorMessage="Select Country Name" ForeColor="Red" ControlToValidate="DDlCountry" InitialValue="--Select--" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblState" class="control-label col-sm-4" runat="server" Text="State"><b>State :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtState" class="form-control" placeholder="Enter State" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="State Name is Required" ForeColor="Red" ControlToValidate="txtState" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revState" runat="server" ErrorMessage="State Name Must be Alphabets" ForeColor="Red" ControlToValidate="txtState" ValidationExpression="^[a-zA-Z'.\s]{1,100}$" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>

                        <div>
                            <div class="form-group pull-right">
                                <asp:Button ID="btnSave" class="btn btn-success" runat="server" Text="Save" Style="width: 100px;" OnClick="btnSave_Click" />                              
                                <asp:Button ID="btnUpdate" class="btn btn-primary" runat="server" Text="Update" Style="width: 100px;" OnClick="btnUpdate_Click" />
                                <asp:Button ID="btnReset" class="btn btn-danger" runat="server" Text="Reset" CausesValidation="false" Style="width: 100px;" OnClick="btnReset_Click1" />
                                <asp:HiddenField ID="hdnStateID" runat="server" />

                            </div>
                        </div>

                    </div>
                    <!--2nd row--->
                    <asp:GridView ID="gdvState" CssClass="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" ShowHeader="false" OnRowDataBound="gdvState_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="StateID" HeaderText="State ID" ItemStyle-CssClass="hidden-bound" />
                                <asp:BoundField DataField="CountryID" HeaderText="Country" />
                                <asp:BoundField DataField="StateName" HeaderText="State Name" />
                                <asp:BoundField DataField="IsActive" HeaderText="Status" />
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li>
                                                    <asp:LinkButton ID="lbtnEdit" runat="server" Text="Edit" CausesValidation="False" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' OnClick="lbtnEdit_Click" ><i class="fa fa-file-text-o"></i>Edit</asp:LinkButton>
                                                </li>
                                                <li>
                                                    <asp:LinkButton ID="lbtnActive" runat="server" Text="Active" CausesValidation="False" OnClick="lbtnActive_Click" ><i class="fa fa-file-text-o"></i>Active</asp:LinkButton>
                                                </li>
                                                 <li>
                                                    <asp:LinkButton ID="lbtnInActive" runat="server" Text="InActive" CausesValidation="False" OnClick="lbtnActive_Click" ><i class="fa fa-file-text-o"></i>InActive</asp:LinkButton>
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
            $("#AdminPlaceHolder_gdvState").prepend($("<thead><tr><th class='hidden-bound'>StateID</th><th>Country</th><th>State Name</th><th>Status</th><th>Actions</th></tr></thead>").append($(this).find("tr:first")));
            $("#AdminPlaceHolder_gdvState").css('width', '100%');
            $("#AdminPlaceHolder_gdvState").dataTable({
                "pageLength": 10,
                dom: 'Bfrtip',
                buttons: [
                    //{
                    //    extend: 'copy',
                    //    exportOptions: {
                    //        columns: [0, 1, 2, 3]
                    //    }
                    //},
                    //{
                    //    extend: 'csv',
                    //    exportOptions: {
                    //        columns: [0, 1, 2, 3]
                    //    }
                    //},
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
                    //{
                    //    extend: 'print',
                    //    exportOptions: {
                    //        columns: [0, 1, 2, 3]
                    //    }
                    //},

                ]

            });           
        </script>
    

</asp:Content>
