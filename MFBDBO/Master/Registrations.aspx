<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="Registrations.aspx.cs" Inherits="MFBDBO.Master.Registrations" %>

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
    <style>
        .panel {
            border: 1px solid #eee !important;
        }

        .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover {
            color: #fff !important;
            cursor: default;
            background-color: #3c8dbc !important;
            border: 1px solid #ddd;
            border-bottom-color: transparent;
            border-radius: 0px !important;
        }

        .nav-tabs > li > a {
            margin-right: 2px;
            line-height: 1.42857143;
            border: 1px solid transparent;
            border-radius: 4px 4px 0 0;
            border-right: 1px solid #ddd !important;
        }

        .panel.with-nav-tabs .panel-heading {
            padding: 0px 0px 0 0px;
            border-bottom: 1px solid #eee;
        }

        .panel.with-nav-tabs .nav-tabs {
            border-bottom: none;
        }

        .panel.with-nav-tabs .nav-justified {
            margin-bottom: 0px;
        }

        .panel-primary {
            border-color: #ddd !important;
        }

        /*** PANEL PRIMARY ***/
        .with-nav-tabs.panel-primary .nav-tabs > li > a,
        .with-nav-tabs.panel-primary .nav-tabs > li > a:hover,
        .with-nav-tabs.panel-primary .nav-tabs > li > a:focus {
            color: #fff;
        }

            .with-nav-tabs.panel-primary .nav-tabs > .open > a,
            .with-nav-tabs.panel-primary .nav-tabs > .open > a:hover,
            .with-nav-tabs.panel-primary .nav-tabs > .open > a:focus,
            .with-nav-tabs.panel-primary .nav-tabs > li > a:hover,
            .with-nav-tabs.panel-primary .nav-tabs > li > a:focus {
                color: #fff;
                background-color: #3071a9;
                border-color: transparent;
                border-radius: 0px !important;
            }

        .with-nav-tabs.panel-primary .nav-tabs > li.active > a,
        .with-nav-tabs.panel-primary .nav-tabs > li.active > a:hover,
        .with-nav-tabs.panel-primary .nav-tabs > li.active > a:focus {
            color: #428bca;
            background-color: #fff;
            border-bottom-color: transparent;
        }

        .with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu {
            background-color: #428bca;
            border-color: #3071a9;
        }

            .with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > li > a {
                color: #fff;
            }

                .with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > li > a:hover,
                .with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > li > a:focus {
                    background-color: #3071a9;
                }

            .with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > .active > a,
            .with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > .active > a:hover,
            .with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > .active > a:focus {
                background-color: #4a9fe9;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    
        <section class="content-header">
            <h1>Registrations</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">Sales</li>
                <li class="active">Registrations</li>
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
                    <div class="tab-content">
                        <!--Tab1-->
                        <!--Begin Navbar Tabs --->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel with-nav-tabs">
                                    <div class="panel-heading">
                                        <ul class="nav nav-tabs">
                                            <li class="active"><a href="#NRegistration" data-toggle="tab">New Registration</a></li>
                                            <li><a href="#RejectedList" data-toggle="tab">Rejected List</a></li>
                                        </ul>
                                    </div>
                                    <div class="panel-body">
                                        <div class="tab-content">
                                            <!--Tab1-->
                                            <div class="tab-pane fade in active" id="NRegistration">
                                                <%--<table id="NRegistrationTable" class="table table-bordered datatable table-striped" style="width: 100%">--%>
                                                <asp:GridView ID="gdvRegistration" CssClass="table table-bordered datatable table-striped" EmptyDataText="No Records Found" ShowHeaderWhenEmpty="true" runat="server" AutoGenerateColumns="false" ShowHeader="false" DataKeyNames="AgentID" OnRowDataBound="gdvRegistration_RowDataBound" >
                                                    <Columns>
                                                        <asp:BoundField DataField="AgentID" HeaderText="AgentID" ItemStyle-CssClass="hidden-bound">
                                                            <ItemStyle CssClass="hidden-bound"></ItemStyle>
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="AgencyName" HeaderText="Agency Name" />
                                                        <asp:BoundField DataField="FirstName" HeaderText="Agent" />
                                                        <asp:BoundField DataField="MobileNo" HeaderText="Mobile No" />
                                                        <asp:BoundField DataField="AgencyEmail" HeaderText="Email" />
                                                        <asp:BoundField DataField="CityId" HeaderText="City" />
                                                        <asp:BoundField DataField="CategoryId" HeaderText="Category" />
                                                        <%--   <asp:BoundField DataField="IsActive" HeaderText="Status" />                 --%>
                                                        <asp:TemplateField HeaderText="Actions">
                                                            <ItemTemplate>
                                                                <div class="btn-group text-left">
                                                                    <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                    <ul class="dropdown-menu pull-right" role="menu">
                                                                        <li>
                                                                            <%--<asp:LinkButton ID="lbtnSEdit" runat="server" Text="Edit" CausesValidation="False" OnClick="lbtnSEdit_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Edit</asp:LinkButton>                                                        --%>
                                                    
                                                                        </li>
                                                                        <li>
                                                                            <asp:LinkButton ID="lbtnSView" runat="server" Text="View" CausesValidation="False" OnClick="lbtnSView_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>View</asp:LinkButton>
                                                                        </li>
                                                                        <%-- <li>
                                                                            <asp:LinkButton ID="lbtnSMarkAsInActive" runat="server" Text="Mark As InActive" CausesValidation="False" OnClick="lbtnSMarkAsActive_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Mark As InActive</asp:LinkButton>
                                                                        </li>
                                                                        <li>
                                                                            <asp:LinkButton ID="lbtnSMarkAsActive" runat="server" Text="Mark As Active" CausesValidation="False" OnClick="lbtnSMarkAsActive_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Mark As Active</asp:LinkButton>
                                                                        </li>--%>
                                                                    </ul>
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                                <%--    </table>--%>
                                            </div>

                                            <!--Tab2-->
                                            <div class="tab-pane fade in " id="RejectedList">
                                                <asp:GridView ID="gdvReject" CssClass="table table-bordered datatable table-striped" EmptyDataText="No Records Found" ShowHeaderWhenEmpty="true" runat="server" AutoGenerateColumns="false" ShowHeader="false" 
                                                            DataKeyNames="AgentID"   OnRowDataBound="gdvReject_RowDataBound">
                                                    <Columns>
                                                        <asp:BoundField DataField="AgentID" HeaderText="AgentID" ItemStyle-CssClass="hidden-bound">
                                                            <ItemStyle CssClass="hidden-bound"></ItemStyle>
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="AgencyName" HeaderText="Agency Name" />
                                                        <asp:BoundField DataField="FirstName" HeaderText="Agent" />
                                                        <asp:BoundField DataField="MobileNo" HeaderText="Mobile No" />
                                                        <asp:BoundField DataField="AgencyEmail" HeaderText="Email" />
                                                        <asp:BoundField DataField="CityId" HeaderText="City" />
                                                        <asp:BoundField DataField="CategoryId" HeaderText="Category" />
                                                        <%-- <asp:BoundField DataField="IsActive" HeaderText="Status" /> --%>
                                                        <asp:TemplateField HeaderText="Actions">
                                                            <ItemTemplate>
                                                                <div class="btn-group text-left">
                                                                    <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                    <ul class="dropdown-menu pull-right" role="menu">
                                                                        <li>
                                                                            <%--<asp:LinkButton ID="lbtnSEdit" runat="server" Text="Edit" CausesValidation="False" OnClick="lbtnSEdit_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Edit</asp:LinkButton>                                                        --%>
                                                    
                                                                        </li>
                                                                        <li>
                                                                            <asp:LinkButton ID="lbtnSView" runat="server" Text="View" CausesValidation="False" OnClick="lbtnSView_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>View</asp:LinkButton>
                                                                        </li>
                                                                        <%--  <li>
                                                                            <asp:LinkButton ID="lbtnSMarkAsInActive" runat="server" Text="Mark As InActive" CausesValidation="False" OnClick="lbtnSMarkAsActive_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Mark As InActive</asp:LinkButton>
                                                                        </li>
                                                                        <li>
                                                                            <asp:LinkButton ID="lbtnSMarkAsActive" runat="server" Text="Mark As Active" CausesValidation="False" OnClick="lbtnSMarkAsActive_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Mark As Active</asp:LinkButton>
                                                                        </li>--%>
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
                            </div>
                        </div>
                        <!--End Navbar Tabs --->
                    </div>
                </div>
                <!--End Navbar Tabs --->
            </div>

        </section>
        <!-- jQuery 2.2.3 -->
        <script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
        <!--Data Tables-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
        <link type="text/css" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" rel="stylesheet">
        <link type="text/css" href="https://cdn.datatables.net/buttons/1.1.2/css/buttons.dataTables.min.css" rel="stylesheet">
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.1.2/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.1.2/js/buttons.flash.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
        <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.1.2/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.1.2/js/buttons.print.min.js"></script>

        <script type="text/javascript">
            //Data Table Function
            ApplyGrid('AdminPlaceHolder_gdvRegistration');
            ApplyGrid('AdminPlaceHolder_gdvReject');
            function ApplyGrid(gridname) {
                $("#" + gridname).prepend($("<thead><tr><th class='hidden-bound'>AgentID</th><th>Agency Name</th><th>Agent</th><th>Mobile No</th><th>Email</th><th>City</th><th>Category</th><th>Actions</th></tr></thead>").append($(this).find("tr:first")));
                $("#" + gridname).css('width', '100%');
                $("#" + gridname).dataTable({
                    "pageLength": 10,
                    dom: 'Bfrtip',

                    buttons: [                
                    
                       {
                           extend: 'excel',
                           exportOptions: {
                               columns: [0, 1]
                           }
                       },
                       {
                           extend: 'pdf',
                           exportOptions: {
                               columns: [0, 1]
                           }
                       },
                    ]
                });
            }
            
        </script>

    
</asp:Content>


<%--//$('#gdvRegistration').dataTable({
            //    "pageLength": 50,
            //    dom: 'frtip',
            //    responsive: true
            //});


            //$('#Gridreject').dataTable({
            //    "pageLength": 50,
            //    dom: 'frtip',
            //    responsive: true
            //});--%>
