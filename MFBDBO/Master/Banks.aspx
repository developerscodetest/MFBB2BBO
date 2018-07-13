<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Banks.aspx.cs" Inherits="MFBDBO.Master.Banks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
        function alertMessage(text) {
            alert(text);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
 
        <section class="content-header">
            <h1>Banks</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">Accounts</li>
                 <li class="active">Banks</li>
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
                    <div>
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblBankName" class="control-label col-sm-4" runat="server" Text="BankName"><b>Bank  Name :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                     <asp:TextBox ID="txtBankName" class="form-control" placeholder="Enter Bank Name" runat="server"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="rfvBankName" runat="server" ErrorMessage="Bank Name is required" ForeColor="Red" ControlToValidate="txtBankName" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revBankName" runat="server" ErrorMessage="Enter valid Bank Name" ForeColor="Red" ControlToValidate="txtBankName" ValidationExpression="^[a-zA-Z'.\s]{1,100}$" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                             <div class="col-md-6">
                                <asp:Label ID="lblBranch" class="control-label col-sm-4" runat="server" Text="Branch"><b>Branch :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                      <asp:TextBox ID="txtBranch" class="form-control" placeholder="Enter Branch" runat="server"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="rfvBranch" runat="server" ErrorMessage="Branch is required" ForeColor="Red" ControlToValidate="txtBranch" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revBranch" runat="server" ErrorMessage="Enter valid Branch" ForeColor="Red" ControlToValidate="txtBranch" ValidationExpression="^[a-zA-Z'.\s]{1,100}$" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            </div>

                            <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblAddress" class="control-label col-sm-4" runat="server" Text="Address"><b>Address :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                    <asp:TextBox ID="txtAddress" class="form-control" placeholder="Enter Address" runat="server"></asp:TextBox> 
                                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Address is required" ForeColor="Red" ControlToValidate="txtAddress" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                             <div class="col-md-6">
                                <asp:Label ID="lblAcNo" class="control-label col-sm-4" runat="server" Text="AcNo"><b>Account No:</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                    <asp:TextBox ID="txtAcNo" class="form-control" placeholder="Enter Account No" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvAccountno" runat="server" ErrorMessage="Account No is required" ForeColor="Red" ControlToValidate="txtAcNo" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revAccountno" runat="server" ErrorMessage="Enter valid Account No" ForeColor="Red" ControlToValidate="txtAcNo" ValidationExpression="^\d+$" Display="Dynamic"></asp:RegularExpressionValidator> 
                                </div>
                            </div>
                            </div>

                           <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblAcName" class="control-label col-sm-4" runat="server" Text="Account Name"><b>Account Name :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                    <asp:TextBox ID="txtAccountName" class="form-control" placeholder="Enter Account Name" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvAccountNmae" runat="server" ErrorMessage="Account Name is required" ForeColor="Red" ControlToValidate="txtAccountName" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revAccountName" runat="server" ErrorMessage="Enter valid Account Name" ForeColor="Red" ControlToValidate="txtAccountName" ValidationExpression="^[a-zA-Z\s]+$" Display="Dynamic"></asp:RegularExpressionValidator>  
                                </div>
                            </div>
                             <div class="col-md-6">
                                <asp:Label ID="lblIfscCode" class="control-label col-sm-4" runat="server" Text="Ifsc Code"><b>IFSC Code:</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                    <asp:TextBox ID="txtIfsc" class="form-control" placeholder="Enter Ifsc Code" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="rfvifsccode" runat="server" ErrorMessage="Ifsc Code is required" ForeColor="Red" ControlToValidate="txtIfsc" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revifsccode" runat="server" ErrorMessage="Enter valid Ifsc Code" ForeColor="Red" ControlToValidate="txtIfsc" ValidationExpression="^[a-zA-Z0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>   
                                </div>
                            </div>
                            </div>
                         <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblType" class="control-label col-sm-4" runat="server" Text="Type"><b>Type:</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                   <asp:DropDownList ID="ddlType" CssClass="form-control" runat="server" AutoPostBack="True">
                                        <asp:ListItem  Text="--Select--" Value="0"></asp:ListItem>
                                      <asp:ListItem  Text="Savings"  Value="1"></asp:ListItem>
                                        <asp:ListItem  Text="Current" Value="2" ></asp:ListItem>  
                                    </asp:DropDownList>
                                     <asp:RequiredFieldValidator ID="rfvtype" runat="server" ErrorMessage="Select Type" InitialValue="0" ForeColor="Red" ControlToValidate="ddlType" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            </div>
                                <div class="form-group pull-right">
                                    <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" Style="width: 100px;" OnClick="btnSave_Click" />
                                    <asp:Button ID="btnUpdate" class="btn btn-primary" runat="server" Text="Update" Style="width: 100px;" CausesValidation="false" OnClick="btnUpdate_Click"  />
                                    <asp:Button ID="btnReset" class="btn btn-danger" runat="server" Text="Reset" Style="width: 100px;"  CausesValidation="false"  OnClick="btnReset_Click" />
                                        <asp:Button ID="btnBack" class="btn btn-danger" runat="server" Text="Back" Style="width: 100px;" CausesValidation="false" OnClick="btnBack_Click" />
                                     <asp:HiddenField ID="hdnBankID" runat="server" />
                                </div>
                        
                    </div>
                    <!--2nd row--->
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

            $('#Users').dataTable({
                "pageLength": 50,
                dom: 'frtip',
                responsive: true
               
            });

        </script>
    
</asp:Content>
