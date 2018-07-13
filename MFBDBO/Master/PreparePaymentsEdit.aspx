<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="PreparePaymentsEdit.aspx.cs" Inherits="MFBDBO.Master.PreparePaymentsEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .hidden-bound {
            display: none;
        }
    </style>
    <script type="text/javascript">
        function alertMessage(text) {
            alert(text);
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
    
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <section class="content-header">
            <h1>Prepare Payment Edit
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li><a href="#">Voucher</a></li>
                <li class="active">Prepare Payment Edit</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="box">
                    <!-- /.box-header -->
                    <div class="box-header">
                        <asp:Label ID="lblIFR" class="control-label col-sm-12" runat="server" Text="">
                              <span style="color: red; font-weight:600">Indicates fields are required : *</span></asp:Label>

                    </div>
                    <div class="box-body">
                        <!--1st row-->
                        <div class="form-group row">
                            <%--  <div class="col-md-6">
                                <asp:Label ID="lblPaymentType" class="control-label col-sm-4" runat="server" Text="Payment Type"><b>Payment Type :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="ddlPaymentType" CssClass="form-control" runat="server" AutoPostBack="True" >
                                        <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Against Purchase" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Advance Payment" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Other Payment" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>--%>
                            <div class="col-md-6">
                                <asp:Label ID="lblVoucherNo" class="control-label col-sm-4" runat="server" Text="Voucher No"><b>Voucher No :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtVoucherNumber" class="form-control" placeholder="VoucherNumber" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblPaymentDate" class="control-label col-sm-4" runat="server" Text="Payment Date"><b>Payment Date :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <ajaxToolkit:CalendarExtender ID="txtCheckInDate_CalendarExtender" runat="server" BehaviorID="txtCheckInDate_CalendarExtender" TargetControlID="txtPaymentDate" />
                                    <asp:TextBox ID="txtPaymentDate" class="form-control" runat="server"></asp:TextBox>
                                    <%--<asp:label id="designation" text="<#databinder.Eval(Container.dataitem,"designation" ) %>" runat="server" xmlns:asp="#unknown">;--%>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblMajorAccount" class="control-label col-md-4" runat="server" Text="Major Account"><b> Major Account :</b> <span style="color: red;">*</span>
                                </asp:Label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlMAccountList" CssClass="form-control" runat="server" AutoPostBack="True">
                                        <%--<asp:ListItem Text="--Select--" Value="0"></asp:ListItem>--%>
                                        <%--<asp:ListItem Text="" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="" Value="2"></asp:ListItem>--%>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblMinorAccount" class="control-label col-md-4" runat="server" Text="Minor Account"><b> Minor Account :</b> <span style="color: red;">*</span>
                                </asp:Label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlMinorAccountList" CssClass="form-control" runat="server" AutoPostBack="True">
                                        <%--<asp:ListItem Text="--Select--" Value="0"></asp:ListItem>--%>
                                        <%--<asp:ListItem Text="" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="" Value="2"></asp:ListItem>--%>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <!--3rd row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblPaymentThrough" class="control-label col-sm-4" runat="server" Text="Payment Mode"><b>Payment Through :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="ddlPaymentThrough" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlPaymentThrough_SelectedIndexChanged">
                                        <asp:ListItem Text="-Select-" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Cash" Value="1"> </asp:ListItem>
                                        <asp:ListItem Text="Bank" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblFromAccount" class="control-label col-sm-4" runat="server" Text="Account"><b>From Account :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="ddlFromAccount" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                            </div>

                        </div>
                        <!--4th row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblToAccount" class="control-label col-sm-4" runat="server" Text="To Account"><b>To Account  :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="ddlToAccount" runat="server" CssClass="form-control" AutoPostBack="True">
                                        <%--<asp:ListItem Text="-Select-" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Pavan" Value="1"> </asp:ListItem>
                                        <asp:ListItem Text="Ram" Value="2"></asp:ListItem>--%>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblCurrentBalance" class="control-label col-sm-4" runat="server" Text="Current Balance "><b>Current Balance  :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtCurrentBal" class="form-control" disabled runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!--Row--->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblPayingAmount" class="control-label col-sm-4" runat="server" Text="Paying Amount "><b>Paying Amount  :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtPayingAmount" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <%--<div class="col-md-6">
                                <asp:Label ID="lblABalance" class="control-label col-sm-4" runat="server" Text="Available Balance"><b>Available Balance  :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtABalance" class="form-control" disabled runat="server"></asp:TextBox>
                                </div>
                            </div>--%>
                        </div>


                        <div class="form-group row" id="divPM" runat="server">
                            <div class="col-md-6">
                                <asp:Label ID="lblPaymentMode" class="control-label col-sm-4" runat="server" Text="Payment Mode"><b>Payment Mode :</b>
                                    <span style="color: red;"></span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="ddlPaymentMode" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlPaymentMode_SelectedIndexChanged">
                                        <asp:ListItem Text="-Select-" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Cheque" Value="1"> </asp:ListItem>
                                        <asp:ListItem Text="DD" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Credit/Debit Card" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Internet Banking" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="divCheque" runat="server">
                            <div class="col-md-6">
                                <asp:Label ID="lblChequeNo" class="control-label col-sm-4" runat="server" Text="Cheque No"><b>Cheque No : </b>
                                    <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtChequeNo" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblChequeDate" class="control-label col-sm-4" runat="server" Text="Cheque Date"><b>Cheque Date : </b>
                                    <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" BehaviorID="txtCheckInDate_CalendarExtender" TargetControlID="txtChequeDate" />
                                    <asp:TextBox ID="txtChequeDate" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row" id="divDD" runat="server">
                            <div class="col-md-6">
                                <asp:Label ID="lblDDNo" class="control-label col-sm-4" runat="server" Text="DD No"><b>DD No : </b>
                                    <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtDDNo" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblDDDate" class="control-label col-sm-4" runat="server" Text="DD Date"><b>DD Date : </b>
                                    <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" BehaviorID="txtCheckInDate_CalendarExtender" TargetControlID="txtDDDate" />
                                    <asp:TextBox ID="txtDDDate" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row" id="divBank" runat="server">
                            <div class="col-md-6">
                                <asp:Label ID="lblAcNO" class="control-label col-sm-4" runat="server" Text="Account No"><b>Account No :</b>
                                    <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtAcNo" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblBankName" class="control-label col-sm-4" runat="server" Text="Bank Name"><b>Bank Name :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtBankName" CssClass="form-control" placeholder="Enter Bank Name" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row" id="divCard" runat="server">
                            <div class="col-md-6">
                                <asp:Label ID="lblCardNo" class="control-label col-sm-4" runat="server" Text="Card No"><b>Card No : </b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtCardNo" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="divTD" runat="server">
                            <div class="col-md-6">
                                <asp:Label ID="lblTransactionDate" class="control-label col-sm-4" runat="server" Text="Transaction Date"><b>Transaction Date : </b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" BehaviorID="txtCheckInDate_CalendarExtender" TargetControlID="txtTransactionDate" />
                                    <asp:TextBox ID="txtTransactionDate" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="divRN" runat="server">
                            <div class="col-md-6">
                                <asp:Label ID="lblReferenceNo" class="control-label col-sm-4" runat="server" Text="Reference No"><b>Reference No : </b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtReferenceNo" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!--Narration-->
                        <div class="form-group row">
                            <div class="col-md-12">
                                <asp:Label ID="lblNarration" class="control-label col-sm-2" runat="server" Text="Narration"><b>Narration : </b><span style="color: red">*</span>
                                </asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtNarration" runat="server" placeholder="Enter Narration" class="form-control" TextMode="MultiLine" Height="100"></asp:TextBox>
                                </div>
                            </div>
                        </div>

              <!--Choose File--->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblAFiles" class="control-label col-sm-4" runat="server" Text="Attach Files"><b>Attach Files :</b></asp:Label>
                                <div class="col-sm-6">
                                    <asp:Label ID="lblChooseF" class="control-label" runat="server" Text=" Choose File"></asp:Label>
                                </div>
                                <div class="col-sm-2">
                                    <div class="btn btn-success btn-file">
                                        <i class="fa fa-paperclip"></i> Choose File
                                     <asp:FileUpload ID="BrowseFile" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                   <!--Button-->
                        <div style="text-align: right">
                            <asp:Button ID="btnUpdate" CssClass="btn btn-primary" runat="server" Text="Update" Style="width: 100px;" OnClick="BtnUpdate_Click" />
                            <asp:Button ID="btnBack" class="btn btn-danger" runat="server" PostBackUrl="PaymentsList.aspx" Text="Back" Style="width: 100px;" />
                            <asp:HiddenField ID="hdnPaymentsID" runat="server" />
                        </div>

                    </div>
                </div>
            </div>
        </section>
    
</asp:Content>
