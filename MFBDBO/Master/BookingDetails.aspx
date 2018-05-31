<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="BookingDetails.aspx.cs" Inherits="MFBDBO.Master.OfflineRequestEdit" %>

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
                <div class="box-header">
                    <h3 class="box-title">Hotel Details</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form>
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblDestination" class="control-label col-sm-4" runat="server" Text="Destination"><b>Destination :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblDubai" class="control-label " runat="server" Text="Label">Ras Al Khaimah, United Arab Emirates
                                    </asp:Label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="lblNationality" class="control-label col-sm-4" runat="server" Text="Nationality"><b>Nationality :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblIn" class="control-label " runat="server" Text="IN">India
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <!--2nd row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblPreferedHotels" class="control-label col-sm-4" runat="server" Text="Prefered Hotels"><b>Prefered Hotels :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblHName" class="control-label" runat="server" Text="Label">Hilton Ras Al Khaimah resort and Spa
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                    </form>
                    <hr />
                    <!--2nd row-->
                    <form class="form-horizontal">
                        <!--1st Row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblBookingID" class="control-label col-sm-3" runat="server" Text="Booking ID"><b>Booking ID : </b></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtBID" CssClass="form-control" placeholder="Enter Booking ID" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblFCDate" class="control-label col-sm-4" runat="server" Text="Free Cancellation Date"><b>Free Cancellation : </b></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtD" CssClass="form-control" type="date" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!--2nd  Row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblHN" class="control-label col-sm-3" runat="server" Text="Hotel Name"><b>Hotel Name : </b></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtHN" placeholder="Enter Hotel Name" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblHContact" class="control-label col-sm-4" runat="server" Text="Hotel Contact No "><b>Hotel Contact No : </b></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtHCNo" placeholder="Enter Hotel Contact No" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!--3rd Row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblHAddress" class="control-label col-sm-3" runat="server" Text="Hotel Address"><b>Hotel Address : </b></asp:Label>
                                <div class="col-sm-9">
                                    <textarea typeof="text" rows="2" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblLocation" class="control-label col-sm-4" runat="server" Text="Hotel Location"><b>Hotel Location : </b></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtHLocation" placeholder="Enter Hotel location" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!--4th Row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblCheckInDate" class="control-label col-sm-3" runat="server" Text="Check-In Date"><b>Check-In : </b></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtDate" type="date" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblCheckOutDate" class="control-label col-sm-4" runat="server" Text="Check-Out Date"><b>Check-Out : </b></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtCheckOutDate" type="date" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </form>
                    <hr />
                    <div class="box-header">
                        <h3 class="box-title">Room 1</h3>
                    </div>
                    <form>
                        <!-- Begin Room 1-->
                        <!--1st Row-->
                        <div class="row">
                            <div class="form-group col-md-2" style="">
                                <asp:Label ID="lblAdult" class="control-label" runat="server" Text="Room 1"><b>Adult(s) Detail : </b></asp:Label>
                            </div>
                            <div class="form-group col-md-2">
                                <asp:Label ID="lblSlt" class="control-label" runat="server" Text="Salutation"><b>Salutation</b></asp:Label>
                                <select class="form-control" style="padding-left: 0px !important">
                                    <option>Mr</option>
                                    <option>Miss</option>
                                </select>
                            </div>
                            <div class="form-group col-md-4">
                                <asp:Label ID="lblFN" class="control-label" runat="server" Text="First Name"><b>First Name</b></asp:Label>
                                <asp:TextBox ID="txtFN" class="form-control" placeholder="Enter First ame"  runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-4">
                                <asp:Label ID="lblLN" class="control-label" runat="server" Text="Last Name"><b>Last Name</b></asp:Label>
                                <asp:TextBox ID="txtLN" class="form-control"  runat="server"></asp:TextBox>
                            </div>
                        </div>
                          <!--2nd  Row-->
                        <div class="row">
                            <div class="form-group col-md-2 col-md-offset-2">
                                <asp:Label ID="Label2" class="control-label" runat="server" Text="Salutation"><b>Salutation</b></asp:Label>
                                <select class="form-control" style="padding-left: 0px !important">
                                    <option>Mr</option>
                                    <option>Miss</option>
                                </select>
                            </div>
                            <div class="form-group col-md-4">
                                <asp:Label ID="Label3" class="control-label" runat="server" Text="First Name"><b>First Name</b></asp:Label>
                                <asp:TextBox ID="TextBox1" class="form-control" placeholder="Enter First ame"  runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-4">
                                <asp:Label ID="Label4" class="control-label" runat="server" Text="Last Name"><b>Last Name</b></asp:Label>
                                <asp:TextBox ID="TextBox2" class="form-control" placeholder=" Enter Last Name"  runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <hr />
                        <!--2nd row-->
                          <div class="row">
                            <div class="form-group col-md-2" style="">
                                <asp:Label ID="Label1" class="control-label" runat="server" Text="Room 1"><b>Child(s) Detail : </b></asp:Label>
                            </div>
                            <div class="form-group col-md-4">
                                <asp:Label ID="Label6" class="control-label" runat="server" Text="First Name"><b>First Name</b></asp:Label>
                                <asp:TextBox ID="TextBox3" class="form-control" placeholder="Enter First ame"  runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-4">
                                <asp:Label ID="Label7" class="control-label" runat="server" Text="Last Name"><b>Last Name</b></asp:Label>
                                <asp:TextBox ID="TextBox4" class="form-control" placeholder=" Enter Last Name"  runat="server"></asp:TextBox>
                            </div>
                       <div class="form-group col-md-2">
                                <asp:Label ID="lblAge" class="control-label" runat="server" Text="Age"><b>Age</b></asp:Label>
                                <select class="form-control">
                                    <option>1 Year</option>
                                    <option>2 Years</option>
                                    <option>3 Years</option>
                                    <option>4 Years</option>
                                    <option>5 Years</option>
                                    <option>6 Years</option>
                                </select>
                            </div>
                        </div>
                        <!-- End Room 1-->
                        <hr />
                         <div class="box-header">
                    <h3 class="box-title">Booking Amount Breakupup</h3>
                </div><br />
                       <div class="row">
                            <div class="form-group col-md-2" style="width:20%">
                                <asp:Label ID="lblRoomType" class="control-label" runat="server" Text="Room Type"><b>Room Type</b></asp:Label>
                             <asp:TextBox ID="txtRT" class="form-control"  runat="server"></asp:TextBox> 
                            </div>
                            <div class="form-group col-md-2" style="width:20%">
                               <asp:Label ID="lblInclusion" class="control-label" runat="server" Text="Inclusion"><b>Inclusion</b></asp:Label>
                             <asp:TextBox ID="txtInclusion" class="form-control"  runat="server"></asp:TextBox> 
                            </div>
                            <div class="form-group col-md-2" style="width:20%">
              <asp:Label ID="lblNORooms" class="control-label" runat="server" Text="Room Type"><b>No.of Rooms</b></asp:Label>
                             <asp:TextBox ID="txtNORooms" class="form-control" runat="server"></asp:TextBox> 
                            </div>
                           <div class="form-group col-md-2" style="width:20%">
              <asp:Label ID="lblActualAmount" class="control-label" runat="server" Text="Room Type"><b>Actual Amount</b></asp:Label>
                             <asp:TextBox ID="txtAA" class="form-control"  runat="server"></asp:TextBox> 
                            </div>
                           <div class="form-group col-md-2" style="width:20%">
              <asp:Label ID="lblFinalAmount" class="control-label" runat="server" Text="Room Type"><b>Final Amount</b></asp:Label>
                             <asp:TextBox ID="txtFA" class="form-control"  runat="server"></asp:TextBox> 
                            </div>
                        </div>
                        <br/>
                          <!--2nd Row-->
                        <div class="form-group row">
                            <div class="col-md-12">
                                <asp:Label ID="lblStatus" class="control-label col-sm-2" runat="server" Text="Status"><b>Status :</b></asp:Label>
                                <div class="col-sm-4">
                                    <select class="form-control" style="font-style: italic">
                                        <option>--Select--</option>
                                        <option>Confirm</option>
                                        <option>Reconfirm</option>
                                        <option>Request</option>
                                        <option>Cancel</option>
                                        <option>Duplicate</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                    <div class="form-group pull-right">
                   <asp:Button ID="btnBookNow"  class="btn btn-primary" runat="server" Text="Book Now" style="width:100px;" />
               <asp:Button ID="btnBack" class="btn btn-danger" PostBackUrl="OfflineRequests.aspx" runat="server" Text="Back" Style="width: 100px;" />
                        </div>

                    </form>

                </div>
            </div>
        </section>
    </form>


</asp:Content>
