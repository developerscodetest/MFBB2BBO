<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="AllBookings.aspx.cs" Inherits="MFBDBO.Master.AllBookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .hidden-bound {
            display: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    
        <section class="content-header">
            <h1>All Bookings</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">Operations</li>
                <li class="active">All Bookings</li>
            </ol>
        </section>
        <section class="content">
            <div class="box">
                <div class="box-header">
                    <%--<h3 class="box-title"></h3>--%>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="form-row">
                        <div class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12">
                            <asp:Label ID="Label1" CssClass="control-label required" runat="server" Text="Status"><b>Status :</b></asp:Label>
                            <%--<select class="form-control select2">
                                <option>All</option>
                                <option>Confirm</option>
                                <option>Re-Confirm</option>
                                <option>Voucher</option>
                                <option>Cancel</option>
                            </select>--%>
                            <asp:DropDownList ID="ddlStatus" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="All" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Confirmed" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Re-Confirmed" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Voucher" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Cancel" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12">
                            <asp:Label ID="lblAgent" CssClass="control-label required  select2" runat="server" Text="Agent"><b>Agent :</b></asp:Label>
                            <%-- <select class="form-control select2">
                                <option>--Select--</option>
                                <option></option>
                            </select>--%>
                            <asp:DropDownList ID="ddlAgent" CssClass="form-control" runat="server">
                                <%--<asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="" Value="2"></asp:ListItem>--%>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12">
                            <asp:Label ID="lblBookingID" CssClass="control-label required" runat="server" Text="Booking ID"><b>SupBooking ID  :</b></asp:Label>

                            <asp:DropDownList ID="ddlBID" CssClass="form-control" runat="server">
                                <%--<asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="" Value="2"></asp:ListItem>--%>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12">
                            <asp:Label ID="lblAgentBID" CssClass="control-label required" runat="server" Text="AgentBooking ID"><b>AgentBooking ID  :</b></asp:Label>

                            <asp:DropDownList ID="ddlAgentBookingID" CssClass="form-control" runat="server">
                                <%--<asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="" Value="2"></asp:ListItem>--%>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12">
                            <asp:Label ID="lblStaff" CssClass="control-label required" runat="server" Text="Booking ID"><b>Supplier  :</b></asp:Label>
                            <asp:DropDownList ID="ddlStaff" CssClass="form-control" runat="server">
                                <%--<asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="" Value="2"></asp:ListItem>--%>
                            </asp:DropDownList>
                        </div>
                        <%-- <div class="form-group col-xl-2 col-lg-2 col-md-2 col-sm-12 col-12" style="margin-top: 25px;">
                            <asp:Button ID="btnSearch" class="btn btn-primary" runat="server" Text="Search" Style="width: 100px;" />
                        </div>--%>
                    </div>
                    <!--2nd Row-->
                    <div class="form-row">
                        <div class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12">
                            <asp:Label ID="lblFromDate" CssClass="control-label required" runat="server" Text="Agent"><b>From Date :</b></asp:Label>
                            <div class="input-group date">
                                <asp:TextBox ID="txtFDate" type="date" CssClass="form-control" runat="server"></asp:TextBox>
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12">
                            <asp:Label ID="lblToDate" CssClass="control-label required" runat="server" Text="To Date"><b>To Date :</b></asp:Label>
                            <div class="input-group date">
                                <asp:TextBox ID="txtTDate" type="date" CssClass="form-control" runat="server"></asp:TextBox>
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-xl-2 col-lg-2 col-md-2 col-sm-12 col-12" style="margin-top: 20px;">
                            <asp:Button ID="btnSearch" CssClass="btn btn-primary" runat="server" Text="Search" Style="width: 100px;" OnClick="btnSearch_Click" />
                        </div>
                    </div>
                    <!--Table-->
                    <%-- <table id="bookings" class="table table-bordered table-striped" style="width:100%">
                        <thead>
                            <tr>
                                <th>Booking Details</th>
                                <th>Agent</th>
                                <th>Hotel</th>
                                <th>Guest</th>
                                <th>Dates</th>
                                <th>Reference</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                             <td>
                               <span><b> ID : </b> 123456</span><br />
                               <span><b>Supplier :</b> Ramesh</span><br />
                              <span><b>Recieved : </b> Online</span>
                                </td>
                                <td>MyFirstBooking <br />
                                   (mfb2105)<br />
                                    <span><b>Staff : </b> Ramesh</span>
                                </td>
                                <td style="width:17%;">Taj Krishna<br />
                                   <span><b>Address : </b> 1st Floor ,B -Wing, Gopal Place, Satellite Road, Ahmedabad, Gujarat 380015</span><br />
                                     <span><b>Contact : </b> 080107 56677</span><br />

                                </td>
                                <td>Ramesh<br />
                                    <span><b>Check-In : </b>20-05-2018</span><br />
                                    <span><b>Check-Out : </b>25-05-2018</span>

                                </td>
                                <td>
                                    <span><b>Deadline : </b>31-05-2018</span><br />
                                    <span><b>Payment : </b>26-05-2018</span><br />
                                    <span><b>Cancelled : </b>NA</span>
                                </td>
                                
                                <td><span><b>Confirm  : </b>123456</span><br />
                                    <span><b>Reconfirm : </b>NA</span><br />
                                    <span><b>Voucher : </b> 1243657</span>
                                </td>
                                <td>
                                    <span class="dtr-data"><span class="label label-primary">Confirmed</span> <br> <label class="label label-danger text-right">Non-Refundable</label></span>
                                </td>
                                <td>
                                     <div class="btn-group text-left">                                
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li>
                                                    <asp:LinkButton ID="lbtnABView" runat="server" Text="View" CausesValidation="False" OnClick="lbtnABView_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'  ><i class="fa fa-file-text-o"></i>View</asp:LinkButton>
                                                </li>
                                           <%--<li><a href="View.aspx"><i class="fa fa-file-text-o"></i>View</a></li>--%>
                    <%--  </ul>
                                        </div>
                                </td>
                            </tr>                           
                        </tbody>--%>
                    <%--</table>  --%>
                    <%-- <div class="row">
                        <div class="col-md-12">--%>
                    <%--<asp:GridView ID="GridAllStore"  runat="server" AutoGenerateColumns="true" Width="100%"  ViewStateMode="Enabled">--%>
                    <asp:GridView ID="gdvAllBookings" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false" ShowHeader="false" OnRowDataBound="GdvAllBookings_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="AllBookingstc.BookingDetailsId" HeaderText="BookingDetailsId" ItemStyle-CssClass="hidden-bound">
                                <ItemStyle CssClass="hidden-bound"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="AllBookingstc.SupBookingId" HeaderText="Booking Details" />
                            <asp:BoundField DataField="AllBookingstc.AgentId" HeaderText="Agent" />
                            <asp:BoundField DataField="AllBookingstc.HotelDetailsId" HeaderText="Hotel" />
                            <asp:BoundField DataField="AllBookingstc.AgentId" HeaderText="Guest" />
                            <asp:BoundField DataField="AllBookingstc.CheckinDate" HeaderText="Dates" />
                            <asp:BoundField DataField="Agentstc.ReferredBy" HeaderText="Reference" />
                            <asp:BoundField DataField="AllBookingstc.Status" HeaderText="Status" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <div class="btn-group text-left">
                                        <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                        <ul class="dropdown-menu pull-right" role="menu">
                                            <li><a href="View.aspx"><i class="fa fa-file-text-o"></i>View</a></li>
                                        </ul>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <%-- </div>
                    </div>--%>
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

            $("#AdminPlaceHolder_gdvAllBookings").prepend($("<thead><tr><th class='hidden-bound'>BookingDetailsId</th><th>Booking Details</th><th>Agent</th><th>Hotel</th><th>Guest</th><th>Dates</th><th>Reference</th><th>Status</th><th>Actions</th></tr></thead>").append($(this).find("tr:first")));
            $("#AdminPlaceHolder_gdvAllBookings").css('width', '100%');
            $("#AdminPlaceHolder_gdvAllBookings").dataTable({
                "pageLength": 10,
                dom: 'Bfrtip',

                //buttons: [
                //    'copy', 'csv', 'excel', 'pdf', 'print'
                //]
                buttons: [
                   
                    {
                        extend: 'excel',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6, 7]
                        }
                    },
                    {
                        extend: 'pdf',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6, 7]
                        }
                    },
                   
                ]

            });

        </script>
    
</asp:Content>
