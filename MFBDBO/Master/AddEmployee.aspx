<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="MFBDBO.Master.AddEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <style>
    b, strong {
    font-weight: 600 !important;
}
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    <form runat="server">
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
                    <form class="form-horizontal">
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
                                  <select class="form-control select2">
                                      <option>--Select</option>
                                      <option>Male</option>
                                      <option>Female</option>
                                  </select>
                                </div>
                            </div>
                             <div class="col-md-6">
                                <asp:Label ID="lblMS" class="control-label col-sm-3" runat="server" Text="Marital Status"><b>Marital Status :</b></asp:Label>
                                <div class="col-sm-9">
                                  <select class="form-control select2">
                                      <option>--Select</option>
                                      <option>Married</option>
                                      <option>Un-Married</option>
                                  </select>
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
                           <div class="col-md-12">
                                <asp:Label ID="lblAddress" class="control-label col-sm-1" runat="server" Text="Email" ><b>Address :</b></asp:Label>
                                <div class="col-sm-11">
                                  <textarea class="form-control" rows="4" placeholder="Enter Address"></textarea>
                                </div> 
                            </div>
                        </div>

                    </form>
                    <!--End Form-->
                </div>
                <!--2nd Row-->

                 <!-- /.box-body -->
                <div class="box-header">
                    <h4>Employeement Information</h4>
                </div>
                <div class="box-body">
                    <!--Begin Form-->
                    <form class="form-horizontal">
                        <!--2nd  Row-->
                        <div class="form-group row">
                             <div class="col-md-6">
                                <asp:Label ID="lblDateOfJoin" class="control-label col-sm-4" runat="server" Text="DateOfJoin"><b>Date Of Join :</b></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtDateOfJoin" type="date" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                           <div class="col-md-6">
                                <asp:Label ID="lblRole" class="control-label col-sm-4" runat="server" Text="Role"><b>Role :</b></asp:Label>
                                <div class="col-sm-8">
                                  <select class="form-control select2">
                                      <option>--Select--</option>
                                      <option>Admin</option>
                                      <option>Employee</option>
                                  </select>
                                </div>
                            </div>
                        </div>
                        <!--3rd  Row-->
                        <div class="form-group row">
                           <div class="col-md-6">
                                <asp:Label ID="lblDepartment" class="control-label col-sm-4" runat="server" Text="Role"><b>Department :</b></asp:Label>
                                <div class="col-sm-8">
                                  <select class="form-control select2">
                                      <option>--Select--</option>
                                      <option></option>
                                      <option></option>
                                  </select>
                                </div>
                            </div>
                             <div class="col-md-6">
                                <asp:Label ID="lblDesignation" class="control-label col-sm-4" runat="server" Text="Role"><b>Designation :</b></asp:Label>
                                <div class="col-sm-8">
                                  <select class="form-control select2">
                                      <option>--Select--</option>
                                      <option></option>
                                      <option></option>
                                  </select>
                                </div>
                            </div>
                        </div>
                        <!--4th  Row-->
                        <div class="form-group row">
                          <div class="col-md-6">
                                <asp:Label ID="lblReportingManager" class="control-label col-sm-4" runat="server" Text=" Reporting Manager"><b>Reporting Manager :</b></asp:Label>
                                <div class="col-sm-8">
                                  <select class="form-control select2">
                                      <option>--Select</option>
                                      <option>Male</option>
                                      <option>Female</option>
                                  </select>
                                </div>
                            </div>
                            
                        </div>
                     
                    </form>
                    <!--End Form-->
                    <div class="footer-bottom">
                        <div class="form-group pull-right">
               <asp:Button ID="btnDanger" CssClass="btn btn-primary" runat="server" Text="Save" style="width:100px;" />
              <asp:Button ID="btnReset" CssClass="btn btn-danger" runat="server" Text="Reset" style="width:100px;" />
              <asp:Button ID="btnBack" CssClass="btn btn-danger"  PostBackUrl="EmployeeList.aspx" runat="server" Text="Back" style="width:100px;" />
                        </div>
                    </div>

                </div>

            </div>
        </section>
    </form>
</asp:Content>
