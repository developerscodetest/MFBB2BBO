<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="Issues.aspx.cs" Inherits="MFBDBO.Master.Issues" %>

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
                                    <asp:Label ID="lblBookingID" CssClass="control-label col-sm-2" runat="server" Text="BookingID"><b>Booking ID : </b><span style="color:red">*</span></asp:Label>
                                    <div class="col-sm-5">
                                        <asp:DropDownList ID="ddlBookingID" CssClass="form-control" runat="server">
                                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="1"></asp:ListItem>
                                            <asp:ListItem Text="2"></asp:ListItem>
                                        </asp:DropDownList>
                                        <%--<asp:TextBox ID="txtBookingId" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>--%>
                                    </div>
                                    <%--<asp:RequiredFieldValidator ID="rfvBookingID" ControlToValidate="ddlBookingID" runat="server" ErrorMessage="Select BookingID" ForeColor="Red"  InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <asp:Label ID="lblIssue" CssClass="control-label col-sm-2" runat="server" Text="Issue"><b>Issue :</b><span style="color:red">*</span></asp:Label>
                                    <div class="col-sm-5">                                        
                                        <asp:TextBox ID="txtIssue" CssClass="form-control" runat="server" TextMode="MultiLine" Height="100"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="rfvIssue" ControlToValidate="txtIssue" runat="server" ErrorMessage="*" ForeColor="Red" Text="Issue is Required" ></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <asp:Label ID="lblStatus" CssClass="control-label col-sm-2" runat="server" Text="Name"><b>Status :</b><span style="color:red">*</span></asp:Label>
                                    <div class="col-sm-5">
                                        <asp:DropDownList ID="ddlStatus" CssClass="form-control" runat="server">
                                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Reopen" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Open" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Closed" Value="3"></asp:ListItem>
                                        </asp:DropDownList>

                                    </div>
                                    <asp:RequiredFieldValidator ID="rfvStatus" ControlToValidate="ddlStatus" runat="server" ErrorMessage="*" ForeColor="Red" Text="Select Status" InitialValue="0"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <asp:Label ID="lblPriority" CssClass="control-label col-sm-2" runat="server" Text="Name"><b>Priority :</b><span style="color:red">*</span></asp:Label>
                                    <div class="col-sm-5">
                                        <asp:DropDownList ID="ddlPriority" CssClass="form-control" runat="server">
                                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Low" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Medium" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="High" Value="3"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <asp:RequiredFieldValidator ID="rfvPriority" ControlToValidate="ddlPriority" runat="server" ErrorMessage="*" ForeColor="Red" Text="Select Priority" InitialValue="0"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <asp:Label ID="lblAssignToEmployee" CssClass="control-label col-sm-2" runat="server" Text="AssignToEmployee"><b>Assign To Employee :</b><span style="color:red">*</span></asp:Label>
                                    <div class="col-sm-5">
                                        <asp:DropDownList ID="ddlAssignToEmployee" CssClass="form-control" runat="server">
                                            <asp:ListItem Text="--Select--"></asp:ListItem>
                                            <%--<asp:ListItem Text="-11-"></asp:ListItem>
                                            <asp:ListItem Text="-21-"></asp:ListItem>--%>
                                        </asp:DropDownList>
                                        <%--<asp:TextBox ID="txtATOEmployee" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>--%>
                                    </div>
                                    <asp:RequiredFieldValidator ID="rfvAssignToEmployee" ControlToValidate="ddlAssignToEmployee" runat="server" ErrorMessage="*" ForeColor="Red" Text="Select Assign To Employee" InitialValue="--Select--"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                           <%-- <div class="form-group row">
                                <div class="col-md-12">
                                    <asp:Label ID="lblNote" CssClass="control-label col-sm-2" runat="server" Text="Note"><b>Note :</b><span style="color:red">*</span></asp:Label>
                                    <div class="col-sm-5">
                                        <asp:TextBox ID="txtNote" CssClass="form-control" runat="server" TextMode="MultiLine" Height="100"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="rfvNote" ControlToValidate="txtNote" runat="server" ErrorMessage="*" ForeColor="Red" Text="Note is Required" ></asp:RequiredFieldValidator>
                                </div>
                            </div>--%>
                            <div style="text-align: right">
                                <asp:Button ID="btnSave" CssClass="btn btn-success" runat="server" Text="Save" Style="width: 90px" OnClick="btnSave_Click" />                                
                                <asp:Button ID="btnReset" CssClass="btn btn-danger" runat="server" Text="Reset" Style="width: 90px" OnClick="btnReset_Click" CausesValidation="false" />
                                <asp:Button ID="btnBack" CssClass="btn btn-danger" PostBackUrl="IssuesList.aspx" runat="server" Text="Back" Style="width: 90px" CausesValidation="false" />
                                <asp:HiddenField ID="hdnIssuesId" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
</asp:Content>
