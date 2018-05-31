<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="AllBookings.aspx.cs" Inherits="MFBDBO.Master.AllBookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    <form runat="server">
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
                            <asp:Label ID="Label1" class="control-label required" runat="server" Text="Agent"><b>Status :</b></asp:Label>
                            <select class="form-control select2">
                                <option>All</option>
                                   <option>Confirm</option>
                                   <option>Re-Confirm</option>
                                   <option>Voucher</option>
                                   <option>Cancel</option>
                            </select>
                        </div>
                        <div class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12">
                            <asp:Label ID="lblAgent" class="control-label required" runat="server" Text="Agent"><b>Agent :</b></asp:Label>
                            <select class="form-control select2">
                                <option>--Select--</option>
                                <option></option>
                            </select>
                        </div>
                        <div class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12">
                            <asp:Label ID="lblBookingID" class="control-label required" runat="server" Text="Booking ID"><b>Booking ID  :</b></asp:Label>

                            <select class="form-control select2">
                                <option>--Select--</option>
                                <option></option>
                            </select>
                        </div>
                         <div class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12">
                            <asp:Label ID="Label2" class="control-label required" runat="server" Text="Booking ID"><b>Staff  :</b></asp:Label>

                            <select class="form-control select2">
                                <option>--Select--</option>
                                <option></option>
                            </select>
                        </div>
                       <%-- <div class="form-group col-xl-2 col-lg-2 col-md-2 col-sm-12 col-12" style="margin-top: 25px;">
                            <asp:Button ID="btnSearch" class="btn btn-primary" runat="server" Text="Search" Style="width: 100px;" />
                        </div>--%>
                    </div>
       <!--2nd Row-->
<div class="form-row">
                     <div class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12">
                            <asp:Label ID="lblFromDate" class="control-label required" runat="server" Text="Agent"><b>From Date :</b></asp:Label>                 
                            <div class="input-group date">
                             <asp:TextBox ID="txtFDate" type="date" CssClass="form-control" runat="server"></asp:TextBox>
                             <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                  </div>
                        </div>
                        <div class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12">
                            <asp:Label ID="lblToDate" class="control-label required" runat="server" Text="To Date"><b>To Date :</b></asp:Label>
                              <div class="input-group date">
                             <asp:TextBox ID="txtTDate" type="date" CssClass="form-control" runat="server"></asp:TextBox>
                             <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                  </div>
                        </div>
                       <div class="form-group col-xl-2 col-lg-2 col-md-2 col-sm-12 col-12" style="margin-top: 20px;">
                            <asp:Button ID="btnSearch" class="btn btn-primary" runat="server" Text="Search" Style="width: 100px;" />
                        </div>
                    </div>
                    <!--Table-->
                   <table id="bookings" class="table table-bordered table-striped" style="width:100%">
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
                                           <li><a href="View.aspx"><i class="fa fa-file-text-o"></i>View</a></li>
                                            </ul>
                                        </div>
                                </td>
                            </tr>
                           
                        </tbody>
                    </table>
                </div>
                <!-- /.box-body -->
            </div>

        </section>


    </form>
</asp:Content>
