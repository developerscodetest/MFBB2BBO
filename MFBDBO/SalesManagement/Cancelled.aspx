<%@ Page Title="" Language="C#" MasterPageFile="~/Salesmanagement/SalesManagement.Master" AutoEventWireup="true" CodeBehind="Cancelled.aspx.cs" Inherits="MFBDBO.Salesmanagement.WebForm5" %>
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
            <h3 class="box-title">Cancelled</h3>
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
                        <th>BookingID</th>
                        <th>Destination & Hotel</th>
                        <th>Checkin</th>
                        <th>Cancelation Date</th>
                        <th>Client</th>
                        <th>Reconfirmation</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>mfb201555</td>
                        <td>Destination : Hyderabad<br />Hotel:Taj Pride Hotel</td>
                        <td>05/10/2015</td>
                        <td>11/10/2015</td>
                        <td>
                            <label class="label label-success">ATTT</label></td>
                        <td>
                            <label class="label label-warning">STAFF:RAJESH</label><br />
                            <label class="label label-success">RECONFIRMATION:104056</label>
                        </td>
                        <td>
                            <a href="#"><small class="fa fa-eye"></small></a>
                            <a href="#"><small class="fa fa-edit"></small></a>
                            <a href="#"><small class="fa fa-credit-card"></small></a>
                        </td>
                    </tr>
                    <tr>
                        <td>mfb201555</td>
                        <td>Destination : Hyderabad<br />Hotel:Taj Pride Hotel</td>
                        <td>05/10/2015</td>
                         <td>10/10/2015</td>
                        <td>
                            <label class="label label-success">ATTT</label></td>
                        <td>
                            <label class="label label-warning">STAFF:RAJESH</label><br />
                            <label class="label label-success">RECONFIRMATION:104056</label>
                        </td>
                        <td>
                            <a href="#"><small class="fa fa-eye"></small></a>
                            <a href="#"><small class="fa fa-edit"></small></a>
                            <a href="#"><small class="fa fa-credit-card"></small></a>
                        </td>
                    </tr>
                    <tr>
                        <td>mfb201555</td>
                        <td>Destination : Hyderabad<br />Hotel:Taj Pride Hotel</td>
                        <td>05/10/2015</td>
                         <td>09/10/2015</td>
                        <td>
                            <label class="label label-success">ATTT</label></td>
                        <td>
                            <label class="label label-warning">STAFF:RAJESH</label><br />
                            <label class="label label-success">RECONFIRMATION:104056</label>
                        </td>
                        <td>
                            <a href="#"><small class="fa fa-eye"></small></a>
                            <a href="#"><small class="fa fa-edit"></small></a>
                            <a href="#"><small class="fa fa-credit-card"></small></a>
                        </td>
                    </tr>
                    <tr>
                        <td>mfb201555</td>
                        <td>Destination : Hyderabad<br />Hotel:Taj Pride Hotel</td>
                        <td>05/10/2015</td>
                         <td>08/10/2015</td>
                        <td>
                            <label class="label label-success">ATTT</label></td>
                        <td>
                            <label class="label label-warning">STAFF:RAJESH</label><br />
                            <label class="label label-success">RECONFIRMATION:104056</label>
                        </td>
                        <td>
                            <a href="#"><small class="fa fa-eye"></small></a>
                            <a href="#"><small class="fa fa-edit"></small></a>
                            <a href="#"><small class="fa fa-credit-card"></small></a>
                        </td>
                    </tr>
                    <tr>
                        <td>mfb201555</td>
                        <td>Destination : Hyderabad<br />Hotel:Taj Pride Hotel</td>
                        <td>05/10/2015</td>
                         <td>07/10/2015</td>
                        <td>
                            <label class="label label-success">ATTT</label></td>
                        <td>
                            <label class="label label-warning">STAFF:RAJESH</label><br />
                            <label class="label label-success">RECONFIRMATION:104056</label>
                        </td>
                        <td>
                            <a href="#"><small class="fa fa-eye"></small></a>
                            <a href="#"><small class="fa fa-edit"></small></a>
                            <a href="#"><small class="fa fa-credit-card"></small></a>
                        </td>
                    </tr>
                    <tr>
                        <td>mfb201555</td>
                        <td>Destination : Hyderabad<br />Hotel:Taj Pride Hotel</td>
                        <td>05/10/2015</td>
                         <td>11/10/2015</td>
                        <td>
                            <label class="label label-success">ATTT</label></td>
                        <td>
                            <label class="label label-warning">STAFF:RAJESH</label><br />
                            <label class="label label-success">RECONFIRMATION:104056</label>
                        </td>
                        <td>
                            <a href="#"><small class="fa fa-eye"></small></a>
                            <a href="#"><small class="fa fa-edit"></small></a>
                            <a href="#"><small class="fa fa-credit-card"></small></a>
                        </td>
                    </tr>
                    <tr>
                        <td>mfb201555</td>
                        <td>Destination : Hyderabad<br />Hotel:Taj Pride Hotel</td>
                        <td>05/10/2015</td>
                         <td>12/10/2015</td>
                        <td>
                            <label class="label label-success">ATTT</label></td>
                        <td>
                            <label class="label label-warning">STAFF:RAJESH</label><br />
                            <label class="label label-success">RECONFIRMATION:104056</label>
                        </td>
                        <td>
                            <a href="#"><small class="fa fa-eye"></small></a>
                            <a href="#"><small class="fa fa-edit"></small></a>
                            <a href="#"><small class="fa fa-credit-card"></small></a>
                        </td>
                    </tr>
                    <tr>
                        <td>mfb201555</td>
                        <td>Destination : Hyderabad<br />Hotel:Taj Pride Hotel</td>
                        <td>05/10/2015</td>
                         <td>9/10/2015</td>
                        <td>
                            <label class="label label-success">ATTT</label></td>
                        <td>
                            <label class="label label-warning">STAFF:RAJESH</label><br />
                            <label class="label label-success">RECONFIRMATION:104056</label>
                        </td>
                        <td>
                            <a href="#"><small class="fa fa-eye"></small></a>
                            <a href="#"><small class="fa fa-edit"></small></a>
                            <a href="#"><small class="fa fa-credit-card"></small></a>
                        </td>
                    </tr>
                    <tr>
                        <td>mfb201555</td>
                        <td>Destination : Hyderabad<br />Hotel:Taj Pride Hotel</td>
                        <td>05/10/2015</td>
                         <td>08/10/2015</td>
                        <td>
                            <label class="label label-success">ATTT</label></td>
                        <td>
                            <label class="label label-warning">STAFF:RAJESH</label><br />
                            <label class="label label-success">RECONFIRMATION:104056</label>
                        </td>
                        <td>
                            <a href="#"><small class="fa fa-eye"></small></a>
                            <a href="#"><small class="fa fa-edit"></small></a>
                            <a href="#"><small class="fa fa-credit-card"></small></a>
                        </td>
                    </tr>
                    <tr>
                        <td>mfb201555</td>
                        <td>Destination : Hyderabad<br />Hotel:Taj Pride Hotel</td>
                        <td>05/10/2015</td>
                         <td>14/10/2015</td>
                        <td>
                            <label class="label label-success">ATTT</label></td>
                        <td>
                            <label class="label label-warning">STAFF:RAJESH</label><br />
                            <label class="label label-success">RECONFIRMATION:104056</label>
                        </td>
                        <td>
                            <a href="#"><small class="fa fa-eye"></small></a>
                            <a href="#"><small class="fa fa-edit"></small></a>
                            <a href="#"><small class="fa fa-credit-card"></small></a>
                        </td>
                    </tr>
                    <tr>
                        <td>mfb201555</td>
                        <td>Destination : Hyderabad<br />Hotel:Taj Pride Hotel</td>
                        <td>05/10/2015</td>
                         <td>10/10/2015</td>
                        <td>
                            <label class="label label-success">ATTT</label></td>
                        <td>
                            <label class="label label-warning">STAFF:RAJESH</label><br />
                            <label class="label label-success">RECONFIRMATION:104056</label>
                        </td>
                        <td>
                            <a href="#"><small class="fa fa-eye"></small></a>
                            <a href="#"><small class="fa fa-edit"></small></a>
                            <a href="#"><small class="fa fa-credit-card"></small></a>
                        </td>
                    </tr>
                    <tr>
                        <td>mfb201555</td>
                        <td>Destination : Hyderabad<br />Hotel:Taj Pride Hotel</td>
                        <td>05/10/2015</td>
                         <td>08/10/2015</td>
                        <td>
                            <label class="label label-success">ATTT</label></td>
                        <td>
                            <label class="label label-warning">STAFF:RAJESH</label><br />
                            <label class="label label-success">RECONFIRMATION:104056</label>
                        </td>
                        <td>
                            <a href="#"><small class="fa fa-eye"></small></a>
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
