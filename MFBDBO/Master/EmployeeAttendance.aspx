<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="EmployeeAttendance.aspx.cs" Inherits="MFBDBO.Master.EmployeeAttendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Select2 -->
    <link rel="stylesheet" href="../../plugins/select2/select2.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
     
 <section class="content-header">
      <h1>Employee Attendamnce</h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="#">HRM</li>
            <li class="#">Attendance</li>
            <li class="active">Employee Attendance</li>
        </ol>
    </section>
     <section class="content">
         <div class="box box-body">
        <div class="box-header"></div>
                <!--1st row-->
                <form>
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblEmployee" class="control-label col-sm-3" runat="server" Text="EMPLOYEE"><b>EMPLOYEE </b>
                            </asp:Label>
                            <div class="col-sm-9">
                                <select class="form-control select2">
                                    <option>Select Employee</option>
                                    <option></option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblSMonth" class="control-label col-sm-3" runat="server" Text="SELECT MONTH"><b>SELECT MONTH </b>
                            </asp:Label>
                            <div class="col-sm-9">
                                <select class="form-control select2">
                                    <option>Select Month</option>
                                    <option>January</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblSYear" class="control-label col-sm-3" runat="server" Text="SELECT YEAR"><b>SELECT YEAR </b>
                            </asp:Label>
                            <div class="col-sm-9">
                                <select class="form-control select2">
                                    <option>Select Year</option>
                                    <option>2016</option>
                                    <option>2017</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group pull-right">
                                <asp:Button ID="btnGetAttendance" class="btn btn-primary" runat="server" Text="GetAttendance" />
                            </div>
                        </div>
                    </div>
                
             </div>
    </section>
  <!-- jQuery 2.2.3 -->
        <script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
       <!--Select2 script-->
      <script src="../../plugins/select2/select2.full.min.js"></script>

 <script type="text/javascript">
          
            //Select2 Function
            $(function () {
                $(".select2").select2();
            });

        </script>



</asp:Content>
