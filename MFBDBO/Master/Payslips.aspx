<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="Payslips.aspx.cs" Inherits="MFBDBO.Master.Payslips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Select2 -->
    <link rel="stylesheet" href="../../plugins/select2/select2.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    
        <section class="content-header">
            <h1>Payslips</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">Payroll Management</li>
                <li class="active">Payslips</li>
            </ol>
        </section>
        <section class="content">
            <div class="box box-body">
                <!--1st row-->
                <form>
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblEmployee" class="control-label col-sm-3" runat="server" Text="EMPLOYEE"><b>EMPLOYEE </b>
                            </asp:Label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="DDLEmp" CssClass="form-control select2" runat="server">
                                                <asp:ListItem>--Select--</asp:ListItem>
                                                <asp:ListItem>Suresh</asp:ListItem>
                                                <asp:ListItem>Ramesh</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvEmp" runat="server" ErrorMessage="Select Employee Name Required" ForeColor="Red" ControlToValidate="DDLEmp" InitialValue="--Select--" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblSMonth" class="control-label col-sm-3" runat="server" Text="SELECT MONTH"><b>SELECT MONTH </b>
                            </asp:Label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="DDLMonth" CssClass="form-control select2" runat="server">
                                                <asp:ListItem>--Select--</asp:ListItem>
                                                <asp:ListItem>Jan</asp:ListItem>
                                                <asp:ListItem>Feb</asp:ListItem>
                                            <asp:ListItem>March</asp:ListItem>
                                            <asp:ListItem>April</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvMonth" runat="server" ErrorMessage="Select Month is Required" ForeColor="Red" ControlToValidate="DDLMonth" InitialValue="--Select--" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblSYear" class="control-label col-sm-3" runat="server" Text="SELECT YEAR"><b>SELECT YEAR </b>
                            </asp:Label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="DDLYear" CssClass="form-control select2" runat="server">
                                                <asp:ListItem>--Select--</asp:ListItem>
                                                <asp:ListItem>2016</asp:ListItem>
                                                <asp:ListItem>2017</asp:ListItem>
                                            <asp:ListItem>2017</asp:ListItem>
                                            <asp:ListItem>2018</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvYear" runat="server" ErrorMessage="Select Year Required" ForeColor="Red" ControlToValidate="DDLYear" InitialValue="--Select--" Display="Dynamic"></asp:RequiredFieldValidator>                             
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group pull-right">
                                <asp:Button ID="btnGeneratePayslip" class="btn btn-primary" runat="server" Text="Generate Payslip" />
                            </div>
                        </div>
                    </div>
                
                <!--2nd row--->
            </div>
        </section>

         <!-- jQuery 2.2.3 -->
        <script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
        <!--Select2 script-->
        <script src="../../plugins/select2/select2.full.min.js"></script>
        <script type="text/javascript">

            //Select2 Function
            $(function () {
                $(".select2").select2();
            });
        </script>
    
</asp:Content>
