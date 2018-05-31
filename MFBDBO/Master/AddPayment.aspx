<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="AddPayment.aspx.cs" Inherits="MFBDBO.Master.AddPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    <form runat="server">
        <section class="content-header">
            <h1>Add Payment</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Add Payment</li>
            </ol>
        </section>
        <section class="content">
            <div class="box">
                <!-- /.box-header -->
                <div class="box-header">
                    <h3 class="box-title"></h3>
                </div>
                <!-- /.box-body -->
                <div class="box-body">
                    <div class="form-row">
                        <div class="form-group col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <asp:Label ID="lblCompany" class="control-label col-md-4 required" runat="server" Text="Company"><b>Company :</b></asp:Label>
                            <div class="col-md-8">
                               <select class="form-control select2">
                                   <option>--Select--</option>
                                   <option></option>
                               </select>
                                
                                 </div>
                        </div>
                       <div class="form-group col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <asp:Label ID="lblPI" class="control-label col-md-4 required" runat="server" Text="Pending Invoice"><b>Pending Invoice :</b></asp:Label>
                            <div class="col-md-8">
                               <select class="form-control select2">
                                   <option>--Select--</option>
                                   <option></option>
                               </select>
                                
                                 </div>
                        </div>            
                    </div>
                    <!--2nd Row-->
                     <div class="form-row">
                        <div class="form-group col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <asp:Label ID="lblDue" class="control-label col-md-4 required" runat="server" Text="Due"><b> Due :</b></asp:Label>
                            <div class="col-md-8">
                <asp:TextBox ID="txtDue" CssClass="form-control" disabled runat="server"></asp:TextBox>
                                 </div>
                        </div>
                       <div class="form-group col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <asp:Label ID="lblPA" class="control-label col-md-4 required" runat="server" Text="Paying Amount"><b>Paying Amount :</b></asp:Label>
                            <div class="col-md-8">
                        <asp:TextBox ID="txtEA" CssClass="form-control" placeholder="Enter Amount" runat="server"></asp:TextBox>
                                 </div>
                        </div>            
                    </div>
                     <!--3rd Row-->
                     <div class="form-row">
                         <div class="form-group col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <asp:Label ID="lblTN" class="control-label col-md-4 required" runat="server" Text="Transaction Number"><b>Transaction Number :</b></asp:Label>
                            <div class="col-md-8">
                        <asp:TextBox ID="txtTN" CssClass="form-control" placeholder="Enter Transaction Number" runat="server"></asp:TextBox>
                                 </div>
                        </div>
                       <div class="form-group col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <asp:Label ID="lblPM" class="control-label col-md-4 required" runat="server" Text="Payment Mode"><b>Payment Mode:</b></asp:Label>
                            <div class="col-md-8">
                               <select class="form-control select2">
                                   <option>--Select--</option>
                                   <option></option>
                               </select>
                                
                                 </div>
                        </div>                
                    </div>
                      <!--4th Row-->
                     <div class="form-row">
                 <div class="form-group col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <asp:Label ID="lblPT" class="control-label col-md-4 required" runat="server" Text="Payment Mode"><b>Payment Type:</b></asp:Label>
                            <div class="col-md-8">
                               <select class="form-control select2">
                                   <option>--Select--</option>
                                   <option></option>
                               </select>
                                
                                 </div>
                        </div> 
                         <div class="form-group col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <asp:Label ID="lblRN" class="control-label col-md-4 required" runat="server" Text="Reference Number"><b>Reference Number :</b></asp:Label>
                            <div class="col-md-8">
                        <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="Enter Reference Number" runat="server"></asp:TextBox>
                                 </div>
                        </div>
                                   
                    </div>
                     <!--4th Row-->
                     <div class="form-row">
 <div class="form-group col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <asp:Label ID="lblBalance" class="control-label col-md-4 required" runat="server" Text="Balance"><b>Balance :</b></asp:Label>
                            <div class="col-md-8">
                     <asp:Label ID="Label2" class="control-label col-md-4 required" runat="server" Text="Balance"><span style="font-size:20px;">10000 /-</span></asp:Label>
                                 </div>
                        </div>
    
                    </div>

                  
                        <div class="form-group pull-right col-md-3 col-md-offset-9" style="margin-top: 20px;">
                            <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" Style="width: 100px;" />
                               <asp:Button ID="btnBack" class="btn btn-danger" PostBackUrl="PaymentsList.aspx" runat="server" Text="Back" Style="width: 100px;" />
                        </div>
                   
                </div>
            </div>

        </section>

    </form>
</asp:Content>
