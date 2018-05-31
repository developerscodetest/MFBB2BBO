<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="Country.aspx.cs" Inherits="MFBDBO.Master.Country" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
 <form runat="server">
 <section class="content-header">
      <h1>Country</h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="#">Settings</li>
            <li class="active">Country</li>
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
                                <asp:Label ID="lblCountry" class="control-label col-sm-3" runat="server" Text="Country"><b>Country :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtRole" class="form-control" placeholder="Enter Country " runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3 col-md-offset-3">
                                <div class="form-group pull-right">
                                    <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" Style="width: 100px;" />
                                    <asp:Button ID="Button1" class="btn btn-danger" runat="server" Text="Reset" Style="width: 100px;" />

                                </div>
                            </div>
                        </div>
                    </form>
                    <!--2nd row--->


                    <table id="Country" class="table table-bordered datatable table-striped" style="width:100%">
                        <thead>
                            <tr>
                                <th>Country</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Operations</td>
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

            $('#Country').dataTable({
                "pageLength": 50,
                dom: 'frtip',
                responsive: true
               
            });

        </script>

</form>
</asp:Content>
