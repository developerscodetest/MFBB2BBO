<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="Documents.aspx.cs" Inherits="MFBDBO.Master.Documents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    <form runat="server">
        <section class="content-header">
            <h1>Documents</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">Settings</li>
                <li class="active">Documents</li>
            </ol>
        </section>
        <section class="content">
            <div class="box box-body">
                <!--Begin 1st row-->
                <form>
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblCountry" class="control-label col-md-4" runat="server" Text="Country"><b>Country :</b>
                            </asp:Label>
                            <div class="col-md-8">
                                <select class="form-control select2">
                                    <option>--select--</option>
                                    <option></option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblDName" class="control-label col-md-4" runat="server" Text="Document Name"><b>Document Name :</b>
                            </asp:Label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtDName" CssClass="form-control" placeholder="Enter Document Name" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-group pull-right">
                        <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" Style="width: 100px;" />
                        <asp:Button ID="Button1" class="btn btn-danger" runat="server" Text="Reset" Style="width: 100px;" />

                    </div>

                </form>
                <!--End 1st row--->
                <!--Table-->
                <table id="Document" class="table table-bordered datatable table-striped" style="width: 100%">
                    <thead>
                        <tr>
                            <th>Country</th>
                            <th>Document Name</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>India</td>
                            <td>GST</td>
                            <td>Active</td>
                            <td>
                                <div class="btn-group text-left">
                                    <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="#"><i class="fa fa-file-text-o"></i>Edit</a></li>
                                        <li><a href="#"><i class="fa fa-file-text-o"></i>Mark As Inactive</a></li>
                                    </ul>
                                </div>

                            </td>
                        </tr>
                    </tbody>
                </table>
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

            $('#Document').dataTable({
                "pageLength": 50,
                dom: 'frtip',
                responsive: true

            });

        </script>
    </form>
</asp:Content>
