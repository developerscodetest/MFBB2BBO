<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="AssignTargets.aspx.cs" Inherits="MFBDBO.Master.MonthlyTargetsList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    <section class="content-header">
        <h1>Assign Targets
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
              <li class="#">Sales</li>
            <li class="active">Assign Targets</li>
        </ol>
    </section>
    <section class="content">
        <div class="box">
            <div class=" box-body">
                <div class="form-group row">
                    <div class="col-md-4">
                   <asp:Label ID="lblYear" class="control-label col-sm-4" runat="server" Text="Year"><b>Year :</b> <span style="color: red;">*</span></asp:Label>
                        <div class="col-sm-8">
                            <asp:DropDownList ID="DDLYear" CssClass="form-control" runat="server">
                                                <asp:ListItem>--Select--</asp:ListItem>
                                                <asp:ListItem>2016</asp:ListItem>
                                                <asp:ListItem>2017</asp:ListItem>
                                            <asp:ListItem>2017</asp:ListItem>
                                            <asp:ListItem>2018</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvYear" runat="server" ErrorMessage="Select Year" ForeColor="Red" ControlToValidate="DDLYear" InitialValue="--Select--" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="col-md-4">
                   <asp:Label ID="lblMonth" class="control-label col-sm-4" runat="server" Text="Month"><b>Month :</b> <span style="color: red;">*</span></asp:Label>
                        <div class="col-sm-8">
                            <asp:DropDownList ID="DDLMonth" CssClass="form-control" runat="server">
                                                <asp:ListItem>--Select--</asp:ListItem>
                                                <asp:ListItem>Jan</asp:ListItem>
                                                <asp:ListItem>Feb</asp:ListItem>
                                            <asp:ListItem>March</asp:ListItem>
                                            <asp:ListItem>April</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvMonth" runat="server" ErrorMessage="Select Month" ForeColor="Red" ControlToValidate="DDLMonth" InitialValue="--Select--" Display="Dynamic"></asp:RequiredFieldValidator>                           
                        </div>
                    </div>
                    <div class="col-md-4">
                          <asp:Label ID="lblMT" class="control-label col-sm-4" runat="server" Text="Manager Target"><b> Target :</b> <span style="color: red;">*</span></asp:Label>                        
                   
                    <div class="col-sm-8">
                         <asp:TextBox ID="txtTAmount" class="form-control" placeholder="Enter Amount" runat="server"></asp:TextBox> 
                        <asp:RequiredFieldValidator ID="rfvTAmount" runat="server" ErrorMessage="Enter Target Amount" ForeColor="Red" ControlToValidate="txtTAmount" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revTAmount" runat="server" ErrorMessage="Enter Amount in Numeric" ForeColor="Red" ControlToValidate="txtTAmount" ValidationExpression="^[0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>           
                    </div>
                         </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="box-header with-border">
                        <h3 class="box-title"><b>Assign Targets</b></h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group row">
                            <div class="col-md-12">
              <asp:Label ID="lblName" class="control-label col-sm-2" runat="server" Text="Name"><b>Anil :</b></asp:Label>
                                <div class="col-sm-5">
             <asp:TextBox ID="txtamount" class="form-control" placeholder="Enter Amount" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvAmount" runat="server" ErrorMessage="Amount is Required" ForeColor="Red" ControlToValidate="txtamount" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revAmount" runat="server" ErrorMessage="Enter Amount is required" ForeColor="Red" ControlToValidate="txtamount" ValidationExpression="^[0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                                 <asp:Label ID="lblName2" class="control-label col-sm-2" runat="server" Text="Name"><b>Ramesh :</b></asp:Label>
                                <div class="col-sm-5">
                             <asp:TextBox ID="txtamount1" class="form-control" placeholder="Enter Amount"  runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvAmount1" runat="server" ErrorMessage="Amount is Required" ForeColor="Red" ControlToValidate="txtamount1" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revAmount1" runat="server" ErrorMessage="Enter Amount is Required" ForeColor="Red" ControlToValidate="txtamount1" ValidationExpression="^[0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                              <asp:Label ID="lblName3" class="control-label col-sm-2" runat="server" Text="Name"><b>Ganesh :</b></asp:Label>
                                <div class="col-sm-5">
                            <asp:TextBox ID="txtamount2" class="form-control" placeholder="Enter Amount"  runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvAmount2" runat="server" ErrorMessage="Amount is Required" ForeColor="Red" ControlToValidate="txtamount2" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revAmount2" runat="server" ErrorMessage="Enter Amount in Numeric" ForeColor="Red" ControlToValidate="txtamount2" ValidationExpression="^[0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                              <asp:Label ID="Label1" class="control-label col-sm-2" runat="server" Text="Name"><b>Anandh :</b></asp:Label>
                                <div class="col-sm-5">
                                <asp:TextBox ID="txtamount3" class="form-control" placeholder="Enter Amount"  runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvAmount3" runat="server" ErrorMessage="Amount is Required" ForeColor="Red" ControlToValidate="txtamount3" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revAmount3" runat="server" ErrorMessage="Enter Amount in Numeric" ForeColor="Red" ControlToValidate="txtamount3" ValidationExpression="^[0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div style="text-align: right">
                         <asp:Button ID="btnSave" class="btn btn-success"  runat="server" Text="Save" style="width: 90px" />
                          <asp:Button ID="btnReset" class="btn btn-danger"  runat="server" Text="Reset" style="width: 90px" CausesValidation="False" />
                                             
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
