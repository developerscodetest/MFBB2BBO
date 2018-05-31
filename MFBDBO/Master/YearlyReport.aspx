<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="YearlyReport.aspx.cs" Inherits="MFBDBO.Master.YearlyReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    <form runat="server">
        <section class="content-header">
            <h1>Yearly Report</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">HRM</li>
                <li class="#">Attendance</li>
                <li class="active">Yearly Report</li>
            </ol>
        </section>
        <section class="content">
            <div class="box box-body">
                <div class="box-header"></div>
                <div class="form-row">
                    <div class="form-group col-md-5">
                        <asp:Label ID="lblFromDate" class="control-label col-md-3" runat="server" Text="Agent"><b>FROM DATE</b></asp:Label>
                        <div class="col-md-9">
                            <div class="input-group date">
                                <asp:TextBox ID="txtFDate" type="date" CssClass="form-control" runat="server"></asp:TextBox>
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-md-5">
                        <asp:Label ID="lblToDate" class="control-label col-md-3" runat="server" Text="To Date"><b>TO DATE </b></asp:Label>
                        <div class="col-md-9">
                            <div class="input-group date">
                                <asp:TextBox ID="txtTDate" type="date" CssClass="form-control" runat="server"></asp:TextBox>
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group pull-right">
                            <asp:Button ID="btnGetAttendance" class="btn btn-primary" runat="server" Text="Get Attendance" />
                        </div>
                    </div>

                </div>
            </div>
        </section>

    </form>
</asp:Content>
