<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="OfflineRequests.aspx.cs" Inherits="MFBDBO.Master.OfflineRequests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    <form runat="server">
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
                            <asp:Button ID="btnNR" class="btn btn-primary" PostBackUrl="~/Master/NewRequest.aspx" runat="server" Text="New Request" Style="width: 100px;" />
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
                                    <span><b>ID : </b>123456</span><br />
                                    <span><b>Supplier :</b> Rezlive</span><br />

                                </td>
                                <td>MyFirstBooking
                                    <br />
                                    (mfb2105)<br />
                                    <span><b>Staff : </b>Ramesh</span>
                                </td>
                                <td style="width: 17%;">Taj Krishna<br />
                                    <span><b>Address : </b>1st Floor ,B -Wing, Gopal Place, Satellite Road, Ahmedabad, Gujarat 380015</span><br />
                                    <span><b>Contact : </b>080107 56677</span><br />

                                </td>
                                <td>Ramesh<br />
                                    <span><b>Check-In : </b>20-05-2018</span><br />
                                    <span><b>Check-Out : </b>25-05-2018</span>

                                </td>
                                <td>
                                    <span><b>Deadline : </b>31-05-2018</span><br />

                                </td>

                                <td><span><b>Confirm  : </b>123456</span><br />

                                </td>
                                <td>
                                    <span class="dtr-data"><span class="label label-primary">Confirmed</span>
                                        <br>
                                        <label class="label label-danger text-right">Non-Refundable</label></span>
                                </td>
                                <td>
                                    <div class="btn-group text-left">
                                        <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                        <ul class="dropdown-menu pull-right" role="menu">
                                            <li><a href="BookingRequest.aspx"><i class="fa fa-file-text-o"></i>Booking Request</a></li>
                                            <li><a href="BookingDetails.aspx"><i class="fa fa-file-text-o"></i>Booking Details</a></li>
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
