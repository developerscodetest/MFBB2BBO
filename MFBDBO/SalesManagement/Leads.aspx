<%@ Page Title="" Language="C#" MasterPageFile="~/Salesmanagement/SalesManagement.Master" AutoEventWireup="true" CodeBehind="Leads.aspx.cs" Inherits="MFBDBO.Salesmanagement.Leads" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function alertMessage(text) {
            alert(text);
        }
    </script>
    <style>
        .panel.with-nav-tabs .panel-heading {
            padding: 0px 0px 0 0px;
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

        .hidden-bound {
            display: none;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SalesPlaceHolder" runat="server">
    <form id="leadForm" runat="server">
        <section class="content-header">
            <h1>Leads</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Leads</li>
            </ol>
        </section>
        <section class="content">
            <div class="box">
                <!-- /.box-header -->
                <div class="box-header">
                    <h3 class="box-title">&nbsp;</h3>
                </div>
                <!-- /.box-body -->
                <div class="box-body">
                    <!--1st row-->
                    <div class="form-group row">
                        <div class="col-md-6">

                            <asp:Label ID="lblAName" class="control-label col-sm-4" runat="server" Text="Label"><b>Agency Name :</b>
                            <span style="color: red;">*</span></asp:Label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtAName" class="form-control" placeholder="Enter Agency Name" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Agency Name is required" ForeColor="Red" ControlToValidate="txtAName" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revName" runat="server" ErrorMessage="Agency Name Must be Alphabets" ForeColor="Red" ControlToValidate="txtAName" ValidationExpression="^[a-zA-Z'.\s]{1,100}$" Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <asp:Label ID="lblCP" class="control-label col-sm-4" runat="server" Text="Contact Person"><b>Contact Person:</b> <span style="color: red;">*</span>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtContactPerson" class="form-control" placeholder="Enter Contact Person" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvContactPerson" runat="server" ErrorMessage="Contact Person is required" ControlToValidate="txtContactPerson" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revContactPerson" runat="server" ErrorMessage="Contact Person Must be Alphabets" ForeColor="Red" ControlToValidate="txtContactPerson" ValidationExpression="^[a-zA-Z'.\s]{1,100}$" Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>
                    <!--2nd row-->

                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblMobile" class="control-label col-sm-4" runat="server" Text="Mobile No"><b>Mobile No :</b>
                              <span style="color: red;">*</span></asp:Label>

                            <div class="col-sm-8">
                                <asp:TextBox ID="txtMobileNo" class="form-control" placeholder="Enter Mobile Number" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvMobileNo" runat="server" ErrorMessage="Mobile No is required" ControlToValidate="txtMobileNo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revMobileNo" runat="server" ErrorMessage="Mobile No Must be Numbers" ForeColor="Red" ControlToValidate="txtMobileNo" ValidationExpression="^[0-9]{10}$" Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <asp:Label ID="lblEmail" class="control-label col-sm-4" runat="server" Text="Email"><b>Email :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtEmail" class="form-control" placeholder="Enter Email Address" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is required" ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Enter Valid Email" ForeColor="Red" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>
                        </div>

                    </div>

                    <!--3rd row--->
                    <div class="form-group col-md-12">

                        <div class="modal-footer pull-right">
                            <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" Style="width: 100px;" OnClick="btnSave_Click" />
                            <asp:Button ID="btnUpdate" class="btn btn-primary" runat="server" Text="Update" Style="width: 100px;" OnClick="btnUpdate_Click" />
                            <asp:Button ID="btnReset" class="btn btn-danger" runat="server" Text="Reset" Style="width: 100px;" OnClick="btnReset_Click" UseSubmitBehavior="False" CausesValidation="False" />
                            <asp:HiddenField ID="hdnLID" runat="server" />
                            <asp:HiddenField ID="hdnStatus" runat="server" />

                        </div>
                    </div>
                    <!--Begin Navbar Tabs --->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel with-nav-tabs panel-primary">
                                <div class="panel-heading">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a href="#Leads" data-toggle="tab">Leads</a></li>
                                        <li><a href="#Callback" data-toggle="tab">Callback</a></li>
                                        <li><a href="#Interested" data-toggle="tab">Interested</a></li>
                                        <li><a href="#NotInterested" data-toggle="tab">Not Interested</a></li>
                                    </ul>
                                </div>
                                <div class="panel-body">
                                    <div class="tab-content">

                                        <!--Tab1-->
                                        <div class="tab-pane fade in active" id="Leads">
                                            <asp:GridView ID="gdvLeads" class="table table-bordered datatable table-striped" runat="server" AutoGenerateColumns="False" ShowHeader="False" OnSelectedIndexChanged="gdvLeads_SelectedIndexChanged" DataKeyNames="LID">
                                                <Columns>
                                                    <asp:BoundField DataField="LID" HeaderText="LID" ItemStyle-CssClass="hidden-bound" />
                                                    <asp:BoundField DataField="AgencyName" HeaderText="Agency Name" />
                                                    <asp:BoundField DataField="ContactPerson" HeaderText="Contact Person" />
                                                    <asp:BoundField DataField="MobileNo" HeaderText="Mobile" />
                                                    <asp:BoundField DataField="Email" HeaderText="Email" />
                                                    <asp:BoundField DataField="Status" HeaderText="Status" Visible="False" />
                                                    <asp:TemplateField HeaderText="Actions">
                                                        <ItemTemplate>
                                                            <div class="btn-group text-left">
                                                                <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu pull-right" role="menu">
                                                                    <li>
                                                                        <asp:LinkButton ID="lbtnLEdit" runat="server" Text="Edit" CausesValidation="False" OnClick="lbtnLEdit_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Edit</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="lbtnLCallBack" runat="server" Text="Call Back" CausesValidation="False" OnClick="lbtnStatus_Click"><i class="fa fa-file-text-o"></i>Call Back</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="lbtnLInterested" runat="server" Text="Interested" CausesValidation="False" OnClick="lbtnStatus_Click"><i class="fa fa-file-text-o"></i>Interested</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="lbtnLNotInterested" runat="server" Text="Not Interested" CausesValidation="False" OnClick="lbtnStatus_Click"><i class="fa fa-file-text-o"></i>Not Interested</asp:LinkButton>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>

                                        <!--Tab2-->
                                        <div class="tab-pane fade" id="Callback">
                                            <asp:GridView ID="gdvCallback" class="table table-bordered datatable table-striped" runat="server" AutoGenerateColumns="False" ShowHeader="False">
                                                <Columns>
                                                    <asp:BoundField DataField="LID" HeaderText="LID" ItemStyle-CssClass="hidden-bound" />
                                                    <asp:BoundField DataField="AgencyName" HeaderText="Agency Name" />
                                                    <asp:BoundField DataField="ContactPerson" HeaderText="Contact Person" />
                                                    <asp:BoundField DataField="MobileNo" HeaderText="Mobile" />
                                                    <asp:BoundField DataField="Email" HeaderText="Email" />
                                                    <asp:BoundField DataField="Status" HeaderText="Status" Visible="False" />
                                                    <asp:TemplateField HeaderText="Actions">
                                                        <ItemTemplate>
                                                            <div class="btn-group text-left">
                                                                <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu pull-right" role="menu">
                                                                    <li>
                                                                        <asp:LinkButton ID="lbtnCEdit" runat="server" Text="Edit" CausesValidation="False" OnClick="lbtnLEdit_Click"><i class="fa fa-file-text-o"></i>Edit</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="lbtnCInterested" runat="server" Text="Interested" CausesValidation="False" OnClick="lbtnStatus_Click"><i class="fa fa-file-text-o"></i>Interested</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="lbtnCNotInterested" runat="server" Text="Not Interested" CausesValidation="False" OnClick="lbtnStatus_Click"><i class="fa fa-file-text-o"></i>Not Interested</asp:LinkButton>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                        <!--Tab3-->
                                        <div class="tab-pane fade" id="Interested">
                                            <asp:GridView ID="gdvInterested" class="table table-bordered datatable table-striped" runat="server" AutoGenerateColumns="False" ShowHeader="False">
                                                <Columns>
                                                    <asp:BoundField DataField="LID" HeaderText="LID" ItemStyle-CssClass="hidden-bound" />
                                                    <asp:BoundField DataField="AgencyName" HeaderText="Agency Name" />
                                                    <asp:BoundField DataField="ContactPerson" HeaderText="Contact Person" />
                                                    <asp:BoundField DataField="MobileNo" HeaderText="Mobile" />
                                                    <asp:BoundField DataField="Email" HeaderText="Email" />
                                                    <asp:BoundField DataField="Status" HeaderText="Status" Visible="False" />
                                                    <asp:TemplateField HeaderText="Actions">
                                                        <ItemTemplate>
                                                            <div class="btn-group text-left">
                                                                <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu pull-right" role="menu">
                                                                    <li>
                                                                        <asp:LinkButton ID="lbtnIEdit" runat="server" Text="Edit" CausesValidation="False" OnClick="lbtnLEdit_Click"><i class="fa fa-file-text-o"></i>Edit</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="lbtnICallBack" runat="server" Text="Call Back" CausesValidation="False" OnClick="lbtnStatus_Click"><i class="fa fa-file-text-o"></i>Call Back</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="lbtnINotInterested" runat="server" Text="Not Interested" CausesValidation="False" OnClick="lbtnStatus_Click"><i class="fa fa-file-text-o"></i>Not Interested</asp:LinkButton>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                        <!--Tab4-->
                                        <div class="tab-pane fade" id="NotInterested">
                                            <asp:GridView ID="gdvNotInterested" class="table table-bordered datatable table-striped" runat="server" AutoGenerateColumns="False" ShowHeader="False">
                                                <Columns>
                                                    <asp:BoundField DataField="LID" HeaderText="LID" ItemStyle-CssClass="hidden-bound" />
                                                    <asp:BoundField DataField="AgencyName" HeaderText="Agency Name" />
                                                    <asp:BoundField DataField="ContactPerson" HeaderText="Contact Person" />
                                                    <asp:BoundField DataField="MobileNo" HeaderText="Mobile" />
                                                    <asp:BoundField DataField="Email" HeaderText="Email" />
                                                    <asp:BoundField DataField="Status" HeaderText="Status" Visible="False" />
                                                    <asp:TemplateField HeaderText="Actions">
                                                        <ItemTemplate>
                                                            <div class="btn-group text-left">
                                                                <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu pull-right" role="menu">
                                                                    <li>
                                                                        <asp:LinkButton ID="lbtnLEdit" runat="server" Text="Edit" CausesValidation="False" OnClick="lbtnLEdit_Click"><i class="fa fa-file-text-o"></i>Edit</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="lbtnNCallBack" runat="server" Text="Call Back" CausesValidation="False" OnClick="lbtnStatus_Click"><i class="fa fa-file-text-o"></i>Call Back</asp:LinkButton>
                                                                    </li>
                                                                    <li>
                                                                        <asp:LinkButton ID="lbtnNInterested" runat="server" Text="Interested" CausesValidation="False" OnClick="lbtnStatus_Click"><i class="fa fa-file-text-o"></i>Interested</asp:LinkButton>
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
                        </div>
                    </div>
                    <!--End Navbar Tabs --->
                </div>

            </div>
        </section>
    </form>

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
    <!--Jquery Validation Script-->
    <%-- <script src="../Scripts/jquery.validate.min.js"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js"></script>--%>

    <script type="text/javascript">
        //Data Table Function
        ApplyGrid('SalesPlaceHolder_gdvLeads');
        ApplyGrid('SalesPlaceHolder_gdvCallback');
        ApplyGrid('SalesPlaceHolder_gdvInterested');
        ApplyGrid('SalesPlaceHolder_gdvNotInterested');
        function ApplyGrid(gridname) {
            $("#" + gridname).prepend($("<thead><tr><th class='hidden-bound'>LID</th><th>Agency Name</th><th>Contact Person</th><th>Mobile No</th><th>Email</th><th>Actions</th></tr></thead>").append($(this).find("tr:first")));
            $("#" + gridname).css('width', '100%');
            $("#" + gridname).dataTable({
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
                    //{
                    //    extend: 'copyHtml5',
                    //    exportOptions: {
                    //        columns: [0, 1, 2, 3]
                    //    }
                    //},
                    //{
                    //    extend: 'csvHtml5',
                    //    exportOptions: {
                    //        columns: [0, 1, 2, 3]
                    //    }
                    //},
                    //{
                    //    extend: 'excelHtml5',
                    //    exportOptions: {
                    //        columns: [0, 1, 2, 3]
                    //    }
                    //},
                    //{
                    //    extend: 'pdfHtml5',
                    //    exportOptions: {
                    //        columns: [0, 1, 2, 3]
                    //    }
                    //}
                ]
            });
        }
    </script>
</asp:Content>
