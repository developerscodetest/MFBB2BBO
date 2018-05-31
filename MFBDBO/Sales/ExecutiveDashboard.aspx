<%@ Page Title="" Language="C#" MasterPageFile="~/Sales/Sales.Master" AutoEventWireup="true" CodeBehind="ExecutiveDashboard.aspx.cs" Inherits="MFBDBO.Sales.SalesExecutive" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SalesPlaceHolder" runat="server">
    <style>
        th.temp {
            color: white;
        }
    </style>
    <section class="content-header">
        <h1>Dashboard
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Dashboard</li>
        </ol>
    </section>
    <section class="content">
        <!-- Info boxes -->
        <div class="row">
            <div class="col-lg-4 col-xs-6">
                <!-- small box -->
                <div class="small-box" style="background-color: #c47f58; color: #fff !important">
                    <div class="inner">
                        <label>Current Month Bookings</label>
                        <table>
                            <tbody>
                                <tr>
                                    <td>All &nbsp;</td>
                                    <td>: &nbsp; 200</td>
                                </tr>
                                <tr>
                                    <td>Vouchers &nbsp;</td>
                                    <td>: &nbsp; 100</td>
                                </tr>
                                <tr>
                                    <td>Confirmed &nbsp;</td>
                                    <td>: &nbsp; 50</td>
                                </tr>
                                <tr>
                                    <td>Cancelled &nbsp;</td>
                                    <td>: &nbsp; 50</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="icon">
                        <i class="ion ion-bag"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-4 col-xs-6">
                <!-- small box -->
                <div class="small-box" style="background-color: #cc9ee2; color: #fff !important">
                    <div class="inner">
                        <label>Current Month Rewards</label>
                        <table>
                            <tbody>
                                <tr>
                                    <td>Total &nbsp;</td>
                                    <td>: &nbsp; 200 Rs/-</td>
                                </tr>
                                <tr>
                                    <td>Achieved &nbsp;</td>
                                    <td>: &nbsp;  50 Rs/-</td>
                                </tr>
                                <tr>
                                    <td>Pending &nbsp;</td>
                                    <td>: &nbsp; 100 Rs/-</td>
                                </tr>
                                <tr>
                                    <td>Previous Month Reward &nbsp;</td>
                                    <td>: &nbsp; 100 Rs/-</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="icon">
                        <i class="ion ion-stats-bars"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-4 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-purple">
                    <div class="inner">
                        <label>Current Month Target</label>
                        <table>
                            <tbody>
                                <tr>
                                    <td>Total Target &nbsp;</td>
                                    <td>: &nbsp;2000 Rs/-</td>
                                </tr>
                                <tr>
                                    <td>All Bookings &nbsp;</td>
                                    <td>: &nbsp;2000 Rs/-</td>
                                </tr>
                                <tr>
                                    <td>Vouchers &nbsp;</td>
                                    <td>: &nbsp;2000 Rs/-</td>
                                </tr>
                                <tr>
                                    <td>Confirmed &nbsp;</td>
                                    <td>: &nbsp;2000 Rs/-</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="icon">
                        <i class="ion ion-bag"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->

        </div>
        <div class="box box-primary">
            <div class="box-header with-border">
                <i class="fa fa-bar-chart-o"></i>
                <h3 class="box-title">Agent Bookings</h3>
            </div>
            <div class="box-body">
                <div id="bar-chart" style="height: 350px;"></div>
            </div>
        </div>
        <!-- /.box-body-->

        <div class="row">
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <i class="fa fa-bar-chart-o"></i>
                        <h3 class="box-title">Credits</h3>
                    </div>
                    <div class="box-body">
                        <div id="Rewards" style="height: 300px;"></div>
                    </div>
                    <!-- /.box-body-->
                </div>
            </div>
        </div>
    </section>
</asp:Content>


