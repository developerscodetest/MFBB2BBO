<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="AgentsView.aspx.cs" Inherits="MFBDBO.Master.AgentsView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
<form runat="server">
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
                <div class="box-body">
                     <div class="row">
                          <div class="col-md-6">
                                <asp:Label ID="Label1" class="control-label col-sm-4" runat="server" Text="Label">
                                    <h4>Agency Code  :</h4>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="Label2" class="control-label col-sm-12" runat="server" Text="Label">
                                     
                                      <h4>MFB2018</h4>
                                    </asp:Label>
                                </div>
                            </div>
                     </div>
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
                                <asp:Label ID="lblAE" class="control-label col-sm-4" runat="server" Text="Label"><b>Agency Email :</b>
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
                                <asp:Label ID="lblReceived" class="control-label col-sm-4" runat="server" Text="Label"><b>Username :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblOff" class="control-label col-sm-4" runat="server" Text="Label">asdfh
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <!--6th row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblAgency" class="control-label col-sm-4" runat="server" Text="Label"><b>Password :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblAgencyName" class="control-label col-sm-4" runat="server" Text="Label">xysss
                                    </asp:Label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="lblAgencyContact" class="control-label col-sm-4" runat="server" Text="Label"><b>Confirm Password :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblAgencyNo" class="control-label col-sm-4" runat="server" Text="Label">dfdhgfj
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <!--7th row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblCancellation" class="control-label col-sm-4" runat="server" Text="Label"><b>Address :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblNR" class="control-label col-sm-6" runat="server" Text="Label">asfsg
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
                                <asp:Label ID="lblAdults" class="control-label col-sm-4" runat="server" Text="Label"><b>Country :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblANo" class="control-label col-sm-6" runat="server" Text="Label">India
                                    </asp:Label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="lblkids" class="control-label col-sm-4" runat="server" Text="Label"><b>Pincode :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblKidsNo" class="control-label col-sm-4" runat="server" Text="Label">500039
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <!--9th row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblGuestDetails" class="control-label col-sm-4" runat="server" Text="Label"><b>Prefered Currency :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblGDname" class="control-label col-sm-6" runat="server" Text="Label">Rupees
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                    </form>
               <div class="box-header">
                        <h4><b>Commission Details</b></h4>
                    </div>
                     <form>
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="Label3" class="control-label col-sm-4" runat="server" Text="Label"><b>Commission :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtAName" class="form-control" placeholder="Enter Commission" runat="server"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                    </form>
                    <div class="footer-bottom pull-right">
                   <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Save" style="width:100px;" />
                  <asp:Button ID="Button1" CssClass="btn btn-danger" PostBackUrl="ActiveAgents.aspx" runat="server" Text="Back" style="width:100px;" />
                    </div>


                </div>
            </div>
        </section>
    </form>
</asp:Content>
