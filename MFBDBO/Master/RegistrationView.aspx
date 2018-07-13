<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="RegistrationView.aspx.cs" Inherits="MFBDBO.Master.RegistrationView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        function alertMessage(text) {
            alert(text);
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    
        <section class="content-header">
            <h1>Registration Details</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Registration Details</li>
            </ol>
        </section>
        <section class="content">
            <div class="box">
                <!-- /.box-header -->
                <div class="box-header">
                    <h3 class="box-title">Personal Details :</h3>
                </div>
                <div class="box-body">
                    <!--1st row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblAName" class="control-label col-sm-4" runat="server" Text="Agency Name"><b>Agency Name  :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblAgencyName" class="control-label col-sm-12" runat="server" >
                                </asp:Label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblAE" class="control-label col-sm-4" runat="server" Text="Agency Email :"><b>Agency Email :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblAEmail" class="control-label col-sm-4" runat="server" >
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                    <!--2nd row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblFirstName" class="control-label col-sm-4" runat="server" Text="First Name :"><b>First Name:</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblFN" class="control-label col-sm-4" runat="server" >
                                </asp:Label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblLastName" class="control-label col-sm-4" runat="server" Text="Last Name :"><b>Last Name :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblLN" class="control-label col-sm-4" runat="server">
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                    <!--3rd row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblTelephoneNo" class="control-label col-sm-4" runat="server" Text="Telephone No"><b>Telephone No :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblTN" class="control-label col-sm-4" runat="server" >
                                </asp:Label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblCategory" class="control-label col-sm-4" runat="server" Text="Category :"><b>Category :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblCategory1" class="control-label col-sm-4" runat="server" >
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                    <!--4th row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblWebsite" class="control-label col-sm-4" runat="server" Text="Website :"><b>Website :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblWeb" class="control-label col-sm-4" runat="server" >
                                </asp:Label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblAddress" class="control-label col-sm-4" runat="server" Text="Address :"><b>Address :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblAddress1" class="control-label col-sm-6" runat="server" >
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                    <!--5th row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblCountry" class="control-label col-sm-4" runat="server" Text="Country"><b>Country :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblCntry" class="control-label col-sm-6" runat="server" >
                                </asp:Label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblState" class="control-label col-sm-4" runat="server" Text="State"><b>State :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblSt" class="control-label col-sm-4" runat="server" >
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                    <!--6th row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblCity" class="control-label col-sm-4" runat="server" Text="City :"><b>City :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblCt" class="control-label col-sm-4" runat="server" ></asp:Label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblPincode" class="control-label col-sm-4" runat="server" Text="Pincode :"><b>Pincode :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblPCode" class="control-label col-sm-4" runat="server" >
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                    <!--7th row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblPCurrency" class="control-label col-sm-4" runat="server" Text="Preferred Currency :"><b>Preferred Currency :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblPCurrency1" class="control-label col-sm-6" runat="server">
                                </asp:Label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblIATA" class="control-label col-sm-4" runat="server" Text="IATA Status :"><b>IATA Status :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblIATAS" class="control-label col-sm-4" runat="server" >
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                    <!--8th Row--->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblReferredBy" class="control-label col-sm-4" runat="server" Text="Referred By :"><b>Referred By :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblRBy" class="control-label col-sm-4" runat="server" >
                                </asp:Label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblRegNo" class="control-label col-sm-4" runat="server" Text="IATA Reg NO :"><b>IATA Reg NO :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblRN" class="control-label col-sm-4" runat="server" >
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                    <!--9th row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblEmployee" class="control-label col-sm-4" runat="server" Text="Employee :"><b>Employee :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddlEmployee" class="form-control" data-show-subtext="true" data-live-search="true" runat="server">
                                    <asp:ListItem>-Select-</asp:ListItem>
                                   
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <!--End Form-->
                    <!--Upload Files--->
                 <%--   <div class="box-header">
                        <h3 class="box-title">Upload Files :</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group row">
                            <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
                                <asp:Label ID="lblDN" class="control-label col-md-4" runat="server" Text="Document Name"><b>Document Name : </b>
                                </asp:Label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtDN" CssClass="form-control" placeholder="Enter Document Name" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
                                <asp:Label ID="lblCF" class="control-label col-md-4" runat="server" Text="Choose File"><b>Choose File :</b>
                                </asp:Label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtCF" CssClass="form-control" type="file" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>--%>  
                     <div class="box-header">
                            <h3 class="box-title"><b>Upload Files :</b></h3>
                        </div>
                      <div class="box-body">
                         <div class="form-group row">
                              <div class="col-md-5 col-lg-5 col-sm-12 col-xs-12">
                                    <asp:Label ID="Label1" class="control-label" runat="server" Text="Document Name"><b>Document Name : </b>  <span class="requiredLabel">*</span>
                                    </asp:Label>
                                    <asp:TextBox ID="txtDocumentName0" CssClass="form-control" placeholder="Enter Document Name" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvDN" runat="server" ErrorMessage="Please Enter Document Name" ForeColor="Red" ControlToValidate="txtDocumentName0"></asp:RequiredFieldValidator>
                                </div>

                             <div class="col-md-5 col-lg-5 col-sm-12 col-xs-12">
                                    <asp:Label ID="ChooseFile1" class="control-label" runat="server" Text="Choose File"><b>Choose File :</b>  <span class="requiredLabel">*</span>
                                    </asp:Label>
                                    <asp:FileUpload ID="UploadDoc0" CssClass="form-control" runat="server" />
                                    <asp:RequiredFieldValidator ID="rfvUD" runat="server" ErrorMessage="Please Choose File " ForeColor="Red" ControlToValidate="UploadDoc0"></asp:RequiredFieldValidator>
                                </div>
                            <%--<div class="col-md-2" style="margin-top: 25px;">
                                    <asp:Button ID="btnAdd" Style="font-size: 17px;" CssClass="fa fa=plus-circle fa-lg" runat="server" Text="Add" CausesValidation="false"  />
                                </div>--%>
                            </div>
                            <asp:PlaceHolder runat="server" ID="ctrPlaceholder2"></asp:PlaceHolder>
                           <!--2nd row--->
                           <div class="form-group row">
                              <div class="col-md-5 col-lg-5 col-sm-12 col-xs-12">
                                    <asp:Label ID="Label2" class="control-label" runat="server" Text="Document Name"><b>Document Name : </b>  <span class="requiredLabel">*</span>
                                    </asp:Label>
                                    <asp:TextBox ID="txtDocumentName1" CssClass="form-control" placeholder="Enter Document Name" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Document Name" ForeColor="Red" ControlToValidate="txtDocumentName0"></asp:RequiredFieldValidator>
                                </div>

                             <div class="col-md-5 col-lg-5 col-sm-12 col-xs-12">
                                    <asp:Label ID="Label5" class="control-label" runat="server" Text="Choose File"><b>Choose File :</b>  <span class="requiredLabel">*</span>
                                    </asp:Label>
                                    <asp:FileUpload ID="UploadDoc1" CssClass="form-control" runat="server" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Choose File " ForeColor="Red" ControlToValidate="UploadDoc0"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <asp:PlaceHolder runat="server" ID="PlaceHolder1"></asp:PlaceHolder>
                        </div>


                     <!--Upload Files--->
                    <div class="box-header">
                        <h3 class="box-title">Contact Details :</h3>
                    </div>
                    <div class="box-body" style="border:1px solid #ddd;">
                        <!--Accounts-->
                        <div>
                        <div class="form-group row">
                            <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                                <asp:Label ID="lblAccounts" class="control-label col-md-3" runat="server" Text="Accounts :"><b>Accounts : </b>
                                </asp:Label>
                                <div class="col-md-2">
                              <asp:Label ID="lblAcName" class="control-label" runat="server" >
                                </asp:Label>
                                </div>
                                  <div class="col-md-4">
                              <asp:Label ID="lblAcEmail" class="control-label" runat="server" >
                                </asp:Label>
                                </div>
                                  <div class="col-md-3">
                              <asp:Label ID="lblAcPhoneNumber" class="control-label" runat="server" >
                                </asp:Label>
                                </div>
                            </div>
                        </div>
                            </div>
                  <!--Operations-->
                   <div class="form-group row">
                            <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                                <asp:Label ID="lblOperations" class="control-label col-md-3" runat="server" Text="Operations :"><b>Operations : </b>
                                </asp:Label>
                                <div class="col-md-2">
                              <asp:Label ID="lblopName1" class="control-label" runat="server" >
                                </asp:Label>
                                </div>
                                  <div class="col-md-4">
                              <asp:Label ID="lblopEmail1" class="control-label" runat="server" >
                                </asp:Label>
                                </div>
                                  <div class="col-md-3">
                              <asp:Label ID="lblopPhoneNumber1" class="control-label" runat="server" >
                                </asp:Label>
                                </div>
                            </div>
                        </div>
                       <!--Management-->
                         <div class="form-group row">
                            <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                                <asp:Label ID="lblManagement" class="control-label col-md-3" runat="server" Text="Management :"><b>Management : </b>
                                </asp:Label>
                                <div class="col-md-2">
                              <asp:Label ID="lblmnName2" class="control-label" runat="server" >
                                </asp:Label>
                                </div>
                                  <div class="col-md-4">
                              <asp:Label ID="lblmnEmail2" class="control-label" runat="server" >
                                </asp:Label>
                                </div>
                                  <div class="col-md-3">
                              <asp:Label ID="lblmnPhoneNumber2" class="control-label" runat="server" >
                                </asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <!-- Buttons--->
                    <div class="form-group">
                        <div class="footer-bottom pull-right">
                            <asp:Button ID="btnApprove" CssClass="btn btn-primary" runat="server" Text="Approve" Style="width: 100px;" OnClick="btnApprove_Click1" />
                            <asp:Button ID="btnReject" CssClass="btn btn-danger" runat="server" Text="Reject" Style="width: 100px;" OnClick="btnReject_Click1" />
                            <asp:Button ID="btnBack" CssClass="btn btn-danger" PostBackUrl="Registrations.aspx" runat="server" Text="Back" Style="width: 100px;" OnClick="btnBack_Click" />
                            <asp:HiddenField ID="hdnAgentID" runat="server" />
                        </div>
                    </div>

                </div>
            </div>
        </section>
    
</asp:Content>
