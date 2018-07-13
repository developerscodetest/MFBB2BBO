<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="AgentsView.aspx.cs" Inherits="MFBDBO.Master.AgentsView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        function alertMessage(text) {
            alert(text);
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    
        <section class="content-header">
            <h1>Agent Details</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Agent Details</li>
            </ol>
        </section>
        <section class="content">
            <div class="box">
                <!-- /.box-header -->
                <div class="box-header with-border">
                    <h3 class="box-title">Personal Details</h3>
                </div>
                <div class="box-body">
                    <!--1st row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblACode" class="control-label col-sm-4" runat="server" Text="Agency Code  :">
                                    <h4>Agency Code  :</h4>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblAC" class="control-label col-sm-12" runat="server" >                                     
                                      <h4></h4>
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                    <!--2nd row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblAName" class="control-label col-sm-4" runat="server" Text="Agency Name  :"><b>Agency Name  :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblAgencyName" class="control-label col-sm-12" runat="server">
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
                    <!--3rd row-->
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
                                <asp:Label ID="lblLName" class="control-label col-sm-4" runat="server" >
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                    <!--4th row-->
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
                                <asp:Label ID="lblCN" class="control-label col-sm-4" runat="server" >
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                    <!---5th row-->
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
                                <asp:Label ID="lblAdd" class="control-label col-sm-6" runat="server" >
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                    <!---6th row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblCountry" class="control-label col-sm-4" runat="server" Text="Country"><b>Country :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblCntry" class="control-label col-sm-6" runat="server">
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
                    <!--7th row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblCity" class="control-label col-sm-4" runat="server" Text="City :"><b>City :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblCt" class="control-label col-sm-4" runat="server" ></asp:Label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblPCode" class="control-label col-sm-4" runat="server" Text="Pincode :"><b>Pincode :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblPin" class="control-label col-sm-4" runat="server">
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                    <!---8th row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblPCurrency" class="control-label col-sm-4" runat="server" Text="Preferred Currency :"><b>Preferred Currency :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblPC" class="control-label col-sm-6" runat="server" >
                                </asp:Label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblIATAStatus" class="control-label col-sm-4" runat="server" Text="IATA Status :"><b>IATA Status :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblIATAS" class="control-label col-sm-4" runat="server" >
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                    <!--9th row-->
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
                            <asp:Label ID="IATARegNo" class="control-label col-sm-4" runat="server" Text="IATA Reg NO :"><b>IATA Reg NO :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblIATARNo" class="control-label col-sm-4" runat="server" >
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                    <!--10th row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblEmployee" class="control-label col-sm-4" runat="server" Text="Employee :"><b>Employee :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblEname" class="control-label col-sm-4" runat="server" >
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Access Details--->
                <div class="box-header with-border">
                    <h4>Access Details</h4>
                </div>
                <div class="box-body">
                    <!--11th row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblUsername" class="control-label col-sm-4" runat="server" Text="Username :"><b>Username :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblUName" class="control-label col-sm-4" runat="server" >
                                </asp:Label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblPassword" class="control-label col-sm-4" runat="server" Text="Password"><b>Password :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblPWord" class="control-label col-sm-4" runat="server">
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Commission Details-->
                <div class="box-header with-border">
                    <h4>Commission Details</h4>
                </div>
                <div class="box-body">
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblCommission" class="control-label col-sm-4" runat="server" Text="Commission"><b>Commission :</b>
                              <span style="color: red;">*</span></asp:Label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtCommission1" class="form-control" placeholder="Enter Commission" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revCommission" runat="server" ControlToValidate="txtCommission1" ValidationExpression="-?\d+(\.\d{1,3})?" ErrorMessage="Enter only Positive values"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="box-header">
                        <h3 class="box-title"><b>Documents :</b></h3>
                    </div>
                    <div class="box-body" id="mydoc" runat="server">
                      </div>

                <!--Contact Details-->
                <div class="box-header with-border">
                    <h3 class="box-title">Contact Details :</h3>
                </div>
                <div class="box-body">
                    <div style="border: 1px solid #ddd;">
                        <!--Accounts-->
                        <div class="form-group row">
                            <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                                <asp:Label ID="lblAccounts" class="control-label col-md-3" runat="server" Text="Accounts :"><b>Accounts : </b>
                                </asp:Label>
                                <div class="col-md-2">
                                    <asp:Label ID="lblACName" class="control-label" runat="server" >
                                    </asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblACEmail" class="control-label" runat="server" >
                                    </asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <asp:Label ID="lblACPhoneNumber" class="control-label" runat="server" >
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <!--Operations-->
                        <div class="form-group row">
                            <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                                <asp:Label ID="lblOperations" class="control-label col-md-3" runat="server" Text="Operations :"><b>Operations : </b>
                                </asp:Label>
                                <div class="col-md-2">
                                    <asp:Label ID="lblOPName" class="control-label" runat="server" >
                                    </asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblOPEmail1" class="control-label" runat="server" >
                                    </asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <asp:Label ID="lblOPPhoneNumber" class="control-label" runat="server" >
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
                                    <asp:Label ID="lblMNName" class="control-label" runat="server" >
                                    </asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblMNEmail" class="control-label" runat="server" >
                                    </asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <asp:Label ID="lblMNPhoneNumber" class="control-label" runat="server" >
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                     </div>
                     <br />
                 <!--Buttons-->
                <div class="footer-bottom pull-right">
                    <asp:Button ID="btnUpdate" CssClass="btn btn-primary" runat="server" Text="Update" Style="width: 100px;" OnClick="btnUpdate_Click1" />
                    <asp:Button ID="btnReset" CssClass="btn btn-danger" PostBackUrl="ActiveAgents.aspx" runat="server" Text="Back" Style="width: 100px;" OnClick="btnReset_Click" />
               <asp:HiddenField ID="hdnAgentID" runat="server" />
                     </div>
                </div>
            </div>
        </section>
    
</asp:Content>
