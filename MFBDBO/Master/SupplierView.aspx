<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="SupplierView.aspx.cs" Inherits="MFBDBO.Master.SupplierView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
  <form runat="server">
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
                <!-- /.box-header -->
                <div class="box-body">
                    <form>
                        <!--1st row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblSupplier" class="control-label col-sm-4" runat="server" Text="Supplier"><b>Supplier :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblGRNConnect" class="control-label " runat="server" Text="Label">GRN Connect
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblEmail" class="control-label col-sm-4" runat="server" Text="Email"><b>Email :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblSEmail" class="control-label " runat="server" Text="grnconnect08@gmail.com">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <!--2nd row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblName" class="control-label col-sm-4" runat="server" Text="Name"><b>Name :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblNam" class="control-label " runat="server" Text="Karthik">
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblMobile" class="control-label col-sm-4" runat="server" Text="Mobile"><b>Mobile :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblSMobile" class="control-label " runat="server" Text="9876543210">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <!--3rd row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblAPD" class="control-label col-sm-4" runat="server" Text="API Purchase Date"><b>API Purchase Date :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblAPDate" class="control-label " runat="server" Text="29-05-2018">
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblAPV" class="control-label col-sm-4" runat="server" Text="API Purchase Value"><b>API Purchase Value :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblAPValue" class="control-label " runat="server" Text="1000000 /-">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <!--4th row-->
                          <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblAKey" class="control-label col-sm-4" runat="server" Text="API Key"><b>API Key :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblApiKey" class="control-label " runat="server" Text="">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div><hr />
                    <h3 class="box-title" style="font-size: 20px;">Contact Details</h3>
                        <div class="form-group row">
                            <div class="col-md-4">
                                <asp:Label ID="lblAccounts" class="control-label" runat="server" Text="Accounts"><b>Accounts :</b></asp:Label>                           
                             <asp:TextBox ID="txtAName" CssClass="form-control" disabled runat="server"></asp:TextBox>                                                                                        
                            </div>
                             <div class="col-md-4">
                            <asp:Label ID="lblOperations" class="control-label" runat="server" Text="Operations"><b>Operations :</b></asp:Label>                         
                            <asp:TextBox ID="txtOperationsName" CssClass="form-control" disabled  runat="server"></asp:TextBox>                       
                            </div>
                              <div class="col-md-4">
                                 <asp:Label ID="lblManagement" class="control-label" runat="server" Text="Management"><b>Management :</b></asp:Label>               
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
                        <div style="text-align: right">
                         <asp:Button ID="btnSave" class="btn btn-success"  runat="server" Text="Save" style="width: 90px" />
                          <asp:Button ID="btnReset" class="btn btn-danger"  runat="server" Text="Reset" style="width: 90px" />
                         <asp:Button ID="btnBack" class="btn btn-danger" PostBackUrl="SuppliersList.aspx" runat="server" Text="Back" style="width: 90px" />                                                                                          
                        </div>


                    </div>

                </div>
            </div>
        </section>


      </form>
</asp:Content>
