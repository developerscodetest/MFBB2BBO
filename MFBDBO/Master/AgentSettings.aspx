<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="AgentSettings.aspx.cs" Inherits="MFBDBO.Master.AgentSettings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
 <form runat="server">
        <section class="content-header">
            <h1>Agent Settings</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                 <li class="active">Agent Settings</li>
            </ol>
        </section>
<section class="content">
        <div class="box">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box-body">
                        <div class="form-group row">
                            <div class="col-md-12">
              <asp:Label ID="lblName" class="control-label col-sm-2" runat="server" Text="Name"><b>Agency :</b></asp:Label>
                                <div class="col-sm-5">
          <select class="form-control select2">
                                <option>All</option>
                                   <option>Kaveri Travels</option>
                                   <option></option>
                                   <option></option>
                                   <option></option>
                            </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                                 <asp:Label ID="lblName2" class="control-label col-sm-2" runat="server" Text="Name"><b>Paynow :</b></asp:Label>
                                <div class="col-sm-5">
                           <select class="form-control select2">
                                <option>--select--</option>
                                   <option>Yes</option>
                                   <option>No</option>
                            </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                              <asp:Label ID="lblName3" class="control-label col-sm-2" runat="server" Text="Name"><b>Confirm Booking :</b></asp:Label>
                                <div class="col-sm-5">
                           <select class="form-control select2">
                                <option>--select--</option>
                                   <option>Yes</option>
                                   <option>No</option>
                            </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                              <asp:Label ID="Label1" class="control-label col-sm-2" runat="server" Text="Name"><b>Offline Request :</b></asp:Label>
                                <div class="col-sm-5">
                              <select class="form-control select2">
                                <option>--select--</option>
                                   <option>Yes</option>
                                   <option>No</option>
                            </select>
                                </div>
                            </div>
                        </div>
                       
                        <div style="text-align: right">
                         <asp:Button ID="btnSave" class="btn btn-success"  runat="server" Text="Save" style="width: 90px" />
                          <asp:Button ID="btnReset" class="btn btn-danger"  runat="server" Text="Reset" style="width: 90px" />
                                             
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>



    </form>

</asp:Content>
