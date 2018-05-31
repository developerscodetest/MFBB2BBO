<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="MFBDBO.Master.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    <form runat="server">
        <section class="content-header">
            <h1>Booking Details</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Booking Details</li>
            </ol>
        </section>
        <section class="content">
            <div class="box">
                <div class="box-header"></div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form>
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblBooking" class="control-label col-sm-4" runat="server" Text="Label"><b>Booking ID :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblID" class="control-label col-sm-4" runat="server" Text="Label">123143657
                                    </asp:Label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="lblBookingDate" class="control-label col-sm-4" runat="server" Text="Label"><b>Booking Date :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblDate" class="control-label col-sm-4" runat="server" Text="Label">23-05-2018
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <!--2nd row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblHotelName" class="control-label col-sm-4" runat="server" Text="Label"><b>Hotel Name :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblName" class="control-label col-sm-4" runat="server" Text="Label">Taj Krishna
                                    </asp:Label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="lblAddress" class="control-label col-sm-4" runat="server" Text="Label"><b>Address :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblAdrs" class="control-label col-sm-4" runat="server" Text="Label">xyssadsg
                                    </asp:Label>
                                </div>
                            </div>
                        </div>

                        <!--3rd row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblContact" class="control-label col-sm-4" runat="server" Text="Label"><b>Contact :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblNo" class="control-label col-sm-4" runat="server" Text="Label">9876543210
                                    </asp:Label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="lblLocation" class="control-label col-sm-4" runat="server" Text="Label"><b>Location :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblLctn" class="control-label col-sm-4" runat="server" Text="Label">Hyderabad
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <!--4th row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblCheckIn" class="control-label col-sm-4" runat="server" Text="Label"><b>Check-In :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblCheckInDate" class="control-label col-sm-4" runat="server" Text="Label">22-05-2018
                                    </asp:Label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="lblCheckOut" class="control-label col-sm-4" runat="server" Text="Label"><b>Check-Out :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblCheckOutDate" class="control-label col-sm-4" runat="server" Text="Label">25-05-2018
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <!--5th row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblSupplier" class="control-label col-sm-4" runat="server" Text="Label"><b>Supplier :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblSName" class="control-label col-sm-4" runat="server" Text="Label">Yathra
                                    </asp:Label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="lblReceived" class="control-label col-sm-4" runat="server" Text="Label"><b>Received :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblOff" class="control-label col-sm-4" runat="server" Text="Label">Offline
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <!--6th row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblAgency" class="control-label col-sm-4" runat="server" Text="Label"><b>Agency :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblAgencyName" class="control-label col-sm-4" runat="server" Text="Label">xysss
                                    </asp:Label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="lblAgencyContact" class="control-label col-sm-4" runat="server" Text="Label"><b>Agent Contact :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblAgencyNo" class="control-label col-sm-4" runat="server" Text="Label">9876543210
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <!--7th row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblCancellation" class="control-label col-sm-4" runat="server" Text="Label"><b>Cancellation :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblNR" class="control-label col-sm-6" runat="server" Text="Label">Non-Refundable
                                    </asp:Label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="lblDeadline" class="control-label col-sm-4" runat="server" Text="Label"><b>Deadline :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblDeadlineDate" class="control-label col-sm-4" runat="server" Text="Label">30-05-2018
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <!--8th row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblAdults" class="control-label col-sm-4" runat="server" Text="Label"><b>Adults :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblANo" class="control-label col-sm-6" runat="server" Text="Label">2
                                    </asp:Label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="lblkids" class="control-label col-sm-4" runat="server" Text="Label"><b>Kids :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblKidsNo" class="control-label col-sm-4" runat="server" Text="Label">1
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <!--9th row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblGuestDetails" class="control-label col-sm-4" runat="server" Text="Label"><b>Guest Details :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblGDname" class="control-label col-sm-6" runat="server" Text="Label">1. Prasanth
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!--Table-->
                    <div class="box-header">
                        <h4><b>Room Details</b></h4>
                    </div>
                    <table id="ViewTable" class="table table-bordered datatable table-striped" style="width: 100%">
                        <thead>
                            <tr>
                                <th>Room</th>
                                <th>Type</th>
                                <th>Rate</th>
                                <th>No Of Days</th>
                                <th>Total Price</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>101</td>
                                <td>Executive Room</td>
                                <td>1000</td>
                                <td>2</td>
                                <td>2000</td>
                            </tr>
                        </tbody>
                    </table>
                    <br />
                    <div class="form-group row">
                        <div class="col-md-3 col-md-offset-9">
                            <div class="form-group">
                                <asp:Label ID="Label1" class="control-label col-sm-4" runat="server" Text="Label"><b>Total :</b>
                                </asp:Label>
                                <asp:Label ID="Label2" class="control-label col-sm-4" runat="server" Text="Label">INR1234
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                    <p>&nbsp;</p>
                      <form>
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblAName" class="control-label col-sm-4" runat="server" Text="Label"><b>Confirmation ID :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtAName" class="form-control" placeholder="Enter Confirmation ID" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="lblCP" class="control-label col-sm-4" runat="server" Text="Contact Person"><b>Re-Confirmation ID :</b> <span style="color: red;">*</span>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtContactPerson" class="form-control" placeholder="Enter Re-Confirmation ID" runat="server"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                    </form>

                    <div class="footer-bottom pull-right">
                   <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Save" style="width:100px;" />
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

            $('#ViewTable').dataTable({
                "pageLength": 50,
                dom: 'frtip',
                responsive: true
               
            });

        </script>

    </form>
</asp:Content>
