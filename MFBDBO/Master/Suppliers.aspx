<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="Suppliers.aspx.cs" Inherits="MFBDBO.Master.Suppliers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    <form runat="server">
        <section class="content-header">
            <h1>Suppliers</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Suppliers</li>
            </ol>
        </section>

        <section class="content">
            <div class="box">
                <div class="row">
                    <div class="col-xs-12">
                          <div class="box-header with-border">
                            <h4 class="box-title">Supplier Details</h4>
                        </div>
                        <div class="box-body">
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <asp:Label ID="lblAgency" class="control-label" runat="server" Text="Agency"><b>Agency : </b></asp:Label>
                                    <asp:TextBox ID="txtAgency" CssClass="form-control" placeholder="Enter Agency" runat="server"></asp:TextBox>
                                </div>
                                 <div class="col-md-4">
                                    <asp:Label ID="lblName" class="control-label" runat="server" Text="Name"><b>Name :</b></asp:Label>
                                    <asp:TextBox ID="txtName" placeholder="Enter Name" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblEmail" class="control-label" runat="server" Text="Email"><b>Email :</b></asp:Label>
                                    <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Enter Email" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <asp:Label ID="lblMobile" class="control-label" runat="server" Text="Mobile No"><b>Mobile No :</b></asp:Label>
                                    <asp:TextBox ID="txtMobile" placeholder="Enter Mobile No" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                 <div class="col-md-8">
                                    <asp:Label ID="lblAddress" class="control-label" runat="server" Text="Address"><b>Address :</b></asp:Label>
                                  <textarea class="form-control" rows="2"></textarea>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <!--API Details-->
                        <div class="box-header with-border">
                            <h4 class="box-title">API Details</h4>
                        </div>
                        <div class="box-body">
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <asp:Label ID="lblAPIPurchaseDate" class="control-label" runat="server" Text="API Purchase Date"><b>Api Purchase Date :</b></asp:Label>
                                    <div class="input-group date">
                                        <asp:TextBox ID="txtAPDate" type="date" CssClass="form-control" runat="server"></asp:TextBox>
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblAPIKey" class="control-label" runat="server" Text="API Key"><b>API Key :</b></asp:Label>
                                    <asp:TextBox ID="txtAPIKey" placeholder="Enter API Key" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblAPValue" class="control-label" runat="server" Text="API Purchase Value"><b>API Purchase Value :</b></asp:Label>
                                    <asp:TextBox ID="txtAPValue" placeholder="Enter API Purchase Value" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>

                           <!--Access Details-->
                        <div class="box-header with-border">
                            <h4 class="box-title">Access Details</h4>
                        </div>
                        <div class="box-body">
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <asp:Label ID="lblALink" class="control-label" runat="server" Text="Agent Link"><b>Agent Link :</b></asp:Label>
                                     <asp:TextBox ID="txtALink" placeholder="Enter Agent Link" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblACode" class="control-label" runat="server" Text="Agent Code"><b>Agent Code :</b></asp:Label>
                                    <asp:TextBox ID="txtACode" placeholder="Enter Agent Code" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblUserName" class="control-label" runat="server" Text="Username"><b>Username :</b></asp:Label>
                                    <asp:TextBox ID="txtUserName" placeholder="Enter Username" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                             <div class="form-group row">
                                <div class="col-md-4">
                                    <asp:Label ID="lblPassword" class="control-label" runat="server" Text="Password"><b>Password:</b></asp:Label>
                                     <asp:TextBox ID="txtPassword" placeholder="Enter Password" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                   <div class="clearfix"></div>
                            </div>
                        </div>

                        <!--Contact Details-->
                        <div class="box-header with-border">
                            <h4 class="box-title">Contact Details</h4>
                        </div>
                        <div class="box-body">
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <asp:Label ID="lblAccounts" class="control-label" runat="server" Text="Accounts"><b>Accounts :</b></asp:Label>
                                    <asp:TextBox ID="txtAName" placeholder="Enter Name" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblOperations" class="control-label" runat="server" Text="Operations"><b>Operations :</b></asp:Label>
                                    <asp:TextBox ID="txtOperationsName" placeholder="Enter Name" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblManagement" class="control-label" runat="server" Text="Management"><b>Management :</b></asp:Label>
                                    <asp:TextBox ID="txtManagementName" placeholder="Enter Name" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-1"></div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtAEmail" placeholder="Enter Email" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtOEmail" placeholder="Enter Email" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtMEmail" placeholder="Enter Email" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtANumber" placeholder="Enter Number" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtONumber" placeholder="Enter Number" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtMNumber" placeholder="Enter Number" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <!--buttons-->
                        <div style="text-align: right">
                            <asp:Button ID="btnSave" class="btn btn-success" runat="server" Text="Save" Style="width: 90px" />
                            <asp:Button ID="btnReset" class="btn btn-danger" runat="server" Text="Reset" Style="width: 90px" />
                            <asp:Button ID="btnBack" class="btn btn-danger" PostBackUrl="SuppliersList.aspx" runat="server" Text="Back" Style="width: 90px" />
                        </div>
                        <br />

                    </div>
                </div>


            </div>
        </section>



    </form>
</asp:Content>
