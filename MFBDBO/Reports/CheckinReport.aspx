<%@ Page Title="" Language="C#" MasterPageFile="~/Reports/Reports.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="CheckinReport.aspx.cs" Inherits="MFBDBO.Reports.CheckinReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .hidden-bound {
            display: none;
        }
    </style>
     <script type="text/javascript">
        function alertMessage(text) {
            alert(text);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    
      <section class="content-header">
            <h1>Checkin Report</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">Reports</li>
                <li class="active">Checkin Report</li>
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
                                <asp:Label ID="lblTodayDate" class="control-label col-sm-3" runat="server" Text="Supplier"><b>Today Date :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtTodayDate" type="date" class="form-control" placeholder="Enter From Date" runat="server"></asp:TextBox>
                                   <%--<asp:DropDownList ID="ddlTodayDate" CssClass="form-control" runat="server" >
                                        <asp:ListItem Enabled="true" Text="--Select--" Value="0"></asp:ListItem>
                                        <asp:ListItem Enabled="true" Text="1" ></asp:ListItem>
                                        <asp:ListItem Enabled="true" Text="2" ></asp:ListItem>   
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvTodayDate" runat="server" ErrorMessage="Select Supplier" ForeColor="Red" InitialValue="0" ControlToValidate="ddlTodayDate" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                        </div>
                        <div class="form-group pull-right">
                            <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Search" Style="width: 100px;" OnClick="btnSave_Click" />
                            <%-- <asp:Button ID="btnUpdate" class="btn btn-primary" runat="server" Text="Update" Style="width: 100px;" />--%>
                            <asp:Button ID="btnReset" class="btn btn-danger" runat="server" CausesValidation="false" Text="Reset" Style="width: 100px;" OnClick="btnReset_Click"  />
                           
                            <asp:HiddenField ID="hdnCityID" runat="server" />
                        </div>
                    </form>
                    <!--2nd row--->
                    <%--<asp:GridView ID="gdvBbySupplier" CssClass="table table-bordered datatable table-striped" runat="server" AutoGenerateColumns="False" >--%>
                        <asp:GridView ID="gdvBbyCheckinDate" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="False"  ShowHeader="False" OnRowDataBound="gdvBbyCheckinDate_RowDataBound">
                        <Columns>
                            <%--<asp:BoundField DataField="CityID" HeaderText="City ID" ItemStyle-CssClass="hidden-bound">
                                <ItemStyle CssClass="hidden-bound"></ItemStyle>
                            </asp:BoundField>--%>
                            <asp:BoundField DataField="BookingDetailscls.BookingId" HeaderText="MFB ID" />
                            <asp:BoundField DataField="Agentscls.AgencyName" HeaderText="Agency Name" />
                            <asp:BoundField DataField="GuestDetailscls.Name" HeaderText="Customer Name" />
                            <asp:BoundField DataField="HotelDetailscls.HotelId" HeaderText="Hotel" />
                            <asp:BoundField DataField="BookingDetailscls.CheckinDate" HeaderText="Check In" />
                            <asp:BoundField DataField="BookingDetailscls.CheckoutDate" HeaderText="Check Out" />
                        </Columns>
                    </asp:GridView>
                    
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

            $("#AdminPlaceHolder_gdvBbyCheckinDate").prepend($("<thead><tr><th>MFB ID</th><th>Agency Name</th><th>Customer Name</th><th>Hotel</th><th>Check In</th><th>Check Out</th></tr></thead>").append($(this).find("tr:first")));
            $("#AdminPlaceHolder_gdvBbyCheckinDate").css('width', '100%');
            $("#AdminPlaceHolder_gdvBbyCheckinDate").dataTable({
                "pageLength": 50,
                dom: 'Bfrtip',
                buttons: [
                    {
                        extend: 'copy',
                        exportOptions: {
                            columns: [0, 1, 2, 3]
                        }
                    },
                    {
                        extend: 'csv',
                        exportOptions: {
                            columns: [0, 1, 2, 3]
                        }
                    },
                    {
                        extend: 'excel',
                        exportOptions: {
                            columns: [0, 1, 2, 3]
                        }
                    },
                    {
                        extend: 'pdf',
                        exportOptions: {
                            columns: [0, 1, 2, 3]
                        }
                    },
                    {
                        extend: 'print',
                        exportOptions: {
                            columns: [0, 1, 2, 3]
                        }
                    },

                ]
            });

        </script>

    
</asp:Content>
