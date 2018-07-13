<%@ Page Title="" Language="C#" MasterPageFile="~/Salesmanagement/SalesManagement.Master" AutoEventWireup="true" CodeBehind="SalesManagementDashboard.aspx.cs" Inherits="MFBDBO.Salesmanagement.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SalesPlaceHolder" runat="server">
    <section class="content-header">
      <h1>
        Dashboard
      </h1>
      <ol class="breadcrumb">
        <li><a href=http://localhost:60528/Sales/SalesExecutive><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
    <div class="box box-body ">
      <!-- Info boxes -->

        <div class="row">
        <div class="col-lg-4 col-xs-6">
            <!-- small box -->
            <div class="small-box" style="background-color:#c47f58; color:#fff !important">
                <div class="inner">
                    <label>Current Month Bookings</label>
                    <table>
                        <tbody>
                            <tr>
                                <td>Ramesh &nbsp;</td>
                                <td>: &nbsp;1500 Rs/-</td>
                            </tr>
                            <tr>
                                <td>Ravi &nbsp;</td>
                                <td>: &nbsp;1500 Rs/-</td>
                            </tr>
                            <tr>
                                <td>Dinesh &nbsp;</td>
                                <td>: &nbsp;1500 Rs/-</td>
                            </tr>
                            <tr>
                                <td>Satheash &nbsp;</td>
                                <td>: &nbsp;1500 Rs/-</td>
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
            <div class="small-box" style="background-color:#bcaf4b; color:#fff !important">
                <div class="inner">
                    <label>Vouchers</label>
                    <table>
                        <tbody>
                            <tr>
                                <td>Ramesh &nbsp;</td>
                                <td>: &nbsp;1500 Rs/-</td>
                            </tr>
                            <tr>
                                <td>Ravi &nbsp;</td>
                                <td>: &nbsp;1500 Rs/-</td>
                            </tr>
                            <tr>
                                <td>Dinesh &nbsp;</td>
                                <td>: &nbsp;1500 Rs/-</td>
                            </tr>
                            <tr>
                                <td>Satheash &nbsp;</td>
                                <td>: &nbsp;1500 Rs/-</td>
                            </tr>
                        </tbody>
                     </table>
                </div>
                <div class="icon">
                    <i class="ion ion-person-add"></i>
                </div>
                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-4 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-blue">
                <div class="inner">
                    <label>Confirmed</label>
                    <table>
                        <tbody>
                            <tr>
                                <td>Ramesh &nbsp;</td>
                                <td>: &nbsp;1500 Rs/-</td>
                            </tr>
                            <tr>
                                <td>Ravi &nbsp;</td>
                                <td>: &nbsp;1500 Rs/-</td>
                            </tr>
                            <tr>
                                <td>Dinesh &nbsp;</td>
                                <td>: &nbsp;1500 Rs/-</td>
                            </tr>
                            <tr>
                                <td>Satheash &nbsp;</td>
                                <td>: &nbsp;1500 Rs/-</td>
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
     
        <!-- ./col -->
    </div>

        <div class="row">
        <div class="col-lg-4 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-purple">
                <div class="inner">
                    <label>Team Targets</label>
                    <table>
                        <tbody>
                            <tr>
                                <td>Ramesh &nbsp;</td>
                                <td>: &nbsp;2000 Rs/-</td>
                            </tr>
                            <tr>
                                <td>Dinesh &nbsp;</td>
                                <td>: &nbsp;2000 Rs/-</td>
                            </tr>
                            <tr>
                                <td>Satheash &nbsp;</td>
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
            <div class="small-box bg-teal">
                <div class="inner">
                    <label>Manager Target</label>
                     <table>
                        <tbody>
                            <tr>
                                <td>All Bookings &nbsp;</td>
                                <td>: &nbsp; 4000 Rs/-</td>
                            </tr>
                            <tr>
                                <td>Vouchers &nbsp;</td>
                                <td>: &nbsp; 1500 Rs/-</td>
                            </tr>
                            <tr>
                                <td>Confirmed &nbsp;</td>
                                <td>: &nbsp; 500 Rs/-</td>
                            </tr>
                        </tbody>
                     </table>
                </div>
                <div class="icon">
                    <i class="ion ion-person-add"></i>
                </div>
                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-4 col-xs-6">
            <!-- small box -->
            <div class="small-box" style="background-color:#cc9ee2; color:#fff !important">
                <div class="inner">
                    <label>Rewards</label>
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
     
        <!-- ./col -->
    </div>
      <!-- /.row -->

      <div class="row">
        <div class="col-md-12">
          <div class="box box-primary">
            <div class="box-header with-border">
               
                   <div class="row">
    <div class="form-group col-md-2">
      <h3 class="box-title"><b>Bookings : </b></h3>
        </div>
                   <div class="form-group col-md-4">
                   <asp:TextBox ID="txtDate1" type="date" CssClass="form-control"  runat="server"></asp:TextBox>
                   </div>
                        <div class="form-group col-md-4">
                   <asp:TextBox ID="txtDate2" type="date" CssClass="form-control"  runat="server"></asp:TextBox>
                   </div>
      <div class="form-group col-md-2">
      <asp:Button ID="btnGetData" CssClass="btn btn-lg btn-primary" runat="server" Text="Search" style="padding: 6px; width: 100px; font-size: 15px;" />
        </div>

                    </div>
               
              <div class="box-tools pull-right">
                <div class="btn-group">
                  <ul class="dropdown-menu" role="menu"
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                  </ul>
                </div>
              </div>
            </div>
            <!-- /.box-header -->
            <!--Table-->
              <table class="table table-bordered table-hover datatable" id="table1" style="width:100%;">
                  <thead>
                      <tr style="background-color: #3c8dbc;color:#fff">
                       <th>Sales Executive</th>
                      <th>All Bookings</th>
                      <th>Vouchers</th>
                      <th>Confirmed</th>
                      <th>Cancelled</th>
                 </tr>
                     </thead>
                  <tbody>
                      <tr>
                          <td>Rakesh</td>
                          <td>100</td>
                           <td>70</td>
                           <td>20</td>
                           <td>10</td>
                      </tr>
                     
                       <tr>
                          <td>Rakesh</td>
                          <td>100</td>
                           <td>70</td>
                           <td>20</td>
                           <td>10</td>
                      </tr>
                       <tr>
                          <td>Rakesh</td>
                          <td>100</td>
                           <td>70</td>
                           <td>20</td>
                           <td>10</td>
                      </tr>

                  </tbody>
              </table>
              <p>&nbsp;</p>
          </div>
        </div>
      </div>

      <!-- Main row -->
      <div class="row">
        <!-- Left col -->
        <div class="col-md-8">
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

        <div class="col-md-4">
          <!-- Info Boxes Style 2 -->
          <div class="info-box bg-aqua">
            <span class="info-box-icon"><i class="ion ion-ios-pricetag-outline"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">All Agents</span>
              <span class="info-box-number">5,200</span>

              <div class="progress">
                <div class="progress-bar" style="width: 50%"></div>
              </div>
                  <span class="progress-description">
                    50% Increase in 30 Days
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
          <div class="info-box bg-green">
            <span class="info-box-icon"><i class="ion ion-ios-heart-outline"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">New Active Agents</span>
              <span class="info-box-number">92,050</span>

              <div class="progress">
                <div class="progress-bar" style="width: 20%"></div>
              </div>
                  <span class="progress-description">
                    20% Increase in 30 Days
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
          <div class="info-box bg-yellow">
            <span class="info-box-icon"><i class="ion ion-ios-cloud-download-outline"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Inactive Agents</span>
              <span class="info-box-number">114,381</span>

              <div class="progress">
                <div class="progress-bar" style="width: 70%"></div>
              </div>
                  <span class="progress-description">
                    70% Increase in 30 Days
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
          <div class="info-box bg-red">
            <span class="info-box-icon"><i class="ion-ios-chatbubble-outline"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">No Business Agents</span>
              <span class="info-box-number">163,921</span>

              <div class="progress">
                <div class="progress-bar" style="width: 40%"></div>
              </div>
                  <span class="progress-description">
                    40% Increase in 30 Days
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
        </div>  
    </section>
    <!-- /.content -->

</asp:Content>