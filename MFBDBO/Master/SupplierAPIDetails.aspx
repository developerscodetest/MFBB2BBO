<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="SupplierAPIDetails.aspx.cs" Inherits="MFBDBO.Master.SupplierAPIDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script type="text/javascript">
        function alertMessage(text) {
            alert(text);
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">

        <section class="content-header">
            <h1>Supplier API Details</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                <li class="active">Supplier API Details</li>
            </ol>
        </section>
        <section class="content">
         <div class="box">
             <div class="box-header with-border">
                 <h4 class="box-title">Supplier API Details</h4>
                </div>
                <div class="box-body">
                     <!--1st row--->
                     <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblSupplierID" class="control-label col-sm-4" runat="server" Text="Supplier ID :"><b>Supplier  :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                <asp:DropDownList ID="ddlSupplierID" CssClass="form-control" runat="server">
                                <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                            <%--    <asp:ListItem Text="" Value="1"></asp:ListItem>
                                <asp:ListItem Text="" Value="2"></asp:ListItem>--%>
                            </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblAPILink" class="control-label col-sm-4" runat="server" Text="API Link :"><b>API Link :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                     <asp:TextBox ID="txtAPILink" class="form-control" placeholder="Enter API Link"  runat="server"></asp:TextBox> 
                                </div>
                            </div>
                        </div>
                      <!--2nd row--->
                     <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblAPIKey" class="control-label col-sm-4" runat="server" Text="API Key :"><b>API Key :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                             <asp:TextBox ID="txtAPIKey" class="form-control" placeholder="Enter API Key" runat="server"></asp:TextBox> 
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblUsername" class="control-label col-sm-4" runat="server" Text="Username :"><b>Username :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                     <asp:TextBox ID="txtUsername" class="form-control" placeholder="Enter Username"  runat="server"></asp:TextBox> 
                                </div>
                            </div>
                        </div>
                    <!--3rd row-->
                       <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblPassword" class="control-label col-sm-4" runat="server" Text="Password :"><b>Password :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                             <asp:TextBox ID="txtPassword" class="form-control" placeholder="Enter Password" runat="server"></asp:TextBox> 
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblDescription" class="control-label col-sm-4" runat="server" Text="Description :"><b>Description :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                     <asp:TextBox ID="txtDescription" class="form-control" TextMode="MultiLine"  placeholder="Enter Description"  runat="server"></asp:TextBox> 
                                </div>
                            </div>
                        </div>
                    <!---Button-->
                        <div class="form-group pull-right">
                   <asp:Button ID="btnSave"  class="btn btn-primary" runat="server" Text="Save" style="width:100px;" OnClick="btnSave_Click" />
                   <asp:Button ID="btnReset" class="btn btn-danger"  runat="server" Text="Reset" Style="width: 100px;" OnClick="btnReset_Click" />
               <asp:Button ID="btnUpdate" class="btn btn-danger" runat="server" Text="Update" Style="width: 100px;" OnClick="btnUpdate_Click" />
                            <asp:HiddenField ID="hdnSupplierAPIId" runat="server" />
                        </div>

                    </div>
         </div>
        </section>
</asp:Content>
