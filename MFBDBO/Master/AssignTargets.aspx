<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="AssignTargets.aspx.cs" Inherits="MFBDBO.Master.MonthlyTargetsList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
 <form id="form1" runat="server">
    <section class="content-header">
        <h1>Assign Targets
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
              <li class="#">Sales</li>
            <li class="active">Assign Targets</li>
        </ol>
    </section>
    <section class="content">
        <div class="box">
            <div class=" box-body">
                <div class="form-group row">
                    <div class="col-md-4">
                   <asp:Label ID="lblYear" class="control-label col-sm-4" runat="server" Text="Year"><b>Year :</b> <span style="color: red;">*</span></asp:Label>
                        <div class="col-sm-8">
                            <select class="form-control">
                                <option>--Select--</option>
                                <option>2016</option>
                                <option>2017</option>
                                <option>2018</option>
                                <option>2018</option>
                                <option>2019</option>
                                <option>2020</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-4">
                   <asp:Label ID="lblMonth" class="control-label col-sm-4" runat="server" Text="Month"><b>Month :</b> <span style="color: red;">*</span></asp:Label>
                        <div class="col-sm-8">
                            <select class="form-control">
                                <option>--Select--</option>
                                <option>Jan</option>
                                <option>Feb</option>
                                <option>March</option>
                                <option>April</option>
                                <option>May</option>
                                <option>June</option>

                            </select>
                        </div>
                    </div>
                    <div class="col-md-4">
                          <asp:Label ID="lblMT" class="control-label col-sm-4" runat="server" Text="Manager Target"><b> Target :</b> <span style="color: red;">*</span></asp:Label>                        
                   
                    <div class="col-sm-8">
                         <asp:TextBox ID="TextBox1" class="form-control" placeholder="Enter Amount" runat="server"></asp:TextBox>            
                    </div>
                         </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="box-header with-border">
                        <h3 class="box-title"><b>Assign Targets</b></h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group row">
                            <div class="col-md-12">
              <asp:Label ID="lblName" class="control-label col-sm-2" runat="server" Text="Name"><b>Anil :</b></asp:Label>
                                <div class="col-sm-5">
             <asp:TextBox ID="txtamount" class="form-control" placeholder="Enter Amount" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                                 <asp:Label ID="lblName2" class="control-label col-sm-2" runat="server" Text="Name"><b>Ramesh :</b></asp:Label>
                                <div class="col-sm-5">
                             <asp:TextBox ID="txtamount1" class="form-control" placeholder="Enter Amount"  runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                              <asp:Label ID="lblName3" class="control-label col-sm-2" runat="server" Text="Name"><b>Ganesh :</b></asp:Label>
                                <div class="col-sm-5">
                            <asp:TextBox ID="txtamount2" class="form-control" placeholder="Enter Amount"  runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                              <asp:Label ID="Label1" class="control-label col-sm-2" runat="server" Text="Name"><b>Anandh :</b></asp:Label>
                                <div class="col-sm-5">
                                <asp:TextBox ID="txtamount3" class="form-control" placeholder="Enter Amount"  runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div style="text-align: right">
                         <asp:Button ID="btnSave" class="btn btn-success"  runat="server" Text="Save" style="width: 90px" />
                          <asp:Button ID="btnReset" class="btn btn-danger"  runat="server" Text="Reset" style="width: 90px" />
                                             
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
</form>
</asp:Content>
