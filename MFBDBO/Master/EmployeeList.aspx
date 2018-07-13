<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="EmployeeList.aspx.cs" Inherits="MFBDBO.Master.ActiveHRM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .hidden-bound {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    
        <section class="content-header">
            <h1>Employee List</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">HRM</li>
                <li class="active">Employee List</li>
            </ol>
        </section>

        <section class="content">
            <div class="box">
                <!-- /.box-body -->
                <div class="box-body">
                    <div class="form-group pull-right">
                           <asp:HiddenField ID="hdnEmpId" runat="server" />
               <asp:Button ID="btnAE" CssClass="btn btn-primary" PostBackUrl="AddEmployee.aspx" runat="server" Text="Add Employee"  />
                    </div>
                    <asp:GridView ID="gdvEmployee" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="False"  
                        ShowHeader="False" OnRowDataBound="gdvEmployee_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="EmpId" HeaderText="EmpId" ItemStyle-CssClass="hidden-bound">
                                <ItemStyle CssClass="hidden-bound"></ItemStyle>
                                    </asp:BoundField>
                                <asp:BoundField DataField="EmployeeId" HeaderText="Employee ID" />                               
                                <asp:BoundField DataField="ReportingManager" HeaderText="Name" />
                                <asp:BoundField DataField="DepartmentId" HeaderText="Department" />
                                <asp:BoundField DataField="DesignationId" HeaderText="Designation" />
                                <asp:BoundField DataField="MobileNo" HeaderText="Mobile" />
                                <asp:BoundField DataField="Email" HeaderText="Email" />
                                <asp:BoundField DataField="IsActive" HeaderText="Status" />                                
                                <asp:TemplateField HeaderText="Actions">                                                           
                                   
                                    <ItemTemplate>
                                        <div class="btn-group text-left">
                                            <button type="button" class="btn btn-primary btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">Actions <span class="caret"></span></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li>
                                                    <asp:LinkButton ID="lbtnSEdit" runat="server" Text="Edit" CausesValidation="False" OnClick="lbtnSEdit_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Edit</asp:LinkButton>                                                        
                                                    <%--<asp:Button ID="btnBack" class="btn btn-danger" PostBackUrl="SuppliersList.aspx" runat="server" Text="Back" style="width: 90px" />--%>
                                                </li>
                                               <%-- <li>
                                                    <asp:LinkButton ID="lbtnSView" runat="server" Text="View" CausesValidation="False" OnClick="lbtnSView_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'  ><i class="fa fa-file-text-o"></i>View</asp:LinkButton>
                                                </li>   --%>                                                 
                                                <li>
                                                    <asp:LinkButton ID="lbtnSMarkAsInActive" runat="server" Text="Mark As InActive" CausesValidation="False" OnClick="lbtnSMarkAsActive_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Mark As InActive</asp:LinkButton>
                                                </li>
                                                <li>
                                                    <asp:LinkButton ID="lbtnSMarkAsActive" runat="server" Text="Mark As Active" CausesValidation="False" OnClick="lbtnSMarkAsActive_Click" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><i class="fa fa-file-text-o"></i>Mark As Active</asp:LinkButton>
                                                </li>
                                            </ul>

                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
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

          $("#AdminPlaceHolder_gdvEmployee").prepend($("<thead><tr><th class='hidden-bound'>EmpId</th><th>Employee ID</th><th>Name</th><th>Department</th><th>Designation</th><th>Mobile</th><th>Email</th><th>Status</th><th>Actions</th></tr></thead>").append($(this).find("tr:first")));
          $("#AdminPlaceHolder_gdvEmployee").css('width', '100%');
          $("#AdminPlaceHolder_gdvEmployee").dataTable({
                "pageLength": 50,
                dom: 'Bfrtip',

                //buttons: [
                //    'copy', 'csv', 'excel', 'pdf', 'print'
                //]
                buttons: [
                  
                    {
                        extend: 'excel',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4]
                        }
                    },
                ]
               
            });

        </script>
    
</asp:Content>
