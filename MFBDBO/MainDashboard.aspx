<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainDashboard.aspx.cs" Inherits="MFBDBO.MainDashboard" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>MFBDBO :: MainDashboard</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Main.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"  rel="stylesheet"/>

</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">
                        <b>Dashboard</b>
                    </a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#">
                            <i class="fa fa-sign-out"></i> Sign out
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container-fluid" style="padding: 0px 15px 0px 15px;">
            <b style="color: #000; font-size: 20px;">Welcome Admin !</b>
            <ul class="nav navbar-nav pull-right">
                <li>
                    <b style="color: #000; font-size: 14px;">Last session : 22 May 2018 / 16:30:45 Hours</b>
                </li>
            </ul>
        </div>

        <div class="container">
            <div class="row menusection">
                <div class="col-lg-3 col-md-3 col-xs-6 col-sm-4">
                    <a href="Master/AdminDashboard.aspx">
                        <div class="menu-block">
                            <asp:Image ID="imgAdmin" src="dist/img/MainDashboard/user2.png" class="img-responsive tocenter" runat="server"  />                      
                            <h5 class="heading">Admin Manager</h5>
                        </div>
                    </a>
                </div>
                  <div class="col-lg-3 col-md-3 col-xs-6 col-sm-4">
                    <div class="menu-block">
                      <a href="SalesManagement/SalesManagementDashboard.aspx">
                           <asp:Image ID="imgManager" src="dist/img/MainDashboard/Admin2.png" class="img-responsive tocenter" runat="server" />                      
                            <h5 class="heading"> Sales Manager </h5>
                        </a>
                    </div>
                </div>

                <div class="col-lg-3 col-md-3 col-xs-6 col-sm-4">
                    <div class="menu-block">
                    <a href="OPS/OPSDashboard.aspx">
                           <asp:Image ID="imgOperations" src="dist/img/MainDashboard/operation.png" class="img-responsive tocenter" runat="server" />                      
                            <h5 class="heading">Operation Manager</h5>
                        </a>
                    </div>
                </div>
                  <div class="col-lg-3 col-md-3 col-xs-6 col-sm-4">
                    <div class="menu-block">
                    <a href="OPS/OPSDashboard.aspx">
                           <asp:Image ID="Image2" src="dist/img/MainDashboard/hrm.png" class="img-responsive tocenter" runat="server" />                      
                            <h5 class="heading">HRM</h5>
                        </a>
                    </div>
                </div>
              
                <div class="col-lg-3 col-md-3 col-xs-6 col-sm-4">
                    <div class="menu-block">
                       <a href="Sales/ExecutiveDashboard.aspx">
                        <asp:Image ID="imgExecutive" src="dist/img/MainDashboard/Executive.png" class="img-responsive tocenter" runat="server" />                      
                            <h5 class="heading">Executive Panel</h5>
                        </a>
                    </div>
                </div>
                 <div class="col-lg-3 col-md-3 col-xs-6 col-sm-4">
                    <div class="menu-block">
                     <a href="Accounts/AccountsDashboard.aspx">
                        <asp:Image ID="Image1" src="dist/img/MainDashboard/accounting.png" class="img-responsive tocenter" runat="server" />                      
                            <h5 class="heading">Accounts</h5>
                        </a>
                    </div>
                </div>

            </div>
        </div>

    </form>



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
