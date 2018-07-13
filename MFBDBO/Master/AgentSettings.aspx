<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="AgentSettings.aspx.cs" Inherits="MFBDBO.Master.AgentSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .select2 {
            height: 22px;
        }
    </style>

    <script type="text/javascript">

        function alertMessage(text) {
            alert(text);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    
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
                    <div class="col-xs-12">s
                        <div class="box-body">
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <asp:Label ID="lblName" class="control-label col-sm-2" runat="server" Text="Name"><b>Agency :</b></asp:Label>
                                    <div class="col-sm-5">
                                        <asp:DropDownList ID="DDLAgency" CssClass="form-control select2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDLAgency_SelectedIndexChanged">
                                            <asp:ListItem>All</asp:ListItem>
                                            <%--<asp:ListItem>Kaveri Travels</asp:ListItem>
                                            <asp:ListItem>Siri Travels</asp:ListItem>--%>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvEmp" runat="server" ErrorMessage="Select Agency Name" ForeColor="Red" ControlToValidate="DDLAgency" InitialValue="All" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <asp:Label ID="lblName2" class="control-label col-sm-2" runat="server" Text="Name"><b>Paynow :</b></asp:Label>
                                    <div class="col-sm-5">
                                        <asp:DropDownList ID="DDLPaynow" CssClass="form-control select2" runat="server">
                                            <asp:ListItem Text="--select--" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvPaynow" runat="server" ErrorMessage="Select Paynow Status" ForeColor="Red" ControlToValidate="DDLPaynow" InitialValue="--select--" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <asp:Label ID="lblName3" class="control-label col-sm-2" runat="server" Text="Name"><b>Confirm Booking :</b></asp:Label>
                                    <div class="col-sm-5">
                                        <asp:DropDownList ID="DDLCBooking" CssClass="form-control select2" runat="server">
                                            <asp:ListItem Text="--select--" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvCBooking" runat="server" ErrorMessage="Select Confirm Booking" ForeColor="Red" ControlToValidate="DDLCBooking" InitialValue="--select--" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <asp:Label ID="Label1" class="control-label col-sm-2" runat="server" Text="Name"><b>Offline Request :</b></asp:Label>
                                    <div class="col-sm-5">
                                        <asp:DropDownList ID="DDLORequest" CssClass="form-control select2" runat="server">
                                            <asp:ListItem Text="--select--" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvOR" runat="server" ErrorMessage="Select Offline Request" ForeColor="Red" ControlToValidate="DDLCBooking" InitialValue="--select--" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div style="text-align: right">
                                  <asp:Button ID="btnSave" class="btn btn-success" runat="server" Text="Save" Style="width: 90px" OnClick="btnSave_Click"  />
                                <asp:Button ID="btnUpdate" class="btn btn-success" runat="server" Text="Update" Style="width: 90px" OnClick="btnUpdate_Click" />
                                <asp:Button ID="btnReset" class="btn btn-danger" runat="server" Text="Reset" Style="width: 90px" CausesValidation="False" OnClick="btnReset_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    

</asp:Content>
