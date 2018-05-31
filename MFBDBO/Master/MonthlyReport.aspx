<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="MonthlyReport.aspx.cs" Inherits="MFBDBO.Master.MonthlyReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Select2 -->
    <link rel="stylesheet" href="../../plugins/select2/select2.min.css">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    <form runat="server">
        <section class="content-header">
            <h1>Monthly Report</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">HRM</li>
                <li class="#">Attendance</li>
                <li class="active">Monthly Report</li>
            </ol>
        </section>
        <section class="content">
            <div class="box box-body">
                <div class="box-header"></div>
                <form>
                    <div class="form-group row">
                        <div class="col-md-5">
                            <asp:Label ID="lblSMonth" class="control-label col-sm-4" runat="server" Text="SELECT MONTH"><b>SELECT MONTH :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <select class="form-control select2">
                                    <option>--select--</option>
                                    <option>January</option>
                                    <option>February</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <asp:Label ID="lblSYear" class="control-label col-sm-4" runat="server" Text="Select Year"><b>SELECT YEAR :</b>
                              <span style="color: red;">*</span></asp:Label>
                            <div class="col-sm-8">
                                <select class="form-control select2">
                                    <option>--select--</option>
                                    <option></option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group pull-right">
                                <asp:Button ID="btnGetAttendance" class="btn btn-primary" runat="server" Text="Get Attendance" />
                            </div>

                        </div>
                    </div>

                </form>
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



    </form>
</asp:Content>
