<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="Issues.aspx.cs" Inherits="MFBDBO.Master.Issues" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
  <form runat="server">
        <section class="content-header">
            <h1>Issues</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Issues</li>
            </ol>
        </section>
        <section class="content">
        <div class="box">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box-body">
                        <div class="form-group row">
                            <div class="col-md-12">
              <asp:Label ID="lblName" class="control-label col-sm-2" runat="server" Text="Name"><b>Booking ID :</b></asp:Label>
                                <div class="col-sm-5">
            <select class="form-control select2">
                <option>--Select--</option>
            </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                                 <asp:Label ID="lblName2" class="control-label col-sm-2" runat="server" Text="Name"><b>Issue :</b></asp:Label>
                                <div class="col-sm-5">
                          <textarea class="form-control" rows="4" typeof="text" placeholder="Enter Issue"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                             <div class="col-md-12">
              <asp:Label ID="Label1" class="control-label col-sm-2" runat="server" Text="Name"><b>Status :</b></asp:Label>
                                <div class="col-sm-5">
            <select class="form-control select2">
                <option>--Select--</option>
                 <option>Reopen</option>
                 <option>Open</option>
                 <option>Closed</option>
            </select>
                                </div>
                            </div>
                        </div>
                           <div class="form-group row">
                          <div class="col-md-12">
              <asp:Label ID="Label2" class="control-label col-sm-2" runat="server" Text="Name"><b>Priority :</b></asp:Label>
                                <div class="col-sm-5">
            <select class="form-control select2">
                <option>--Select--</option>
                 <option>Low</option>
                 <option>Medium</option>
                 <option>High</option>
            </select>
                                </div>
                            </div>
                               </div>
                         <div class="form-group row">
                          <div class="col-md-12">
              <asp:Label ID="Label3" class="control-label col-sm-2" runat="server" Text="Name"><b>Assign To Employee :</b></asp:Label>
                                <div class="col-sm-5">
            <select class="form-control select2">
                <option>--Select--</option>
            </select>
                                </div>
                            </div>
                               </div>
                        <div style="text-align: right">
                         <asp:Button ID="btnSave" class="btn btn-success"  runat="server" Text="Save" style="width: 90px" />
                          <asp:Button ID="btnReset" class="btn btn-danger"  runat="server" Text="Reset" style="width: 90px" />
                               <asp:Button ID="btnBack" class="btn btn-danger" PostBackUrl="IssuesList.aspx"  runat="server" Text="Back" style="width: 90px" />                   
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>


      </form>
</asp:Content>
