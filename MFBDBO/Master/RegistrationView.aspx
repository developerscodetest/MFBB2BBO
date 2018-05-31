<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="RegistrationView.aspx.cs" Inherits="MFBDBO.Master.RegistrationView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    <form runat="server">
        <section class="content-header">
            <h1>Registration Details</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Registration Details</li>
            </ol>
        </section>
        <section class="content">
            <div class="box">
                <div class="box-header"></div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form>
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblAName" class="control-label col-sm-4" runat="server" Text="Label"><b>Agency Name  :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblKT" class="control-label col-sm-12" runat="server" Text="Label">Karthik Travels
                                    </asp:Label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="lblAE" class="control-label col-sm-4" runat="server" Text="Label"><b>AgencyEmail :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblAEmail" class="control-label col-sm-4" runat="server" Text="Label">K101@gmail.com
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <!--2nd row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblPhone" class="control-label col-sm-4" runat="server" Text="Label"><b>Phone :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblPN" class="control-label col-sm-4" runat="server" Text="Label">9876543210
                                    </asp:Label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="lblCategory" class="control-label col-sm-4" runat="server" Text="Label"><b>Category :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblCN" class="control-label col-sm-4" runat="server" Text="Label">B2B
                                    </asp:Label>
                                </div>
                            </div>
                        </div>

                        <!--3rd row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblIATA" class="control-label col-sm-4" runat="server" Text="Label"><b>IATA Status :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblYES" class="control-label col-sm-4" runat="server" Text="Label">Yes
                                    </asp:Label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="lblRegNo" class="control-label col-sm-4" runat="server" Text="Label"><b>IATA Reg NO :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblRN" class="control-label col-sm-4" runat="server" Text="Label">1234367
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <!--4th row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblWebsite" class="control-label col-sm-4" runat="server" Text="Label"><b>Website :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblWeb" class="control-label col-sm-4" runat="server" Text="Label">www.kt.com
                                    </asp:Label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="lblCheckOut" class="control-label col-sm-4" runat="server" Text="Label"><b>First Name:</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblCheckOutDate" class="control-label col-sm-4" runat="server" Text="Label">asfsfdg
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <!--5th row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblSupplier" class="control-label col-sm-4" runat="server" Text="Label"><b>Last Name :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblSName" class="control-label col-sm-4" runat="server" Text="Label">dgfdh
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblCancellation" class="control-label col-sm-4" runat="server" Text="Label"><b>Address :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblNR" class="control-label col-sm-6" runat="server" Text="Label">asfsg
                                    </asp:Label>
                                </div>
                            </div>

                        </div>

                        <!--7th row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblAdults" class="control-label col-sm-4" runat="server" Text="Label"><b>Country :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblANo" class="control-label col-sm-6" runat="server" Text="Label">India
                                    </asp:Label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="lblDeadline" class="control-label col-sm-4" runat="server" Text="Label"><b>City :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblDeadlineDate" class="control-label col-sm-4" runat="server" Text="Label">Hyderabad
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <!--8th row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblkids" class="control-label col-sm-4" runat="server" Text="Label"><b>Pincode :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblKidsNo" class="control-label col-sm-4" runat="server" Text="Label">500039
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="Label1" class="control-label col-sm-4" runat="server" Text="Label"><b>Prefered Currency :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="Label2" class="control-label col-sm-6" runat="server" Text="Label">Rupees
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!--End Form-->
                    <hr />
                    <!--Form Row--->
                  
                        <div class="box-header">
                            <h3 class="box-title"><b>Documents :</b></h3>
                        </div>
                      <div class="box-body">
                         <div class="form-group row">
                            <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
            <asp:Label ID="lblSNo" class="control-label col-md-1" runat="server" Text="Document Name"><span style="font-size:18px;">1. </span> 
                                </asp:Label>
                             <asp:Label ID="lblName" class="control-label col-md-4" runat="server" Text="Document Name"><span style="font-size:18px;">Pancard  </span> 
                                </asp:Label>
                                <div class="col-md-6">
                   <asp:Button ID="btnDownload" CssClass="btn btn-primary" runat="server" Text="Download" Style="width: 100px;" />
                                </div>
                            </div>
                        </div>
                          <div class="form-group row">
                            <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
                                  <asp:Label ID="Label4" class="control-label col-md-1" runat="server" Text="Document Name"><span style="font-size:18px;">2. </span> 
                                </asp:Label>
                             <asp:Label ID="Label3" class="control-label col-md-4" runat="server" Text="Document Name"><span style="font-size:18px;">Adhaar Card  </span> 
                                </asp:Label>
                                <div class="col-md-6">
                   <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Download" Style="width: 100px;" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Documents End Form--->
                       <div class="box-header">
                            <h3 class="box-title"><b>Upload Files :</b></h3>
                        </div>
                      <div class="box-body">
                         <div class="form-group row">
                            <div class="col-md-5 col-lg-5 col-sm-12 col-xs-12">
                             <asp:Label ID="lblDN" class="control-label col-md-4" runat="server" Text="Document Name"><b>Document Name : </b>
                                </asp:Label>
                                <div class="col-md-8">
                     <asp:TextBox ID="txtDN" CssClass="form-control" placeholder="Enter Document Name" runat="server"></asp:TextBox>
                                </div>
                            </div>
                             <div class="col-md-5 col-lg-5 col-sm-12 col-xs-12">
                             <asp:Label ID="lblCF" class="control-label col-md-4" runat="server" Text="Choose File"><b>Choose File :</b>
                                </asp:Label>
                                <div class="col-md-8">
                     <asp:TextBox ID="txtCF" CssClass="form-control" type="file" runat="server"></asp:TextBox>
                                </div>
                            </div>
                             <div class="col-md-2">
     <a href="#" style="font-size:17px;"><i class="fa fa-plus-circle fa-lg"></i></a>
                             </div>
                        </div>
                        
                    </div>
                    <!-- Upload File End Form--->

                    <div class="footer-bottom pull-right">
                        <asp:Button ID="btnApprove" CssClass="btn btn-primary" runat="server" Text="Approve" Style="width: 100px;" />
                        <asp:Button ID="btnReject" CssClass="btn btn-danger" runat="server" Text="Reject" Style="width: 100px;" />
                        <asp:Button ID="btnBack" CssClass="btn btn-danger" PostBackUrl="Registrations.aspx" runat="server" Text="Back" Style="width: 100px;" />
                    </div>


                </div>
            </div>
        </section>
    </form>
</asp:Content>
