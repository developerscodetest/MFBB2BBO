<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="FinancialYearList.aspx.cs" Inherits="MFBDBO.Master.FinancialYearList" %>

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
            <h1>Financial Year List</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">Settings</li>
                <li class="active">Financial Year List</li>
            </ol>
        </section>
        <section class="content">
            <div class="box box-body">
                <!--Begin 1st row-->
                <div class="form-group row">
                    <div class="col-md-6">
                        <asp:Label ID="lblFromYear" class="control-label col-sm-3" runat="server" Text="From Year"><b>From Year :</b>
                              <span style="color: red;">*</span></asp:Label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="ddlFromYear" CssClass="form-control" runat="server" AutoPostBack="True">
                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvFromYear" ControlToValidate="ddlFromYear" runat="server" ForeColor="Red" InitialValue="0" ErrorMessage="Select From Year" Display="Dynamic"></asp:RequiredFieldValidator>  
                        </div>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lblToYear" class="control-label col-sm-3" runat="server" Text="To Year"><b>To Year :</b>
                              <span style="color: red;">*</span></asp:Label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="ddlToYear" CssClass="form-control" runat="server" AutoPostBack="True">
                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                               
                            </asp:DropDownList>
                           <asp:RequiredFieldValidator ID="rfvToYear" ControlToValidate="ddlToYear" runat="server" ForeColor="Red" InitialValue="0" ErrorMessage="Select To Year" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-md-6">
                        <asp:Label ID="lblFromMonth" class="control-label col-sm-3" runat="server" Text="From Month"><b>From Month :</b>
                              <span style="color: red;">*</span></asp:Label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="ddlFromMonth" CssClass="form-control" runat="server" AutoPostBack="True">
                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                
                            </asp:DropDownList>
                             <asp:RequiredFieldValidator ID="rfvFromMonth" ControlToValidate="ddlFromMonth" runat="server" ForeColor="Red" InitialValue="0" ErrorMessage="Select From Month" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lblToMonth" class="control-label col-sm-3" runat="server" Text="To Month"><b>To Month :</b>
                              <span style="color: red;">*</span></asp:Label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="ddlToMonth" CssClass="form-control" runat="server" AutoPostBack="True">
                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                             
                            </asp:DropDownList>
                           <asp:RequiredFieldValidator ID="rfvToMotnh" ControlToValidate="ddlToMonth" runat="server" ForeColor="Red" InitialValue="0" ErrorMessage="Select To Month" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="form-group pull-right">
                    <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" Style="width: 100px;" OnClick="btnSave_Click" />
                    <asp:Button ID="btnReset" class="btn btn-danger" runat="server" Text="Reset" Style="width: 100px;" OnClick="btnReset_Click" CausesValidation="false" />
                    <asp:Button ID="btnUpdate" class="btn btn-Primary" runat="server" Text="Update" Style="width: 100px;" OnClick="btnUpdate_Click" />
                    <asp:HiddenField ID="hdnFyID" runat="server" />
                    <asp:HiddenField ID="hdnStatus" runat="server" />
                </div>


                <!--End 1st row--->
               
                <asp:GridView ID="gdvFinancial" CssClass="table table-bordered datatable table-striped" runat="server"
                    ShowHeader="false" AutoGenerateColumns="False" OnRowDataBound="gdvFinancial_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="FyID" HeaderText="Financial YearID" ItemStyle-CssClass="hidden-bound">
                            <ItemStyle CssClass="hidden-bound"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="FromYear" HeaderText="Year" />
                        <asp:BoundField DataField="ToYear" HeaderText="Year" ItemStyle-CssClass="hidden-bound" >
                             <ItemStyle CssClass="hidden-bound"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="FromMonth" HeaderText="Month" ItemStyle-CssClass="hidden-bound" >
                             <ItemStyle CssClass="hidden-bound"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="ToMonth" HeaderText="Month" ItemStyle-CssClass="hidden-bound" >
                             <ItemStyle CssClass="hidden-bound"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Status" HeaderText="Status" />

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

            $('#Document').dataTable({
                "pageLength": 50,
                dom: 'frtip',
                responsive: true

            });
            $("#AdminPlaceHolder_gdvFinancial").prepend($("<thead><tr><th class='hidden-bound'>FYID</th><th>Financial Year</th><th class='hidden-bound'>To Year</th><th class='hidden-bound'>From Month</th><th class='hidden-bound'>To Month</th><th>Status</th><th>Actions</th></tr></thead>").append($(this).find("tr:first")));
            $("#AdminPlaceHolder_gdvFinancial").css('width', '100%');
            $("#AdminPlaceHolder_gdvFinancial").dataTable({
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
