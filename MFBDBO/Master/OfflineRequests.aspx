<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="OfflineRequests.aspx.cs" Inherits="MFBDBO.Master.OfflineRequests" %>

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
            <h1>Offline Requests</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Offline Requests</li>
            </ol>
        </section>
        <section class="content">
            <div class="box">
                <div class="box-body">
                    <div class="form-group pull-right">
                        <asp:Button ID="btnNR" CssClass="btn btn-primary" PostBackUrl="~/Master/NewRequest.aspx" runat="server" Text="New Request" Style="width: 100px;" />
                    </div>
                    <!--Table-->
                    <asp:GridView ID="gdvBookingDetails" CssClass="table table-bordered datatable table-striped" runat="server" AutoGenerateColumns="False" ShowHeader="False" OnRowDataBound="gdvBookingDetails_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="RequestId" HeaderText="RequestId" ItemStyle-CssClass="hidden-bound">
                                <ItemStyle CssClass="hidden-bound"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="BookingDetailsId" HeaderText="Booking Details" />
                            <asp:BoundField DataField="AgentId" HeaderText="Agent" />
                            <%--<asp:BoundField DataField="PreferedHotels" HeaderText="Hotel" />--%>
                            <asp:BoundField DataField="RequestId" HeaderText="Guest" />
                            <%--<asp:BoundField DataField="Checkin" HeaderText="Dates" />--%>
                           <%-- <asp:BoundField DataField="" HeaderText="Reference" />--%>
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <div class="btn-group text-left">
                                        <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                        <ul class="dropdown-menu pull-right" role="menu">
                                            <li>
                                                <asp:LinkButton ID="lbtnBookingRequest" runat="server" Text="BookingRequest" CausesValidation="False" OnClick="lbtnBookingRequest_Click"
                                                    CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>BookingRequest</asp:LinkButton>
                                            </li>
                                            <li>
                                                <asp:LinkButton ID="lbtnBookingDetails" runat="server" Text="BookingDetails" CausesValidation="False" OnClick="lbtnBookingDetails_Click"><i class="fa fa-file-text-o"></i>BookingDetails</asp:LinkButton>
                                            </li>

                                        </ul>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <!-- /.box-body -->
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

        $("#AdminPlaceHolder_gdvBookingDetails").prepend($("<thead><tr><th class='hidden-bound'>RequestId</th><th>Booking Details</th><th>Agent</th><th>Guest</th><th>Status</th><th>Actions</th></tr></thead>").append($(this).find("tr:first")));
        $("#AdminPlaceHolder_gdvBookingDetails").css('width', '100%');
        $("#AdminPlaceHolder_gdvBookingDetails").dataTable({
            "pageLength": 5,
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
                        columns: [0, 1]
                    }
                },
                {
                    extend: 'pdf',
                    exportOptions: {
                        columns: [0, 1]
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
