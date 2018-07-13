<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="SupplierView.aspx.cs" Inherits="MFBDBO.Master.SupplierView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
  
        <section class="content-header">
            <h1>Supplier View</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
               <li class="#">Supplier List</li>
                <li class="active">Supplier View</li>
            </ol>
        </section>
       <section class="content">
            <div class="box">
                         <!--Supplier Details--->
                        <div class="box-header with-border">
                            <h4 class="box-title">Supplier Details</h4>
                        </div>
                         <div class="box-body">
                        <!--1st row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblSupplier" CssClass="control-label col-sm-4" runat="server" Text="Supplier"><b>Supplier :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblGRNConnect" CssClass="control-label " runat="server" Text="Label">GRN Connect
                                    </asp:Label>
                                </div>
                            </div>
                             <div class="col-md-6">
                                <asp:Label ID="lblName" CssClass="control-label col-sm-4" runat="server" Text="Name"><b>Name :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblNam" CssClass="control-label " runat="server" Text="Karthik">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <!--2nd row-->
                        <div class="form-group row">
                             <div class="col-md-6">
                                <asp:Label ID="lblEmail" CssClass="control-label col-sm-4" runat="server" Text="Email"><b>Email :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblSEmail" CssClass="control-label " runat="server" Text="grnconnect08@gmail.com">
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblMobile" CssClass="control-label col-sm-4" runat="server" Text="Mobile"><b>Mobile :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblSMobile" CssClass="control-label " runat="server" Text="9876543210">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <!--3rd row-->
                        <div class="form-group row">
                              <div class="col-md-6">
                                <asp:Label ID="lblAddress" CssClass="control-label col-sm-4" runat="server" Text="Address"><b>Address :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                         <asp:Label ID="lblAdd" CssClass="control-label" runat="server" Text="dsgffjklkreytoiup;">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                         </div>
                   <br />
                    <!--Api Details--->
                        <div class="box-header with-border">
                            <h4 class="box-title">API Details</h4>
                        </div>
                         <div class="box-body">
                        <!--4th row-->
                       <div class="form-group row">
                       <div class="col-md-6">
                                <asp:Label ID="lblAPD" CssClass="control-label col-sm-4" runat="server" Text="API Purchase Date"><b>API Purchase Date :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblAPDate" CssClass="control-label " runat="server" Text="29-05-2018">
                                    </asp:Label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="lblAKey" CssClass="control-label col-sm-4" runat="server" Text="API Key"><b>API Key :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblApiKey" CssClass="control-label " runat="server" Text="">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                      <div class="clearfix"></div>
                       <!---6th row--->
                       <div class="form-group row">
                                   <div class="col-md-6">
                                <asp:Label ID="lblAPV" CssClass="control-label col-sm-4" runat="server" Text="API Purchase Value"><b>API Purchase Value :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblAPValue" CssClass="control-label " runat="server" Text="1000000 /-">
                                    </asp:Label>
                                </div>
                            </div>
                             </div>
                      <div class="clearfix"></div>
                             </div> 
               <br />
                        <!--Access Details--->
                        <div class="box-header with-border">
                            <h4 class="box-title">Access Details</h4>
                        </div>
                         <div class="box-body">
                         <!--7th row-->
                          <div class="form-group row">
                           <div class="col-md-6">
                                <asp:Label ID="lblAgentLink" CssClass="control-label col-sm-4" runat="server" Text="Agent Link"><b>Agent Link :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblAgntLnk" CssClass="control-label" runat="server" Text="dfhkgjllkdfhglkj">
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblAgentCode" CssClass="control-label col-sm-4" runat="server" Text="Agent Code"><b>Agent Code :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblAgntCd" CssClass="control-label" runat="server" Text="100003">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                         <div class="clearfix"></div>
                         <!--6th row-->
                          <div class="form-group row">
                           <div class="col-md-6">
                                <asp:Label ID="lblUserName" CssClass="control-label col-sm-4" runat="server" Text="Username"><b>Username :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblUN" CssClass="control-label" runat="server" Text="Praveen">
                                    </asp:Label>
                                </div>
                            </div>
                           <div class="col-md-6">
                                <asp:Label ID="lblPassword" CssClass="control-label col-sm-4" runat="server" Text="Password"><b>Password :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblPasswrd" CssClass="control-label" runat="server" Text="asfdjhgk">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                           <div class="clearfix"></div>
                        </div>
                <br />
                        <!--Contact Details--->
                        <div class="box-header with-border">
                            <h4 class="box-title">Contact Details</h4>
                        </div>
                         <div class="box-body">
                        <div class="form-group row">
                            <div class="col-md-4">
                                <asp:Label ID="lblAccounts" CssClass="control-label" runat="server" Text="Accounts"><b>Accounts :</b></asp:Label>                           
                             <asp:TextBox ID="txtAName" CssClass="form-control" disabled runat="server"></asp:TextBox>                                                                                        
                            </div>
                             <div class="col-md-4">
                            <asp:Label ID="lblOperations" CssClass="control-label" runat="server" Text="Operations"><b>Operations :</b></asp:Label>                         
                            <asp:TextBox ID="txtOperationsName" CssClass="form-control" disabled  runat="server"></asp:TextBox>                       
                            </div>
                              <div class="col-md-4">
                                 <asp:Label ID="lblManagement" CssClass="control-label" runat="server" Text="Management"><b>Management :</b></asp:Label>               
                             <asp:TextBox ID="txtManagementName" CssClass="form-control" disabled runat="server"></asp:TextBox>                                                    
                            </div>
                           <div class="col-md-1"></div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group row">
                            <div class="col-md-4">
                             <asp:TextBox ID="txtAEmail" CssClass="form-control" disabled runat="server"></asp:TextBox>                                                                                        
                            </div>
                             <div class="col-md-4">
                            <asp:TextBox ID="txtOEmail" CssClass="form-control" disabled runat="server"></asp:TextBox>                       
                            </div>
                              <div class="col-md-4">
                             <asp:TextBox ID="txtMEmail" CssClass="form-control" disabled runat="server"></asp:TextBox>                                                    
                            </div>
                        </div>
                        <div class="clearfix"></div>
                         <div class="form-group row">
                            <div class="col-md-4">
                             <asp:TextBox ID="txtANumber" CssClass="form-control" disabled runat="server"></asp:TextBox>                                                                                        
                            </div>
                             <div class="col-md-4">
                             <asp:TextBox ID="txtONumber" CssClass="form-control" disabled runat="server"></asp:TextBox>                                                    
                            </div>
                              <div class="col-md-4">
                             <asp:TextBox ID="txtMNumber" CssClass="form-control" disabled runat="server"></asp:TextBox>                                                    
                            </div>
                        </div>
                        <div class="clearfix"></div>
                         </div>
                        <!--Buttons-->
                        <div class="footer-bottom" style="text-align: right">
                         <asp:Button ID="btnBack" class="btn btn-danger" PostBackUrl="SuppliersList.aspx" runat="server" Text="Back" style="width: 90px" />                                                                                          
                         <asp:HiddenField ID="hdnSupplierID" runat="server" />
                        </div>
                   
            </div>
        </section>
      
</asp:Content>
