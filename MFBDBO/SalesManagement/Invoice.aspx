<%@ Page Title="" Language="C#" MasterPageFile="~/Salesmanagement/SalesManagement.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="MFBDBO.Salesmanagement.Invoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SalesPlaceHolder" runat="server">
    <section class="content-header">
        <h1>Invoice</h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Invoice</li>
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
  
                   <div class="row">
                   <div class="form-group col-md-4">
                       <label class="control-label">From Date :</label>
                   <asp:TextBox ID="txtDate1" type="date" CssClass="form-control"  runat="server"></asp:TextBox>
                   </div>
                        <div class="form-group col-md-4">
                    <label class="control-label">To Date :</label>
                   <asp:TextBox ID="txtDate2" type="date" CssClass="form-control"  runat="server"></asp:TextBox>
                   </div>
               <div class="form-group col-md-4">
                 <label class="control-label">Invoice :</label>
                   <select class="form-control">
                       <option>--Select--</option>
                        <option></option>
                        <option></option>
                        <option></option>
                   </select>
               </div>
                    </div>
               



                <table id="InvoiceTable" class="table table-bordered datatable table-striped">
                    <thead>
                        <tr>
                            <th>Invoice No</th>
                            <th>Invoice Date</th>
                            <th>Due Date</th>
                            <th>Agency</th>
                            <th>Agent</th>
                            <th>Mobile</th>
                            <th>Sales Exe</th>
                            <th>Amount</th>
                            <th>Paid</th>
                            <th>Due</th>
                             <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>INV001</td>
                            <td>1-05-2018</td>
                            <td>31-05-2018</td>
                            <td>SVR Services</td>
                              <td>Karthik</td>
                              <td>9876543210</td>
                              <td>Ramesh</td>
                              <td>20000</td>
                              <td>10000</td>
                              <td>10000</td>
                                <td>Due</td>

                            <td>
                              <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>View</a></li>
                                               
                                            </ul>
                                        </div>
                              
                            </td>
                        </tr>
                          <tr>
                            <td>INV001</td>
                            <td>1-05-2018</td>
                            <td>31-05-2018</td>
                            <td>SVR Services</td>
                              <td>Karthik</td>
                              <td>9876543210</td>
                              <td>Ramesh</td>
                              <td>20000</td>
                              <td>10000</td>
                              <td>10000</td>
                                 <td>Due</td>

                            <td>
                              <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>View</a></li>
                                               
                                            </ul>
                                        </div>
                              
                            </td>
                        </tr>
                         <tr>
                            <td>INV001</td>
                            <td>1-05-2018</td>
                            <td>31-05-2018</td>
                            <td>SVR Services</td>
                              <td>Karthik</td>
                              <td>9876543210</td>
                              <td>Ramesh</td>
                              <td>20000</td>
                              <td>10000</td>
                              <td>10000</td>
                                <td>Due</td>

                            <td>
                              <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                <li><a href="#"><i class="fa fa-file-text-o"></i>View</a></li>
                                               
                                            </ul>
                                        </div>
                              
                            </td>
                        </tr>
                    </tbody>
                </table>


            </div>
        </div>

    </section>
</asp:Content>
