<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="IncentivesView.aspx.cs" Inherits="MFBDBO.Master.IncentivesView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    <form runat="server">
        <section class="content-header">
            <h1>Incentives </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">Accounts</li>
                <li class="active">Incentives </li>
            </ol>
        </section>
        <section class="content">
            <div class="box">
                <div class="box-header">
                    <%--<h3 class="box-title"></h3>--%>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <!--Table-->
                    <table class="table table-responsive table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Booking Details</th>
                                <th>Agent</th>
                                <th>Dates</th>
                                <th>Booking Amount</th>
                                <th>Incentive</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <span><b>ID : </b>123456</span><br />
                                    <span><b>Supplier :</b> Ramesh</span><br />
                                    <span><b>Recieved : </b>Online</span>
                                </td>
                                <td>MyFirstBooking
                                    <br />
                                    (mfb2105)
                                   
                                </td>
                               
                                <td>
                                    <span><b>Check-In : </b>20-05-2018</span><br />
                                    <span><b>Check-Out : </b>25-05-2018</span>

                                </td>
                              
                                <td>20000</td>
                                <td>2000</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="form-group col-md-5 col-md-offset-7">
                        <div class="col-md-4">
                            <asp:Label ID="lblTI" CssClass="control-label" runat="server" Text="Total Incentive"><b>Total Incentive : </b></asp:Label>
                        </div>
                        <div class="col-md-8">
                            <asp:TextBox ID="txtDisable" CssClass="form-control" disabled runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group pull-right">
                        <asp:Button ID="btnBack" CssClass="btn btn-danger" PostBackUrl="IncentivesHRM.aspx" runat="server" Text="Back" Style="width: 100px;" />

                    </div>
                </div>
                <!-- /.box-body -->
            </div>

        </section>

        <!-- jQuery 2.2.3 -->


    </form>
</asp:Content>
