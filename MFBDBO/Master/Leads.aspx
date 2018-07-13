<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="Leads.aspx.cs" Inherits="MFBDBO.Master.Leads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .panel {
            border: 1px solid #eee !important;
        }

        .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover {
            color: #fff !important;
            cursor: default;
            background-color: #3c8dbc !important;
            border: 1px solid #ddd;
            border-bottom-color: transparent;
            border-radius: 0px !important;
        }

        .nav-tabs > li > a {
            margin-right: 2px;
            line-height: 1.42857143;
            border: 1px solid transparent;
            border-radius: 4px 4px 0 0;
            border-right: 1px solid #ddd !important;
        }

        .panel.with-nav-tabs .panel-heading {
            padding: 0px 0px 0 0px;
            border-bottom: 1px solid #eee;
        }

        .panel.with-nav-tabs .nav-tabs {
            border-bottom: none;
        }

        .panel.with-nav-tabs .nav-justified {
            margin-bottom: 0px;
        }

        .panel-primary {
            border-color: #ddd !important;
        }

        /*** PANEL PRIMARY ***/
        .with-nav-tabs.panel-primary .nav-tabs > li > a,
        .with-nav-tabs.panel-primary .nav-tabs > li > a:hover,
        .with-nav-tabs.panel-primary .nav-tabs > li > a:focus {
            color: #fff;
        }

            .with-nav-tabs.panel-primary .nav-tabs > .open > a,
            .with-nav-tabs.panel-primary .nav-tabs > .open > a:hover,
            .with-nav-tabs.panel-primary .nav-tabs > .open > a:focus,
            .with-nav-tabs.panel-primary .nav-tabs > li > a:hover,
            .with-nav-tabs.panel-primary .nav-tabs > li > a:focus {
                color: #fff;
                background-color: #3071a9;
                border-color: transparent;
                border-radius: 0px !important;
            }

        .with-nav-tabs.panel-primary .nav-tabs > li.active > a,
        .with-nav-tabs.panel-primary .nav-tabs > li.active > a:hover,
        .with-nav-tabs.panel-primary .nav-tabs > li.active > a:focus {
            color: #428bca;
            background-color: #fff;
            border-bottom-color: transparent;
        }

        .with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu {
            background-color: #428bca;
            border-color: #3071a9;
        }

            .with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > li > a {
                color: #fff;
            }

                .with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > li > a:hover,
                .with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > li > a:focus {
                    background-color: #3071a9;
                }

            .with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > .active > a,
            .with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > .active > a:hover,
            .with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > .active > a:focus {
                background-color: #4a9fe9;
            }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    
        <section class="content-header">
            <h1>Leads</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">Sales</li>
                <li class="active">Leads</li>
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
                    <!--1st row-->
                    <form>
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblAName" class="control-label col-sm-4" runat="server" Text="Label"><b>Agency Name :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtAName" class="form-control" placeholder="Enter Agency Name" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="lblCP" class="control-label col-sm-4" runat="server" Text="Contact Person"><b>Contact Person:</b> <span style="color: red;">*</span>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtContactPerson" class="form-control" placeholder="Enter Contact Person" runat="server"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                    

                    <!--2nd row-->

                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblMobile" class="control-label col-sm-4" runat="server" Text="Mobile No"><b>Mobile No :</b>
                              <span style="color: red;">*</span></asp:Label>

                            <div class="col-sm-8">
                                <asp:TextBox ID="txtMobileNo" class="form-control" placeholder="EnterMobile Number" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <asp:Label ID="lblEmail" class="control-label col-sm-4" runat="server" Text="Email"><b>Email :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtEmail" class="form-control" placeholder="Enter Email Address" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <!--3rd row--->
                    <div class="form-group col-md-12">
                        <div class="modal-footer pull-right">
                            <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" Style="width: 100px;" />
                            <asp:Button ID="Button1" class="btn btn-danger" runat="server" Text="Reset" Style="width: 100px;" />

                        </div>
                    </div>
                    <!--Begin Navbar Tabs --->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel with-nav-tabs">
                                <div class="panel-heading">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a href="#Leads" data-toggle="tab">Leads</a></li>
                                        <li><a href="#Callback" data-toggle="tab">Callback</a></li>
                                        <li><a href="#Interested" data-toggle="tab">Interested</a></li>
                                        <li><a href="#NotInterested" data-toggle="tab">Not Interested</a></li>
                                    </ul>
                                </div>
                                <div class="panel-body">
                                    <div class="tab-content">

                                        <!--Tab1-->
                                        <div class="tab-pane fade in active" id="Leads">
                                            <table id="LeadsTable" class="table table-bordered datatable table-striped" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th>Agency Name</th>
                                                        <th>Contact Person</th>
                                                        <th>Mobile</th>
                                                        <th>Email</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Priority Services</td>
                                                        <td>Ramesh</td>
                                                        <td>9876543210</td>
                                                        <td>ramesh123@gmail.com</td>
                                                        <td>
                                                            <div class="btn-group text-left">
                                                                <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu pull-right" role="menu">
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Call Back</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Interested</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Not Interested</a></li>
                                                                </ul>
                                                            </div>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Priority Services</td>
                                                        <td>Ramesh</td>
                                                        <td>9876543210</td>
                                                        <td>ramesh123@gmail.com</td>
                                                        <td>
                                                            <div class="btn-group text-left">
                                                                <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu pull-right" role="menu">
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Call Back</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Interested</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Not Interested</a></li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Priority Services</td>
                                                        <td>Ramesh</td>
                                                        <td>9876543210</td>
                                                        <td>ramesh123@gmail.com</td>
                                                        <td>
                                                            <div class="btn-group text-left">
                                                                <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu pull-right" role="menu">
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Call Back</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Interested</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Not Interested</a></li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Priority Services</td>
                                                        <td>Ramesh</td>
                                                        <td>9876543210</td>
                                                        <td>ramesh123@gmail.com</td>
                                                        <td>
                                                            <div class="btn-group text-left">
                                                                <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu pull-right" role="menu">
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Call Back</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Interested</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Not Interested</a></li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Priority Services</td>
                                                        <td>Ramesh</td>
                                                        <td>9876543210</td>
                                                        <td>ramesh123@gmail.com</td>
                                                        <td>
                                                            <div class="btn-group text-left">
                                                                <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu pull-right" role="menu">
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Call Back</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Interested</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Not Interested</a></li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>

                                        <!--Tab2-->
                                        <div class="tab-pane fade" id="Callback">
                                            <table id="LeadsTable1" class="table table-bordered datatable table-striped" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th>Agency Name</th>
                                                        <th>Contact Person</th>
                                                        <th>Mobile</th>
                                                        <th>Email</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Priority Services</td>
                                                        <td>Ramesh</td>
                                                        <td>9876543210</td>
                                                        <td>ramesh123@gmail.com</td>
                                                        <td>
                                                            <div class="btn-group text-left">
                                                                <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu pull-right" role="menu">
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Call Back</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Interested</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Not Interested</a></li>
                                                                </ul>
                                                            </div>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Priority Services</td>
                                                        <td>Ramesh</td>
                                                        <td>9876543210</td>
                                                        <td>ramesh123@gmail.com</td>
                                                        <td>
                                                            <div class="btn-group text-left">
                                                                <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu pull-right" role="menu">
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Call Back</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Interested</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Not Interested</a></li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Priority Services</td>
                                                        <td>Ramesh</td>
                                                        <td>9876543210</td>
                                                        <td>ramesh123@gmail.com</td>
                                                        <td>
                                                            <div class="btn-group text-left">
                                                                <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu pull-right" role="menu">
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Call Back</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Interested</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Not Interested</a></li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Priority Services</td>
                                                        <td>Ramesh</td>
                                                        <td>9876543210</td>
                                                        <td>ramesh123@gmail.com</td>
                                                        <td>
                                                            <div class="btn-group text-left">
                                                                <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu pull-right" role="menu">
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Call Back</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Interested</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Not Interested</a></li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Priority Services</td>
                                                        <td>Ramesh</td>
                                                        <td>9876543210</td>
                                                        <td>ramesh123@gmail.com</td>
                                                        <td>
                                                            <div class="btn-group text-left">
                                                                <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu pull-right" role="menu">
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Call Back</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Interested</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Not Interested</a></li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                        <!--Tab3-->
                                        <div class="tab-pane fade" id="Interested">
                                            <table id="LeadsTable2" class="table table-bordered datatable table-striped" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th>Agency Name</th>
                                                        <th>Contact Person</th>
                                                        <th>Mobile</th>
                                                        <th>Email</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Priority Services</td>
                                                        <td>Ramesh</td>
                                                        <td>9876543210</td>
                                                        <td>ramesh123@gmail.com</td>
                                                        <td>
                                                            <div class="btn-group text-left">
                                                                <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu pull-right" role="menu">
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Call Back</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Interested</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Not Interested</a></li>
                                                                </ul>
                                                            </div>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Priority Services</td>
                                                        <td>Ramesh</td>
                                                        <td>9876543210</td>
                                                        <td>ramesh123@gmail.com</td>
                                                        <td>
                                                            <div class="btn-group text-left">
                                                                <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu pull-right" role="menu">
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Call Back</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Interested</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Not Interested</a></li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Priority Services</td>
                                                        <td>Ramesh</td>
                                                        <td>9876543210</td>
                                                        <td>ramesh123@gmail.com</td>
                                                        <td>
                                                            <div class="btn-group text-left">
                                                                <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu pull-right" role="menu">
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Call Back</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Interested</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Not Interested</a></li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Priority Services</td>
                                                        <td>Ramesh</td>
                                                        <td>9876543210</td>
                                                        <td>ramesh123@gmail.com</td>
                                                        <td>
                                                            <div class="btn-group text-left">
                                                                <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu pull-right" role="menu">
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Call Back</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Interested</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Not Interested</a></li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Priority Services</td>
                                                        <td>Ramesh</td>
                                                        <td>9876543210</td>
                                                        <td>ramesh123@gmail.com</td>
                                                        <td>
                                                            <div class="btn-group text-left">
                                                                <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu pull-right" role="menu">
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Call Back</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Interested</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Not Interested</a></li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                        <!--Tab4-->
                                        <div class="tab-pane fade" id="NotInterested">
                                            <table id="LeadsTable3" class="table table-bordered datatable table-striped" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th>Agency Name</th>
                                                        <th>Contact Person</th>
                                                        <th>Mobile</th>
                                                        <th>Email</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Priority Services</td>
                                                        <td>Ramesh</td>
                                                        <td>9876543210</td>
                                                        <td>ramesh123@gmail.com</td>
                                                        <td>
                                                            <div class="btn-group text-left">
                                                                <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu pull-right" role="menu">
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Call Back</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Interested</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Not Interested</a></li>
                                                                </ul>
                                                            </div>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Priority Services</td>
                                                        <td>Ramesh</td>
                                                        <td>9876543210</td>
                                                        <td>ramesh123@gmail.com</td>
                                                        <td>
                                                            <div class="btn-group text-left">
                                                                <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu pull-right" role="menu">
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Call Back</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Interested</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Not Interested</a></li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Priority Services</td>
                                                        <td>Ramesh</td>
                                                        <td>9876543210</td>
                                                        <td>ramesh123@gmail.com</td>
                                                        <td>
                                                            <div class="btn-group text-left">
                                                                <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu pull-right" role="menu">
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Call Back</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Interested</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Not Interested</a></li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Priority Services</td>
                                                        <td>Ramesh</td>
                                                        <td>9876543210</td>
                                                        <td>ramesh123@gmail.com</td>
                                                        <td>
                                                            <div class="btn-group text-left">
                                                                <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu pull-right" role="menu">
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Call Back</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Interested</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Not Interested</a></li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Priority Services</td>
                                                        <td>Ramesh</td>
                                                        <td>9876543210</td>
                                                        <td>ramesh123@gmail.com</td>
                                                        <td>
                                                            <div class="btn-group text-left">
                                                                <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu pull-right" role="menu">
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Call Back</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Interested</a></li>
                                                                    <li><a href="#"><i class="fa fa-file-text-o"></i>Not Interested</a></li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--End Navbar Tabs --->
                </div>

            </div>
        </section>

        <!-- jQuery 2.2.3 -->
        <script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
        <!--Data Tables-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
        <link type="text/css" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" rel="stylesheet">
        <!--Responsive css--->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.dataTables.min.css" />
        <link type="text/css" href="https://cdn.datatables.net/buttons/1.1.2/css/buttons.dataTables.min.css" rel="stylesheet">
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
        <!--Responsive js--->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/responsive/2.2.1/js/dataTables.responsive.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.1.2/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.1.2/js/buttons.flash.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
        <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.1.2/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.1.2/js/buttons.print.min.js"></script>
        <script type="text/javascript">
            //Data Table Function

            $('#LeadsTable').dataTable({
                "pageLength": 50,
                dom: 'frtip',
                responsive: true
            });


            $('#LeadsTable1').dataTable({
                "pageLength": 50,
                dom: 'frtip',
                responsive: true
            });

            $('#LeadsTable2').dataTable({
                "pageLength": 50,
                dom: 'frtip',
                responsive: true
            });

            $('#LeadsTable3').dataTable({
                "pageLength": 50,
                dom: 'frtip',
                responsive: true
            });

        </script>

    
</asp:Content>
