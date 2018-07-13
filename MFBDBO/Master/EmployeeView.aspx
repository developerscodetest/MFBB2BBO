<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="EmployeeView.aspx.cs" Inherits="MFBDBO.Master.EmployeeView" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <script type="text/javascript">
        function alertMessage(text) {
            alert(text);
        }
    </script>
    <style>
        .hidden-bound {
            display: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">

        <section class="content-header">
            <h1>Employee Details</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">HRM</li>
                <li class="#">Employee List</li>
                <li class="active">Employee Details</li>
            </ol>
        </section>

        <section class="content">
            <div class="box">
                <!-- /.box-body -->
                <div class="box-header">
                    <h4>Personal Details</h4>
                </div>
                <div class="box-body">
                    <!--Begin Form-->
                    <div class="form-horizontal">
                        <!--1st Row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblEID" class="control-label col-sm-3" runat="server" Text="Employee ID"><b>Employee ID :</b></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtEID" placeholder="Enter Member Name" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblDOB" class="control-label col-sm-3" runat="server" Text="DOB"><b>Date Of Birth :</b></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtDOB" placeholder="Enter Date Of Birth" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!--2nd  Row-->
                        <div class="form-group row">
                             <div class="col-md-6">
                                <asp:Label ID="lblUsername" class="control-label col-sm-3" runat="server" Text="Username"><b>Username :</b></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtUsername" placeholder="Enter Username" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                           <div class="col-md-6">
                                <asp:Label ID="lblPassword" class="control-label col-sm-3" runat="server" Text="Password"><b>Password :</b></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="TxtPassword" placeholder="Enter Password" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!--3rd  Row-->
                        <div class="form-group row">
                           <div class="col-md-6">
                                <asp:Label ID="lblFName" class="control-label col-sm-3" runat="server" Text="First Name"><b>First Name :</b></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtFname" placeholder="Enter Last Name" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                             <div class="col-md-6">
                                <asp:Label ID="lblLName" class="control-label col-sm-3" runat="server" Text="Last Name"><b>Last Name :</b></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtLName" placeholder="Enter Last Name" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!--4th  Row-->
                        <div class="form-group row">
                          <div class="col-md-6">
                                <asp:Label ID="lblGender" class="control-label col-sm-3" runat="server" Text="Gender"><b>Gender :</b></asp:Label>
                                <div class="col-sm-9">
                                  <asp:DropDownList ID="DDLGender" CssClass="form-control select2" runat="server">
                                        <asp:ListItem Enabled="true" Text="--Select--" Value="0"></asp:ListItem>
                                        <asp:ListItem Enabled="true" Text="Male" Value="1"></asp:ListItem>
                                        <asp:ListItem Enabled="true" Text="Female" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                             <div class="col-md-6">
                                <asp:Label ID="lblMS" class="control-label col-sm-3" runat="server" Text="Marital Status"><b>Marital Status :</b></asp:Label>
                                <div class="col-sm-9">
                                   <asp:DropDownList ID="DDLMaritalStatus" CssClass="form-control select2" runat="server">
                                        <asp:ListItem Enabled="true" Text="--Select--" Value="0"></asp:ListItem>
                                        <asp:ListItem Enabled="true" Text="Married" Value="1"></asp:ListItem>
                                        <asp:ListItem Enabled="true" Text="Un-Married" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                       <!--5th  Row-->
                        <div class="form-group row">
                           <div class="col-md-6">
                                <asp:Label ID="lblEmail" class="control-label col-sm-3" runat="server" Text="Email"><b>Email :</b></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtEmail" placeholder="Enter Email" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                             <div class="col-md-6">
                                <asp:Label ID="lblMobile" class="control-label col-sm-3" runat="server" Text="Mobile No"><b>Mobile No :</b></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtMobile" placeholder="Enter Mobile No" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                         <!--6th  Row-->
                        <div class="form-group row">
                            <asp:Label ID="lblAddress" class="control-label col-sm-1" runat="server" Text="Email"><b>Address :</b></asp:Label>
                            <div class="col-sm-11">
                                <asp:TextBox ID="txtAddress" CssClass="form-control" placeholder="Enter Address" Rows="4" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>

                    </div>
                    <!--End Form-->
                </div>
                <!--2nd Row-->

                 <!-- /.box-body -->
                <div class="box-header">
                    <h4>Employment Information</h4>
                </div>
                <div class="box-body">
                    <!--Begin Form-->
                    <div class="form-horizontal">
                        <!--2nd  Row-->
                        <div class="form-group row">
                             <div class="col-md-6">
                                <asp:Label ID="lblDateOfJoin" class="control-label col-sm-4" runat="server" Text="DateOfJoin"><b>Joining Date :</b></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtDateOfJoin" type="date" class="form-control" runat="server"></asp:TextBox>

                                </div>
                            </div>
                           <div class="col-md-6">
                                <asp:Label ID="lblRole" class="control-label col-sm-4" runat="server" Text="Role"><b>Role :</b></asp:Label>
                                <div class="col-sm-8">
                                 <asp:DropDownList ID="DDLRole" CssClass="form-control select2" runat="server">
                                        <asp:ListItem Enabled="true" Text="--Select--" Value="0"></asp:ListItem>
                                        <asp:ListItem Enabled="true" Text="Employee" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <!--3rd  Row-->
                        <div class="form-group row">
                           <div class="col-md-6">
                                <asp:Label ID="lblDepartment" class="control-label col-sm-4" runat="server" Text="Role"><b>Department :</b></asp:Label>
                                <div class="col-sm-8">
                                  <asp:DropDownList ID="DDLDept" CssClass="form-control select2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDLDept_SelectedIndexChanged" >
                                        <asp:ListItem  Text="--Select--" Value="0"></asp:ListItem>                                    
                                    </asp:DropDownList>
                                </div>
                            </div>
                             <div class="col-md-6">
                                <asp:Label ID="lblDesignation" class="control-label col-sm-4" runat="server" Text="Role"><b>Designation :</b></asp:Label>
                                <div class="col-sm-8">
                                  <asp:DropDownList ID="DDLDesignation" CssClass="form-control select2" runat="server" AutoPostBack="true">
                                        <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>                                       
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <!--4th  Row-->
                        <div class="form-group row">
                          <div class="col-md-6">
                                <asp:Label ID="lblReportingManager" class="control-label col-sm-4" runat="server" Text=" Reporting Manager"><b>Reporting Manager :</b></asp:Label>
                                <div class="col-sm-8">
                                   <asp:DropDownList ID="DDLRManager" CssClass="form-control select2" runat="server">
                                        <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            
                        </div>
                     
                    </div>
                    <!--End Form-->
                    <div class="footer-bottom">
                        <div class="form-group pull-right">
                            <asp:Button ID="btnUpdate" CssClass="btn btn-primary" runat="server" Text="Update" Style="width: 100px;" OnClick="BtnUpdate_Click" />                         
                            <asp:Button ID="btnBack" CssClass="btn btn-danger" PostBackUrl="EmployeeList.aspx" runat="server" CausesValidation="false" Text="Back" style="width: 90px" />                                                                                          
                            <asp:HiddenField ID="hdnEmpId" runat="server" />
                                 <asp:HiddenField ID="hdnStatus" runat="server" />
                        </div>
                    </div>

                </div>

            </div>
        </section>
    
</asp:Content>
