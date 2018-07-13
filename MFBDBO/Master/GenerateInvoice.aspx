<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="GenerateInvoice.aspx.cs" Inherits="MFBDBO.Master.GenerateInvoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
  
        <section class="content-header">
            <h1>Generate Invoice</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Invoice Management</li>
                  <li class="active">Generate Invoice</li>
            </ol>
        </section>
        <section class="content">
            <div class="box">
                <div class="box-header">
                    <%--<h3 class="box-title"></h3>--%>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
               <div class="form-row">
                     <div class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12">
                            <asp:Label ID="Label1" class="control-label required" runat="server" Text="Agent"><b>Company :</b></asp:Label>
                            <select class="form-control select2">
                               
                            </select>
                        </div>
                         <div class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12">
                            <asp:Label ID="Label2" class="control-label required" runat="server" Text="Agent"><b>From Date :</b></asp:Label>
                         <asp:TextBox ID="TextBox1" type="date" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12">
                            <asp:Label ID="Label3" class="control-label required" runat="server" Text="Agent"><b>To Date :</b></asp:Label>
                            <asp:TextBox ID="TextBox2" type="date" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                       <div class="form-group col-xl-2 col-lg-2 col-md-2 col-sm-12 col-12" style="margin-top: 20px;">
                            <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Search" Style="width: 100px;" />
                        </div>
                    </div>
       <!--2nd Row-->

                    <!--Table-->
                     <!--Table-->
                   <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Booking Details</th>
                                <th>Hotel</th>
                                <th>Guest</th>
                                <th>Amount</th>
                                <th>Reference</th>
                               
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                             <td>
                           <span><b> ID : </b> 123456</span><br />
                          <span><b>Recieved : </b> Online</span>
                                </td>
                               
                                <td style="width:20%;">Taj Krishna<br />
                       <span><b>Address : </b> 1st Floor ,B -Wing, Gopal Place, Satellite Road, Ahmedabad, Gujarat 380015</span><br />
                        
                                </td>
                               
                                <td>Ramesh<br />
                                    <span><b>Check-In : </b>20-05-2018</span><br />
                                    <span><b>Check-Out : </b>25-05-2018</span>

                                </td>
                              <td>10000</td>
                                
                                <td><span><b>Confirm  : </b>123456</span><br />
                                    <span><b>Reconfirm : </b>NA</span><br />
                                    <span><b>Voucher : </b> 1243657</span>
                                </td>
                            </tr>
                           
                        </tbody>   
                    </table>
  <div class="form-group col-md-5 col-md-offset-7">
                        <div class="col-md-4">
                            <asp:Label ID="lblTI" CssClass="control-label" runat="server" Text="Total Incentive"><b>Total Amount : </b></asp:Label>
                        </div>
                        <div class="col-md-8">
                            <asp:TextBox ID="txtDisable" CssClass="form-control" disabled runat="server"></asp:TextBox>
                        </div>
                    </div>
                     <div class="form-group pull-right">
                        <asp:Button ID="btnGI" CssClass="btn btn-primary" PostBackUrl="" runat="server" Text="Generate Invoice" />

                    </div>
                </div>
                <!-- /.box-body -->
            </div>

        </section>

      
</asp:Content>
