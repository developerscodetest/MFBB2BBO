<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="ActiveAgents.aspx.cs" Inherits="MFBDBO.Master.ActiveAgents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .hidden-bound {
            display: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">

        <section class="content-header">
            <h1> Agents</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                 <li class="#">Agents</li>
                <li class="active">Active</li>
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
    <div class="form-row">
                     <div class="form-group col-xl-5 col-lg-5 col-md-5 col-sm-12 col-12">
                            <asp:Label ID="Label1" class="control-label required" runat="server" Text="Agent"><b>Staff :</b></asp:Label>
                            <select class="form-control select2">
                                <option>All</option>
                                   <option></option>
                                   <option></option>
                                   <option></option>
                                   <option></option>
                            </select>
                        </div>
                        <div class="form-group col-xl-5 col-lg-5 col-md-5 col-sm-12 col-12">
                            <asp:Label ID="lblAgent" class="control-label required" runat="server" Text="Agent"><b>Status :</b></asp:Label>
                            <select class="form-control select2">
                                <option>--Select--</option>
                                <option></option>
                            </select>
                        </div>
                        
                      <div class="form-group col-xl-2 col-lg-2 col-md-2 col-sm-12 col-12" style="margin-top: 20px;">
                            <asp:Button ID="btnSearch" class="btn btn-primary" runat="server" Text="Search" Style="width: 100px;" />
                        </div>
                    </div>

              

                <asp:GridView ID="gdvAgents" CssClass="table table-striped table-bordered" EmptyDataText="No Records Found" ShowHeaderWhenEmpty="true"  runat="server" AutoGenerateColumns="False"  ShowHeader="False" OnRowDataBound="GdvAgents_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="AgentID" HeaderText="AgentID" ItemStyle-CssClass="hidden-bound" >
                                    <ItemStyle CssClass="hidden-bound"></ItemStyle>
                                </asp:BoundField>                                
                                <asp:BoundField DataField="AgencyCode" HeaderText="Agency Code" />
                                <asp:BoundField DataField="AgencyName" HeaderText="Agency Name" />
                                <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                                <asp:BoundField DataField="MobileNo" HeaderText="Mobile No" />
                                <asp:BoundField DataField="AgencyEmail" HeaderText="Agency Email" />
                                <asp:BoundField DataField="ReferredBy" HeaderText="Referred By" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />                                
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">                                                
                                                <li>
                                                    <asp:LinkButton ID="lbtnAView" runat="server" Text="View" CausesValidation="False" OnClick="lbtnAView_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'  ><i class="fa fa-file-text-o"></i>View</asp:LinkButton>
                                                </li>   
                                                <li>
                                                    <asp:LinkButton ID="lbtnAHold" runat="server" Text="Hold" CausesValidation="False" OnClick="lbtnAHold_Click"  CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Hold</asp:LinkButton>                                                                                                            
                                                </li>
                                                <li>
                                                    <asp:LinkButton ID="lbtnAMarkAsInActive" runat="server" Text="Mark As InActive" CausesValidation="False" OnClick="lbtnAMarkAsActive_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Mark As InActive</asp:LinkButton>
                                                </li>
                                                <li>
                                                    <asp:LinkButton ID="lbtnAMarkAsActive" runat="server" Text="Mark As Active" CausesValidation="False" OnClick="lbtnAMarkAsActive_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Mark As Active</asp:LinkButton>
                                                </li>

                                                <%--"
                                                    OnClick="lbtnCEdit_Click"
                                                OnClick="lbtnView_Click"
                                                OnClick="lbtnCMarkAsActive_Click"
                                                OnClick="lbtnCMarkAsActive_Click"--%>
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

            $("#AdminPlaceHolder_gdvAgents").prepend($("<thead><tr><th class='hidden-bound'>AgentID</th><th>Agency Code</th><th>Agency Name</th><th>First Name</th><th>Mobile No</th><th>Agency Email</th><th>Referred By</th><th>Status</th><th>Actions</th></tr></thead>").append($(this).find("tr:first")));
            $("#AdminPlaceHolder_gdvAgents").css('width', '100%');
            $("#AdminPlaceHolder_gdvAgents").dataTable({
                "pageLength": 50,
                dom: 'Bfrtip',

                //buttons: [
                //    'copy', 'csv', 'excel', 'pdf', 'print'
                //]
                buttons: [
                    //{
                    //    extend: 'copy',
                    //    exportOptions: {
                    //        columns: [0, 1, 2, 3, 4]
                    //    }
                    //},
                    //{
                    //    extend: 'csv',
                    //    exportOptions: {
                    //        columns: [0, 1, 2, 3, 4]
                    //    }
                    //},
                    {
                        extend: 'excel',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4]
                        }
                    },
                    //{
                    //    extend: 'pdf',
                    //    exportOptions: {
                    //        columns: [0, 1, 2, 3, 4]
                    //    }
                    //},
                    //{
                    //    extend: 'print',
                    //    exportOptions: {
                    //        columns: [0, 1, 2, 3, 4]
                    //    }
                    //}
                ]
               
            });

        </script>
    
</asp:Content>
