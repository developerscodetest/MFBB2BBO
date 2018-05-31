<%@ Page Title="" Language="C#" MasterPageFile="~/Salesmanagement/SalesManagement.Master" AutoEventWireup="true" CodeBehind="AllBookings.aspx.cs" Inherits="MFBDBO.Salesmanagement.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SalesPlaceHolder" runat="server">

   <section class="content-header">
        <h1>Dashboard
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Dashboard</li>
        </ol>
    </section>
     <section class="content">        
    <div class="box">
        <div class="box-header">
            <h3 class="box-title">All Agents</h3>
        </div>
        <div class="box-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <div class="col-md-4">
                            <select class="form-control select2" style="width: 100%;">
                                <option selected="selected">All Agents</option>
                                <option>Alaska</option>
                                <option>California</option>
                                <option>Delaware</option>
                                <option>Tennessee</option>
                                <option>Texas</option>
                                <option>Washington</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group date">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" class="form-control pull-right" id="datepicker1">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group date">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" class="form-control pull-right" id="datepicker2">
                            </div>
                        </div>
                        <div class="col-md-1">
                            <div class="input-group">
                                <button type="button" class="btn btn-block btn-success">Search</button>
                            </div>
                        </div>
                        <div class="col-md-1">
                            <div class="input-group">
                                <button type="button" class="btn btn-block btn-danger">Reset</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- /.box-header -->
        <div class="box-body">
            <table id="example1" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>Agent</th>
                        <th>Guest Name</th>
                        <th>Checkin</th>
                        <th>Supplier Name</th>
                        <th>Received</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>mfb2015</td>
                        <td>MyFirstBooking</td>
                        <td>Ramesh</td>
                        <td>05/10/2015</td>
                        <td>
                            <label class="label label-success">GRN CONNECT</label></td>
                        <td>
                            <label class="label label-warning">ONLINE</label></td>
                        <td>
                            <a href="#"><small class="fa fa-eye"></small></a>
                            <a href="#"><small class="fa fa-trash"></small></a>
                            <a href="#"><small class="fa fa-edit"></small></a>
                            <a href="#"><small class="fa fa-credit-card"></small></a>
                        </td>
                    </tr>
                    <tr>
                        <td>mfb2015</td>
                         <td>KVR Travels</td>
                        <td>Ramesh</td>
                        <td>05/10/2015</td>
                        <td>
                            <label class="label label-success">REZLIVE</label></td>
                        <td>
                            <label class="label label-warning">ONLINE</label></td>
                        <td>
                            <a href="#"><small class="fa fa-eye"></small></a>
                            <a href="#"><small class="fa fa-trash"></small></a>
                            <a href="#"><small class="fa fa-edit"></small></a>
                            <a href="#"><small class="fa fa-credit-card"></small></a>
                        </td>
                    </tr>
                    <tr>
                        <td>mfb2015</td>
                         <td>Umar Travels</td>
                        <td>Ramesh</td>
                        <td>05/10/2015</td>
                        <td>
                            <label class="label label-success">REZLIVE</label></td>
                        <td>
                            <label class="label label-warning">OFFLINE</label></td>
                        <td>
                            <a href="#"><small class="fa fa-eye"></small></a>
                            <a href="#"><small class="fa fa-trash"></small></a>
                            <a href="#"><small class="fa fa-edit"></small></a>
                            <a href="#"><small class="fa fa-credit-card"></small></a>
                        </td>
                    </tr>
                    <tr>
                        <td>mfb2015</td>
                        <td>My First Booking</td>
                        <td>Ramesh</td>
                        <td>05/10/2015</td>
                        <td>
                            <label class="label label-success">GRN CONNECT</label></td>
                        <td>
                            <label class="label label-warning">ONLINE</label></td>
                        <td>
                            <a href="#"><small class="fa fa-eye"></small></a>
                            <a href="#"><small class="fa fa-trash"></small></a>
                            <a href="#"><small class="fa fa-edit"></small></a>
                            <a href="#"><small class="fa fa-credit-card"></small></a>
                        </td>
                    </tr>
                    <tr>
                        <td>mfb2015</td>
                        <td>Blue Star Travels</td>
                        <td>Ramesh</td>
                        <td>05/10/2015</td>
                        <td>
                            <label class="label label-success">REZLIVE</label></td>
                        <td>
                            <label class="label label-warning">ONLINE</label></td>
                        <td>
                            <a href="#"><small class="fa fa-eye"></small></a>
                            <a href="#"><small class="fa fa-trash"></small></a>
                            <a href="#"><small class="fa fa-edit"></small></a>
                            <a href="#"><small class="fa fa-credit-card"></small></a>
                        </td>
                    </tr>
                    <tr>
                        <td>mfb2015</td>
                        <td>Air India</td>
                        <td>Ramesh</td>
                        <td>05/10/2015</td>
                        <td>
                            <label class="label label-success">REZLIVE</label></td>
                        <td>
                            <label class="label label-warning">OFFLINE</label></td>
                        <td>
                            <a href="#"><small class="fa fa-eye"></small></a>
                            <a href="#"><small class="fa fa-trash"></small></a>
                            <a href="#"><small class="fa fa-edit"></small></a>
                            <a href="#"><small class="fa fa-credit-card"></small></a>
                        </td>
                    </tr>
                    <tr>
                        <td>mfb2015</td>
                        <td>My Show Bookings</td>
                        <td>Ramesh</td>
                        <td>05/10/2015</td>
                        <td>
                            <label class="label label-success">GRN CONNECT</label></td>
                        <td>
                            <label class="label label-warning">ONLINE</label></td>
                        <td>
                            <a href="#"><small class="fa fa-eye"></small></a>
                            <a href="#"><small class="fa fa-trash"></small></a>
                            <a href="#"><small class="fa fa-edit"></small></a>
                            <a href="#"><small class="fa fa-credit-card"></small></a>
                        </td>
                    </tr>
                    <tr>
                        <td>mfb2015</td>
                        <td>My First Booking</td>
                        <td>Ramesh</td>
                        <td>05/10/2015</td>
                        <td>
                            <label class="label label-success">REZLIVE</label></td>
                        <td>
                            <label class="label label-warning">ONLINE</label></td>
                        <td>
                            <a href="#"><small class="fa fa-eye"></small></a>
                            <a href="#"><small class="fa fa-trash"></small></a>
                            <a href="#"><small class="fa fa-edit"></small></a>
                            <a href="#"><small class="fa fa-credit-card"></small></a>
                        </td>
                    </tr>
                    <tr>
                        <td>mfb2015</td>
                        <td>Dinesh Travels</td>
                        <td>Ramesh</td>
                        <td>05/10/2015</td>
                        <td>
                            <label class="label label-success">REZLIVE</label></td>
                        <td>
                            <label class="label label-warning">OFFLINE</label></td>
                        <td>
                            <a href="#"><small class="fa fa-eye"></small></a>
                            <a href="#"><small class="fa fa-trash"></small></a>
                            <a href="#"><small class="fa fa-edit"></small></a>
                            <a href="#"><small class="fa fa-credit-card"></small></a>
                        </td>
                    </tr>
                    <tr>
                        <td>mfb2015</td>
                        <td>Dinesh Travels</td>
                        <td>Ramesh</td>
                        <td>05/10/2015</td>
                        <td>
                            <label class="label label-success">GRN CONNECT</label></td>
                        <td>
                            <label class="label label-warning">ONLINE</label></td>
                        <td>
                            <a href="#"><small class="fa fa-eye"></small></a>
                            <a href="#"><small class="fa fa-trash"></small></a>
                            <a href="#"><small class="fa fa-edit"></small></a>
                            <a href="#"><small class="fa fa-credit-card"></small></a>
                        </td>
                    </tr>
                    <tr>
                        <td>mfb2015</td>
                        <td>Sunshaine Travels</td>
                        <td>Ramesh</td>
                        <td>05/10/2015</td>
                        <td>
                            <label class="label label-success">REZLIVE</label></td>
                        <td>
                            <label class="label label-warning">ONLINE</label></td>
                        <td>
                            <a href="#"><small class="fa fa-eye"></small></a>
                            <a href="#"><small class="fa fa-trash"></small></a>
                            <a href="#"><small class="fa fa-edit"></small></a>
                            <a href="#"><small class="fa fa-credit-card"></small></a>
                        </td>
                    </tr>
                    <tr>
                        <td>mfb2015</td>
                        <td>Sunshaine Travels</td>
                        <td>Ramesh</td>
                        <td>05/10/2015</td>
                        <td>
                            <label class="label label-success">REZLIVE</label></td>
                        <td>
                            <label class="label label-warning">OFFLINE</label></td>
                        <td>
                            <a href="#"><small class="fa fa-eye"></small></a>
                            <a href="#"><small class="fa fa-trash"></small></a>
                            <a href="#"><small class="fa fa-edit"></small></a>
                            <a href="#"><small class="fa fa-credit-card"></small></a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- /.box-body -->
    </div> 
          
            </section>  
</asp:Content>
