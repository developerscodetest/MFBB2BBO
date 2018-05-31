<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="Payslips.aspx.cs" Inherits="MFBDBO.Master.Payslips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Select2 -->
    <link rel="stylesheet" href="../../plugins/select2/select2.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    <form runat="server">
        <section class="content-header">
            <h1>Payslips</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">Payroll Management</li>
                <li class="active">Payslips</li>
            </ol>
        </section>
        <section class="content">
            <div class="box box-body">
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
                                <asp:Button ID="btnGeneratePayslip" class="btn btn-primary" runat="server" Text="Generate Payslip" />
                            </div>
                        </div>
                    </div>
                </form>
                <!--2nd row--->
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
