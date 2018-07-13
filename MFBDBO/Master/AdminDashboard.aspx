<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="MFBDBO.Master.AdminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    <%----%>
 <section class="content-header">
        <h1>Dashboard
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Dashboard</li>
        </ol>
    </section>
     <section class="content">
         <div class="box box-body">
        <!-- Info boxes -->
             <!--1st row-->
        <div class="row">
            <div class="col-lg-4 col-xs-6">
                <!-- small box -->
                <div class="small-box" style="background-color: green; color: #fff !important">
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
                <div class="small-box" style="background-color:#8e44ad; color: #fff !important">
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
            <div class="col-lg-4 col-xs-6">
                <!-- small box -->
              <div class="small-box" style="background-color:#AC3E31; color: #fff !important">
                    <div class="inner">
                        <label>Invoice</label>
                        <table>
                            <tbody>
                                <tr>
                                    <td>Ready To Release &nbsp;</td>
                                    <td>: &nbsp; 5</td>
                                </tr>
                                <tr>
                                    <td>Due &nbsp;</td>
                                    <td>: &nbsp;  50 Rs/-</td>
                                </tr>
                                <tr>
                                    <td>Paid &nbsp;</td>
                                    <td>: &nbsp; 100 Rs/-</td>
                                </tr>
                                <tr>
                                    <td>Partial Paid &nbsp;</td>
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
        </div>
       <!-- End 1st row-->

       <!--Begin 2nd row-->
        <div class="row">
            <div class="col-lg-4 col-xs-6">
                <!-- small box -->
                <div class="small-box" style="background-color:#0091D5; color: #fff !important">
                    <div class="inner">
                        <label>Agents</label>
                        <table>
                            <tbody>
                                <tr>
                                    <td>All Agents &nbsp;</td>
                                    <td>: &nbsp; 200</td>
                                </tr>
                                <tr>
                                    <td>Active Agents  &nbsp;</td>
                                    <td>: &nbsp; 100</td>
                                </tr>
                                <tr>
                                    <td>Hold &nbsp;</td>
                                    <td>: &nbsp; 50</td>
                                </tr>
                                <tr>
                                    <td>Inactive &nbsp;</td>
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
                <div class="small-box" style="background-color:#1F3F49; color: #fff !important">
                    <div class="inner">
                        <label>Issues</label>
                        <table>
                            <tbody>
                                <tr>
                                    <td>Open &nbsp;</td>
                                    <td>: &nbsp;2 </td>
                                </tr>
                                <tr>
                                    <td>Closed &nbsp;</td>
                                    <td>: &nbsp;5 </td>
                                </tr>
                                <tr>
                                    <td>High &nbsp;</td>
                                    <td>: &nbsp;4 </td>
                                </tr>
                                <tr>
                                    <td>Reopen &nbsp;</td>
                                    <td>: &nbsp;3 </td>
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
              <div class="small-box" style="background-color: #6ab187; color: #fff !important">
                    <div class="inner">
                        <label>Today Updates</label>
                        <table>
                            <tbody>
                                <tr>
                                    <td>Today Bookings &nbsp;</td>
                                    <td>: &nbsp; 5</td>
                                </tr>
                                <tr>
                                    <td>Today Check-In's &nbsp;</td>
                                    <td>: &nbsp; 20 </td>
                                </tr>
                                <tr>
                                    <td>Today Cancellations &nbsp;</td>
                                    <td>: &nbsp; 10 </td>
                                </tr>
                                <tr>
                                    <td>Today Vouchers &nbsp;</td>
                                    <td>: &nbsp; 5 </td>
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
        </div>
       <!-- End 2nd row-->

     <!-- Bar Chart -->
      <div class="row">
        <!-- Left col -->
        <div class="col-md-12">
          <!-- MAP & BOX PANE -->
         <div class="box box-primary">
            <div class="box-header with-border">
              <i class="fa fa-bar-chart-o"></i>
              <h3 class="box-title">All Bookings</h3>
              <div class="box-tools pull-right">
              </div>
            </div>
            <div class="box-body">
              <div id="bar-chart" style="height: 342px;"></div>
            </div>
            <!-- /.box-body-->
          </div>
        </div>
        <!-- /.col -->
        <!-- /.col -->
      </div>
      <!-- /.row -->

        <!-- /.box-body-->
             </div>
    </section>

<%----%>

</asp:Content>
