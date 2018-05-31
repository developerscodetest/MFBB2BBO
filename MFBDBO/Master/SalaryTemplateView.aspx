<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="SalaryTemplateView.aspx.cs" Inherits="MFBDBO.Master.SalaryTemplateView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    <form runat="server">
        <section class="content-header">
            <h1>View</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">Payroll Management</li>
                <li class="#">Salary Template</li>
                <li class="active">View</li>
            </ol>
        </section>
        <section class="content">
            <div class="box box-body">
                <!-- Info boxes -->
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <asp:Label ID="lblFromDate" class="control-label required" runat="server" Text="Agent"><b>From Date :</b></asp:Label>
                        <div class="input-group date">
                            <asp:TextBox ID="txtFDate" type="date" CssClass="form-control" runat="server"></asp:TextBox>
                            <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-md-4">
                        <asp:Label ID="lblToDate" class="control-label required" runat="server" Text="To Date"><b>To Date :</b></asp:Label>
                        <div class="input-group date">
                            <asp:TextBox ID="txtTDate" type="date" CssClass="form-control" runat="server"></asp:TextBox>
                            <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-md-4">
                        <asp:Label ID="lblMTemplate" class="control-label required" runat="server" Text="Management Template"><b>Management Template :</b></asp:Label>
                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <p>&nbsp;</p>
                <!-- Begin form2-->
                <div class="box-title">
                    <h4>Management Template</h4>
                </div>
                <hr />
                <form class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group col-md-5">
                                <asp:Label ID="lblLName" runat="server" Text="Label Name "><b>Label Name :</b><span style="color:red;">*</span> </asp:Label>
                                <asp:TextBox ID="txtLName" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-5">
                                <asp:Label ID="lblPercentage" runat="server" Text="Percentage "><b>Percentage :</b><span style="color:red;">*</span> </asp:Label>
                                <asp:TextBox ID="txtPercentage" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-2" style="margin-top: 25px;">
                                <asp:Label ID="lblClose" class="btn btn-danger fa fa-close" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group col-md-5">
                                <asp:Label ID="lblLName2" runat="server" Text="Label Name "><b>Label Name :</b><span style="color:red;">*</span> </asp:Label>
                                <asp:TextBox ID="txtLName2" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-5">
                                <asp:Label ID="lblPercentage2" runat="server" Text="Percentage "><b>Percentage :</b><span style="color:red;">*</span> </asp:Label>
                                <asp:TextBox ID="txtPercentage2" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-2" style="margin-top: 25px;">
                                <asp:Label ID="lblClose2" class="btn btn-danger fa fa-close" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <!--2nd Row-->
                    <div class="row">
                        <div class="col-md-6">
                            <div class="col-md-5">
                                <asp:Label ID="lblEarnings" class="btn btn-success fa fa-plus-circle" runat="server" Text="Earnings"> Earnings</asp:Label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-5">
                                <asp:Label ID="lblDeductions" class="btn btn-danger fa fa-minus-circle" runat="server" Text="Deductions"> Deductions</asp:Label>

                            </div>
                        </div>
                    </div>
                </form>
                <!-- End form2-->
                <hr />
                <div class="col-md-6 modal-footer pull-right">
                    <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" Style="width: 100px" />
                    <asp:Button ID="btnReset" class="btn btn-danger" runat="server" Text="Reset" Style="width: 100px" />
                    <asp:Button ID="btnBack" class="btn btn-danger" PostBackUrl="~/Master/SalaryTemplate.aspx" runat="server" Text="Back" Style="width: 100px" />

                </div>
                <!-- /.box-body-->
            </div>
        </section>

    </form>
</asp:Content>
