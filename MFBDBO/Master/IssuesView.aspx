<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="IssuesView.aspx.cs" Inherits="MFBDBO.Master.IssuesView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function alertMessage(text) {
            alert(text);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    
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
                                    <asp:Label ID="lblBookingID" CssClass="control-label col-sm-2" runat="server" Text="BookingID"><b>Booking ID :</b></asp:Label>
                                    <div class="col-sm-5">
                                        <%--<asp:DropDownList ID="ddlBookingID" CssClass="form-control" runat="server">
                                            <asp:ListItem Enabled="true" Text="--Select--"></asp:ListItem>
                                            <asp:ListItem Enabled="true" Text="1"></asp:ListItem>
                                            <asp:ListItem Enabled="true" Text="2"></asp:ListItem>
                                        </asp:DropDownList>--%>
                                    <asp:TextBox ID="txtBookingId" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <asp:Label ID="lblName2" CssClass="control-label col-sm-2" runat="server" Text="Name"><b>Issue :</b></asp:Label>
                                    <div class="col-sm-5">                                        
                                        <asp:TextBox ID="txtIssue" CssClass="form-control" runat="server" style="resize:none" TextMode="MultiLine" Height="100"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <asp:Label ID="lblStatus" CssClass="control-label col-sm-2" runat="server" Text="Name"><b>Status :</b></asp:Label>
                                    <div class="col-sm-5">
                                        <asp:DropDownList ID="ddlStatus" CssClass="form-control" runat="server">
                                            <asp:ListItem Enabled="true" Text="--Select--" Value="0"></asp:ListItem>
                                            <asp:ListItem Enabled="true" Text="Reopen" Value="1"></asp:ListItem>
                                            <asp:ListItem Enabled="true" Text="Open" Value="2"></asp:ListItem>
                                            <asp:ListItem Enabled="true" Text="Closed" Value="3"></asp:ListItem>
                                        </asp:DropDownList>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <asp:Label ID="lblPriority" CssClass="control-label col-sm-2" runat="server" Text="Name"><b>Priority :</b></asp:Label>
                                    <div class="col-sm-5">
                                        <asp:DropDownList ID="ddlPriority" CssClass="form-control" runat="server">
                                            <asp:ListItem Enabled="true" Text="--Select--" Value="0"></asp:ListItem>
                                            <asp:ListItem Enabled="true" Text="Low" Value="1"></asp:ListItem>
                                            <asp:ListItem Enabled="true" Text="Medium" Value="2"></asp:ListItem>
                                            <asp:ListItem Enabled="true" Text="High" Value="3"></asp:ListItem>
                                        </asp:DropDownList>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <asp:Label ID="Label3" CssClass="control-label col-sm-2" runat="server" Text="Name"><b>Assign To Employee :</b></asp:Label>
                                    <div class="col-sm-5">
                                       <%-- <asp:DropDownList ID="ddlAssignToEmployee" CssClass="form-control" runat="server">
                                            <asp:ListItem Enabled="true" Text="--Select--"></asp:ListItem>
                                            <asp:ListItem Enabled="true" Text="-11-"></asp:ListItem>
                                            <asp:ListItem Enabled="true" Text="-21-"></asp:ListItem>
                                        </asp:DropDownList>--%>
                                        <asp:TextBox ID="txtATOEmployee" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <asp:Label ID="lblNote" CssClass="control-label col-sm-2" runat="server" Text="Note"><b>Note :</b><span style="color:red">*</span></asp:Label>
                                    <div class="col-sm-5">
                                        <asp:TextBox ID="txtNote" CssClass="form-control" runat="server" Style="resize:none" TextMode="MultiLine" Height="100"></asp:TextBox>
                                    </div>                                    
                                </div>
                            </div>
                            <div style="text-align: right">
                                
                                <asp:Button ID="btnUpdate" CssClass="btn btn-primary" runat="server" Text="Update" Style="width: 100px;" OnClick="BtnUpdate_Click" />                                
                                <asp:Button ID="btnBack" CssClass="btn btn-danger" PostBackUrl="IssuesList.aspx" runat="server" Text="Back" Style="width: 90px" />
                                <asp:HiddenField ID="hdnIssuesId" runat="server" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
    
</asp:Content>
