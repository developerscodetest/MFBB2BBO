<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" EnableEventValidation="true" CodeBehind="AddEmployee.aspx.cs" Inherits="MFBDBO.Master.AddEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        function alertMessage(text) {
            alert(text);
        }
    </script>
    <style>
        b, strong {
            font-weight: 600 !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
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
                        <!--1st Row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblEID" class="control-label col-sm-3" runat="server" Text="Employee ID"><b>Employee ID :</b></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtEID" placeholder="Enter Employee ID" class="form-control" runat="server" AutoPostBack="true" OnTextChanged="txtEID_TextChanged"></asp:TextBox>
                                    <asp:Label ID="lblEmpid" runat="server" ForeColor="Red"></asp:Label>
                                    <asp:RequiredFieldValidator ID="rfvEmpId" runat="server" ErrorMessage="Employee ID is Required" ForeColor="Red" ControlToValidate="txtEID" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <%--<asp:RegularExpressionValidator ID="revEmpId" runat="server" ErrorMessage="Enter Valid Employee ID" ForeColor="Red" ControlToValidate="txtEID" ValidationExpression="^[a-zA-Z0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblDOB" class="control-label col-sm-3" runat="server" Text="DOB"><b>Date Of Birth :</b></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtDOB" type="date" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvDate" runat="server" ErrorMessage="Date is Required" ForeColor="Red" ControlToValidate="txtDOB" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <!--2nd  Row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblUsername" class="control-label col-sm-3" runat="server" Text="Username"><b>Username :</b></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtUsername" placeholder="Enter Username" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvUN" runat="server" ErrorMessage="Username is Required" ForeColor="Red" ControlToValidate="txtUsername" Display="Dynamic"></asp:RequiredFieldValidator>
                                   <%-- <asp:RegularExpressionValidator ID="revUN" runat="server" ErrorMessage="Enter Valid Username" ForeColor="Red" ControlToValidate="txtUsername" ValidationExpression="[a-zA-Z0-9%*#!@$&]*$" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblPassword" class="control-label col-sm-3" runat="server" Text="Password"><b>Password :</b></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="TxtPassword" placeholder="Enter Password" class="form-control" TextMode="Password" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPswd" runat="server" ErrorMessage="Password is Required" ForeColor="Red" ControlToValidate="TxtPassword" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <%--<asp:RegularExpressionValidator ID="revPswd" runat="server" ErrorMessage="Password length must be between 7 to 10 characters" ForeColor="Red" ControlToValidate="TxtPassword" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,10}$" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                                </div>
                            </div>
                        </div>
                        <!--3rd  Row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblFName" class="control-label col-sm-3" runat="server" Text="First Name"><b>First Name :</b></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtFname" placeholder="Enter First Name" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvFName" runat="server" ErrorMessage="First Name is required" ForeColor="Red" ControlToValidate="txtFname" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <%--<asp:RegularExpressionValidator ID="revFName" runat="server" ErrorMessage="First Name Must be Alphabets" ForeColor="Red" ControlToValidate="txtFname" ValidationExpression="^[a-zA-Z'.\s]{1,100}$" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblLName" class="control-label col-sm-3" runat="server" Text="Last Name"><b>Last Name :</b></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtLName" placeholder="Enter Last Name" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvLName" runat="server" ErrorMessage="Last Name is required" ForeColor="Red" ControlToValidate="txtLName" Display="Dynamic"></asp:RequiredFieldValidator>
                                   <%-- <asp:RegularExpressionValidator ID="revLName" runat="server" ErrorMessage="Last Name Must be Alphabets" ForeColor="Red" ControlToValidate="txtLName" ValidationExpression="^[a-zA-Z'.\s]{1,100}$" Display="Dynamic"></asp:RegularExpressionValidator>--%>
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
                                    <asp:RequiredFieldValidator ID="rfvGender" runat="server" ErrorMessage="Select Gender" ForeColor="Red" ControlToValidate="DDLGender" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
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
                                    <%--<asp:RequiredFieldValidator ID="rfvMStatus" runat="server" ErrorMessage="Select Marital Status" ForeColor="Red" ControlToValidate="DDLMaritalStatus" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                        </div>
                        <!--5th  Row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblEmail" class="control-label col-sm-3" runat="server" Text="Email"><b>Email :</b></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtEmail" placeholder="Enter Email" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is required" ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                   <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Enter Valid Email" ForeColor="Red" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblMobile" class="control-label col-sm-3" runat="server" Text="Mobile No"><b>Mobile No :</b></asp:Label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtMobile" placeholder="Enter Mobile No" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ErrorMessage="Mobile No is required" ControlToValidate="txtMobile" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revMobail" runat="server" ErrorMessage="Mobile No contains 10 digits" ForeColor="Red" ControlToValidate="txtMobile" ValidationExpression="[0-9]{10}" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <!--6th  Row-->
                        <div class="form-group row">
                            <div class="col-md-12">
                                <asp:Label ID="lblAddress" class="control-label col-sm-1" runat="server" Text="Email"><b>Address :</b></asp:Label>
                                <div class="col-sm-11">
                                    <asp:TextBox ID="txtAddress" CssClass="form-control" placeholder="Enter Address" Rows="4" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Address is Required" ForeColor="Red" ControlToValidate="txtAddress" Display="Dynamic"></asp:RequiredFieldValidator>
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
                        <!--2nd  Row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblDateOfJoin" class="control-label col-sm-4" runat="server" Text="DateOfJoin"><b>Joining Date :</b></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtDateOfJoin" type="date" class="form-control" runat="server"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="rfvDOJ" runat="server" ErrorMessage="Date is Required" ForeColor="Red" ControlToValidate="txtDateOfJoin" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblRole" class="control-label col-sm-4" runat="server" Text="Role"><b>Role :</b></asp:Label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="DDLRole" CssClass="form-control select2" runat="server">
                                        <asp:ListItem Enabled="true" Text="--Select--" Value="0"></asp:ListItem>
                                        <%-- <asp:ListItem Enabled="true" Text="Employee" Value="1"></asp:ListItem>--%>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="refRole" runat="server" ErrorMessage="Select Role" ForeColor="Red" ControlToValidate="DDLRole" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <!--3rd  Row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblDepartment" class="control-label col-sm-4" runat="server" Text="Role"><b>Department :</b></asp:Label>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="DDLDept" CssClass="form-control select2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDLDept_SelectedIndexChanged">
                                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                <%--<asp:ListItem>Admin</asp:ListItem>
                                                <asp:ListItem>Employee</asp:ListItem>--%>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvdept" runat="server" ErrorMessage="Select Department" ForeColor="Red" ControlToValidate="DDLDept" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblDesignation" class="control-label col-sm-4" runat="server" Text="Role"><b>Designation :</b></asp:Label>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="DDLDesignation" CssClass="form-control select2" runat="server">
                                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                <%-- <asp:ListItem>Manager</asp:ListItem>
                                                <asp:ListItem>Agent</asp:ListItem>--%>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvDesgntion" runat="server" ErrorMessage="Select Designation" ForeColor="Red" ControlToValidate="DDLDesignation" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    <p>&nbsp;</p>
                    <!--4th  Row-->
                 <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblReportingManager" class="control-label col-sm-4" runat="server" Text="Reporting Manager"><b>Reporting Manager :</b></asp:Label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="DDLRManager" CssClass="form-control select2" runat="server">
                                    <asp:ListItem Enabled="true" Text="--Select--" Value="0"></asp:ListItem>
                                    <asp:ListItem Enabled="true" Text="Male" Value="1"></asp:ListItem>
                                    <asp:ListItem Enabled="true" Text="Female" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvRM" runat="server" ErrorMessage="Select Reporting Manager" ForeColor="Red" ControlToValidate="DDLRManager" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
                <!--End Form-->
                <div class="footer-bottom">
                    <div class="form-group pull-right">
                        <asp:Button ID="btnDanger" CssClass="btn btn-primary" runat="server" Text="Save" Style="width: 100px;" OnClick="BtnSave_Click" />
                        <asp:Button ID="btnReset" CssClass="btn btn-danger" runat="server" Text="Reset" Style="width: 100px;" CausesValidation="False" OnClick="BtnReset_Click" />
                        <asp:Button ID="btnBack" CssClass="btn btn-danger" PostBackUrl="~/Master/EmployeeList.aspx" runat="server" Text="Back" Style="width: 100px;" CausesValidation="False" />
                    </div>
                </div>

            </div>

        </section>
        <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>
    
</asp:Content>
