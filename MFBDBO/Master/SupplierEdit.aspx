<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="SupplierEdit.aspx.cs" Inherits="MFBDBO.Master.SupplierEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    <form runat="server">
        <section class="content-header">
            <h1>Supplier Edit</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
               <li class="#">Supplier List</li>
                <li class="active">Supplier Edit</li>
            </ol>
        </section>

        <section class="content">
        <div class="box">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box-body">
                        <div class="form-group row">
                            <div class="col-md-4">
              <asp:Label ID="lblSupplier" class="control-label" runat="server" Text="Supplier"><b>Supplier : </b></asp:Label>
                        <asp:TextBox ID="txtSupplier" CssClass="form-control" placeholder="Enter Supplier" runat="server"></asp:TextBox>                              
                            </div>
                              <div class="col-md-4">
                             <asp:Label ID="lblEmail" class="control-label" runat="server" Text="Email"><b>Email :</b></asp:Label>                         
                            <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Enter Email" runat="server"></asp:TextBox>                       
                            </div>
                            <div class="col-md-4">
                             <asp:Label ID="lblName" class="control-label" runat="server" Text="Name"><b>Name :</b></asp:Label>                           
                             <asp:TextBox ID="txtName" placeholder="Enter Name" CssClass="form-control" runat="server"></asp:TextBox>                                                                                        
                            </div>
                        </div>
                       <div class="clearfix"></div>
                        <div class="form-group row">
                            <div class="col-md-4">
                                 <asp:Label ID="lblMobile" class="control-label" runat="server" Text="Mobile No"><b>Mobile No :</b></asp:Label>               
                             <asp:TextBox ID="txtMobile" placeholder="Enter Mobile No" CssClass="form-control" runat="server"></asp:TextBox>                                                    
                            </div>
                             <div class="col-md-4">
                              <asp:Label ID="lblAPIPurchaseDate" class="control-label" runat="server" Text="API Purchase Date"><b>Api Purchase Date :</b></asp:Label>                              
                              <div class="input-group date">
                           <asp:TextBox ID="txtAPDate" type="date" CssClass="form-control" runat="server"></asp:TextBox>
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                  </div>
                            </div>
                              <div class="col-md-4">
                                 <asp:Label ID="lblAPValue" class="control-label" runat="server" Text="API Purchase Value"><b>API Purchase Value :</b></asp:Label>               
                             <asp:TextBox ID="txtAPValue" placeholder="Enter API Purchase Value" CssClass="form-control" runat="server"></asp:TextBox>                                                    
                            </div>
                        </div>
                        <div class="clearfix"></div>
                         <div class="form-group row">
                            <div class="col-md-4">
                                 <asp:Label ID="lblAPIKey" class="control-label" runat="server" Text="API Key"><b>API Key :</b></asp:Label>               
                             <asp:TextBox ID="txtAPIKey" placeholder="Enter API Key" CssClass="form-control" runat="server"></asp:TextBox>                                                    
                            </div>
                        </div>
                          <div class="clearfix"></div>
                        <div>
                      <h3 class="box-title">Contact Details</h3>
                       <hr />
                       <div class="form-group row">
                            <div class="col-md-4">
                                <asp:Label ID="lblAccounts" class="control-label" runat="server" Text="Accounts"><b>Accounts :</b></asp:Label>                           
                             <asp:TextBox ID="txtAName" placeholder="Enter Name" CssClass="form-control" runat="server"></asp:TextBox>                                                                                        
                            </div>
                             <div class="col-md-4">
                            <asp:Label ID="lblOperations" class="control-label" runat="server" Text="Operations"><b>Operations :</b></asp:Label>                         
                            <asp:TextBox ID="txtOperationsName" placeholder="Enter Name" CssClass="form-control"  runat="server"></asp:TextBox>                       
                            </div>
                              <div class="col-md-4">
                                 <asp:Label ID="lblManagement" class="control-label" runat="server" Text="Management"><b>Management :</b></asp:Label>               
                             <asp:TextBox ID="txtManagementName" placeholder="Enter Name" CssClass="form-control" runat="server"></asp:TextBox>                                                    
                            </div>
                           <div class="col-md-1"></div>
                        </div>
                        <div class="clearfix"></div>

                       <div class="form-group row">
                            <div class="col-md-4">
                             <asp:TextBox ID="txtAEmail" placeholder="Enter Email" CssClass="form-control" runat="server"></asp:TextBox>                                                                                        
                            </div>
                             <div class="col-md-4">
                            <asp:TextBox ID="txtOEmail" placeholder="Enter Email" CssClass="form-control"  runat="server"></asp:TextBox>                       
                            </div>
                              <div class="col-md-4">
                             <asp:TextBox ID="txtMEmail" placeholder="Enter Email" CssClass="form-control" runat="server"></asp:TextBox>                                                    
                            </div>
                        </div>
                        <div class="clearfix"></div>
                         <div class="form-group row">
                            <div class="col-md-4">
                             <asp:TextBox ID="txtANumber" placeholder="Enter Number" CssClass="form-control" runat="server"></asp:TextBox>                                                                                        
                            </div>
                             <div class="col-md-4">
                             <asp:TextBox ID="txtONumber" placeholder="Enter Number" CssClass="form-control" runat="server"></asp:TextBox>                                                    
                            </div>
                              <div class="col-md-4">
                             <asp:TextBox ID="txtMNumber" placeholder="Enter Number" CssClass="form-control" runat="server"></asp:TextBox>                                                    
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        </div>
                        <div style="text-align: right">
                         <asp:Button ID="btnSave" class="btn btn-success"  runat="server" Text="Save" style="width: 90px" />
                          <asp:Button ID="btnReset" class="btn btn-danger"  runat="server" Text="Reset" style="width: 90px" />
                         <asp:Button ID="btnBack" class="btn btn-danger" PostBackUrl="SuppliersList.aspx" runat="server" Text="Back" style="width: 90px" />                                                                                          
                        </div>
                        <br />
                    </div>
                </div>
            </div>


        </div>
    </section>


       
    </form>
</asp:Content>
