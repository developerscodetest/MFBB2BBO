<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="MFBDBO.Master.View" %>

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
            <h1>Booking Details</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Booking Details</li>
            </ol>
        </section>
         <section class="content">
            <div class="box">
              <div class="box-header with-border">
                 <h4 class="box-title">Booking Details</h4>
                </div>
                <div class="box-body">
                    <!--1st row--->
                     <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblBookingID" class="control-label col-sm-4" runat="server" Text="Booking ID :"><b>SupplierBooking ID :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblBID" class="control-label " runat="server" Text="123143657">
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblBookingDate" class="control-label col-sm-4" runat="server" Text="Booking Date :"><b>Booking Date :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblDate" class="control-label " runat="server" Text="23-05-2018">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <!--2nd row-->
                      <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblSupplier" class="control-label col-sm-4" runat="server" Text="Supplier :"><b>Supplier :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblSName" class="control-label " runat="server" Text="Yathra">
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblReceived" class="control-label col-sm-4" runat="server" Text="Received :"><b>Received :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblRec" class="control-label " runat="server" Text="Offline">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                      <!--3rd row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblAgency" class="control-label col-sm-4" runat="server" Text="Agency :"><b>Agency :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblAgencyName" class="control-label " runat="server" Text="xysss">
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblAgencyContact" class="control-label col-sm-4" runat="server" Text="Agent Contact :"><b>Agent Contact :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblAgencyCNo" class="control-label " runat="server" Text="9876543210">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                      <!--4th row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblCancellation" class="control-label col-sm-4" runat="server" Text="Cancellation :"><b>Cancellation :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblCancel" class="control-label " runat="server" Text="Non-Refundable">
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblDeadline" class="control-label col-sm-4" runat="server" Text="Deadline :"><b>Deadline :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblDeadlineDate" class="control-label " runat="server" Text="30-05-2018">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                    <!--5th row-->
                        <div class="form-group row">
                             <div class="col-md-6">
                                <asp:Label ID="lblAgentBookingID" class="control-label col-sm-4" runat="server" Text="AgentBooking ID :"><b>AgentBooking ID :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblABID" class="control-label " runat="server" Text="123143657">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                       </div>
                <!--Hotel Details-->
                 <div class="box-header with-border">
                 <h4 class="box-title">Hotel Details</h4>
                </div>
                  <div class="box-body">
                     <!--5th row-->
                         <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblHotelName" class="control-label col-sm-4" runat="server" Text="Hotel Name :"><b>Hotel Name :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblHName" class="control-label " runat="server" Text="Taj Krishna">
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblContactNo" class="control-label col-sm-4" runat="server" Text="Contact No :"><b>Contact No :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblCNo" class="control-label " runat="server" Text="9876543210">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                       <!--6th row-->
                        <div class="form-group row">
                           <div class="col-md-6">
                                <asp:Label ID="lblAddress" class="control-label col-sm-4" runat="server" Text="Address :"><b>Address :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblAdrs" class="control-label " runat="server" Text="xyssadsg">
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblLocation" class="control-label col-sm-4" runat="server" Text="Label"><b>Location :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblLctn" class="control-label " runat="server" Text="Label">Hyderabad
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                         <!--7th row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblCheckIn" class="control-label col-sm-4" runat="server" Text="Check-In :"><b>Check-In :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblCheckInDate" class="control-label " runat="server" Text="22-05-2018">
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblCheckOut" class="control-label col-sm-4" runat="server" Text="Check-Out :"><b>Check-Out :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblCheckOutDate" class="control-label " runat="server" Text="25-05-2018">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                   </div>
                 <!--Guest Details-->
                 <div class="box-header with-border">
                 <h4 class="box-title">Guest Details</h4>
                </div>
                <!--Table-->
                  <div class="box-body">
              <%--<table class="table table-bordered datatable table-striped" style="width: 100%">
                        <thead>
                            <tr>
                                <th>Room #</th>
                                <th>Room Type</th>
                                <th>Rate per Room</th>
                                <th>Guest Details</th>
                                <th>Adults</th>
                                <th>Kids</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Room-1</td>
                                <td>Executive Room</td>
                                <td>1000</td>
                                <td>Mr Mohammed Ali Khan </td>
                                <td>2</td>
                                <td>1</td>
                            </tr>
                        </tbody>
                    </table>--%>

                      <asp:GridView ID="gdvAllBookings" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false"  ShowHeader="false" OnRowDataBound="GdvAllBookings_RowDataBound1">
                            <Columns> 
                                <%--// RoomDetailsId, BookingDetailsId, Adults, Kids, RoomType, Price--%>
                                <asp:BoundField DataField="AllBookingstc.BookingDetailsId" HeaderText="BookingDetailsId" ItemStyle-CssClass="hidden-bound" >
                                    <ItemStyle CssClass="hidden-bound"></ItemStyle>
                                </asp:BoundField>    
                                <asp:BoundField DataField="Roomstc.RoomDetailsId" HeaderText="Room" />
                                <asp:BoundField DataField="Roomstc.RoomType" HeaderText="Room Type" />
                                <asp:BoundField DataField="Roomstc.Price" HeaderText="Rate Per Room" />
                                <asp:BoundField DataField="Gueststc.FirstName" HeaderText="Guest Details" />
                                <asp:BoundField DataField="Roomstc.Adults" HeaderText="Adults" />
                                <asp:BoundField DataField="Roomstc.Kids" HeaderText="Kids" />
                                <%--<asp:BoundField DataField="Agentstc.ReferredBy" HeaderText="Price" />
                                <asp:BoundField DataField="AllBookingstc.Status" HeaderText="Status" />                               
                                <asp:TemplateField HeaderText="Actions">--%>
                                    <%--<ItemTemplate>
                                        <div class="btn-group text-left">                                
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                           <li><a href="View.aspx"><i class="fa fa-file-text-o"></i>View</a></li>
                                            </ul>
                                        </div>
                                    </ItemTemplate>--%>
                                <%--</asp:TemplateField>--%>
                            </Columns>
                        </asp:GridView>
                      </div>
                 <!--Booking Amount Breakup-->
                    <div class="box-header with-border">
                        <h4>Booking Amount Breakup</h4>
                    </div>
                <div class="box-body">
                 <%--<table class="table table-bordered datatable table-striped" style="width: 100%">
                        <thead>
                            <tr>
                                <th>Room Type</th>
                                <th>Inclusion</th>
                                <th>No.Of Rooms</th>
                                <th>Amount</th>
                                <th>Total Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Double Room</td>
                                <td>Breakfast</td>
                                <td>1</td>
                                <td>28250.00</td>
                                <td>28250.00</td>
                            </tr>
                        </tbody>
                    </table>--%>

                    <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="false"  ShowHeader="false" OnRowDataBound="GdvAllBookings_RowDataBound2" >
                            <Columns>                                 
                                <asp:BoundField DataField="AllBookingstc.BookingDetailsId" HeaderText="BookingDetailsId" ItemStyle-CssClass="hidden-bound" >
                                    <ItemStyle CssClass="hidden-bound"></ItemStyle>
                                </asp:BoundField>                                    
                                <asp:BoundField DataField="Roomstc.RoomType" HeaderText="Room Type" />
                                <asp:BoundField DataField="Roomstc.Price" HeaderText="Inclusions" />
                                <asp:BoundField DataField="AllBookingstc.NoofRooms" HeaderText="No. of Rooms" />
                                <asp:BoundField DataField="AllBookingstc.AgentPrice" HeaderText="Amount Per Room" />
                                <%--<asp:BoundField DataField="Roomstc.Kids" HeaderText="Total Amount" />--%>                                
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-3 col-md-offset-8">
                            <div class="form-group">
                                <asp:Label ID="lblTotal" class="control-label col-sm-4" runat="server" Text =" Total :">Total :</asp:Label>
                                <asp:Label ID="lblTotalAmount" class="control-label col-sm-8" runat="server" Text="INR 28250.00"><b>INR 28250.00</b>
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                  <!--Deatils-->
                      <div class="box-body">
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblAName" class="control-label col-sm-4" runat="server" Text="Confirmation ID :"><b>Confirmation ID :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtConfID" class="form-control" placeholder="Enter Confirmation ID" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblCP" class="control-label col-sm-4" runat="server" Text="Re-Confirmation ID :"><b>Re-Confirmation ID :</b> <span style="color: red;">*</span>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtReConfID" class="form-control" placeholder="Enter Re-Confirmation ID" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblFCDate" class="control-label col-sm-4" runat="server" Text="Cancellation Date : "><b>Cancellation Date :</b>
                              </asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtFCDate" class="form-control" disabled placeholder="11-07-2018" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblStaffName" class="control-label col-sm-4" runat="server" Text="Staff Name :"><b>Staff  Name:</b> <span style="color: red;">*</span>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtStaffName" class="form-control" disabled placeholder="NA" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                      <!--Button-->
                     <div class="footer-bottom pull-right">
                           <asp:Button ID="btnUpdate" CssClass="btn btn-primary" runat="server" Text="Update" style="width:100px"/>
                           <asp:Button ID="Button1" CssClass="btn btn-danger" PostBackUrl="AllBookings.aspx" runat="server" Text="Back" style="width:100px;" /> 
                    </div>
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

            $("#AdminPlaceHolder_gdvAllBookings").prepend($("<thead><tr><th class='hidden-bound'>BookingDetailsId</th><th>Room</th><th>Room Type</th><th>Rate Per Room</th><th>Guest Details</th><th>Adults</th><th>Kids</th></tr></thead>").append($(this).find("tr:first")));
            $("#AdminPlaceHolder_gdvAllBookings").css('width', '100%');
            $("#AdminPlaceHolder_GridView1").prepend($("<thead><tr><th class='hidden-bound'>BookingDetailsId</th><th>Room Type</th><th>Inclusions</th><th>No. of Rooms</th><th>Amount Per Room</th></tr></thead>").append($(this).find("tr:first")));
            $("#AdminPlaceHolder_GridView1").css('width', '100%');
            //$("#AdminPlaceHolder_gdvAllBookings").dataTable({
            //    "pageLength": 10,
            //    dom: 'Bfrtip',


            //});

        </script>
</asp:Content>
