<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="ReceiptsEdit.aspx.cs" Inherits="MFBDBO.Master.ReceiptsEdit" %>

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
            <h1>Receipts Edit</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">Accounts</li>
                <li class="#">Receipts List</li>
                <li class="active">Receipts Edit</li>
            </ol>
        </section>
        <section class="content">
            <div class="box">
                <!-- /.box-header -->
                <div class="box-body">
                    <!--1st row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblVoucherNo" class="control-label col-sm-4" runat="server" Text="Voucher No"><b>Voucher No :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtVNo" CssClass="form-control" placeholder="Enter Voucher No" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblRDate" class="control-label col-sm-4" runat="server" Text="Received Date"><b>Received Date :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <div class="input-group date">
                                    <ajaxToolkit:CalendarExtender ID="txtCheckInDate_CalendarExtender" runat="server" BehaviorID="txtCheckInDate_CalendarExtender" TargetControlID="txtRDate" />
                                    <asp:TextBox ID="txtRDate" CssClass="form-control" runat="server"></asp:TextBox>
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <!--middile--->
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
                    <!--2nd row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblReceivedThrough" class="control-label col-sm-4" runat="server" Text="Received Through"><b>Received Through :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddlReceivedThrough" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlReceivedThrough_SelectedIndexChanged">
                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Cash" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Bank" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblFromAccount" class="control-label col-sm-4" runat="server" Text=" From Account"><b>From Account :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddlFromAccount" CssClass="form-control" runat="server" AutoPostBack="True">
                                    <%--<asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Roi" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Hoi" Value="2"></asp:ListItem>--%>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <!--3rd row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblToAccount" class="control-label col-sm-4" runat="server" Text="Receipt Mode"><b>To Account :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddlToAccount" CssClass="form-control" runat="server">
                                    <%--<asp:ListItem Text="--Select--" Value="0"></asp:ListItem>  
                                        <asp:ListItem Text="Cash in hand" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Axis Bank" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="HDFC Bank" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="SBI Bank" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="ICICI Bank" Value="5"></asp:ListItem>--%>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblCurrentBalance" class="control-label col-sm-4" runat="server" Text="Current Balance"><b>Current Balance :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtCB" CssClass="form-control" disabled runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <!--row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblReceivingAmount" class="control-label col-sm-4" runat="server" Text="Receiving Amount"><b>Receiving Amount :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtReceivingAmount" CssClass="form-control" placeholder="Enter Current Balance" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <%--<div class="col-md-6">
                            <asp:Label ID="lblABalance" class="control-label col-sm-4" runat="server" Text="Available Balance"><b>Available Balance  :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtABalance" CssClass="form-control" disabled runat="server"></asp:TextBox>
                            </div>
                        </div>--%>
                    </div>
                    <div class="clearfix"></div>

                    <!--5th row-->
                    <div class="form-group row" id="divPM" runat="server">
                        <div class="col-md-6">
                            <asp:Label ID="lblPaymentMode" class="control-label col-sm-4" runat="server" Text="Cheque"><b>Payment Mode</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddlPaymentMode" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPaymentMode_SelectedIndexChanged">
                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Cheque" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="DD" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Credit / Debit No" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="Internet Banking" Value="4"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <!--6th row-->
                    <div class="form-group row" id="divCheque" runat="server">
                        <div class="col-md-6">
                            <asp:Label ID="lblChequeNo" class="control-label col-sm-4" runat="server" Text="Cheque No"><b>Cheque No :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtCheckNo" CssClass="form-control" placeholder="Enter Cheque No" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblChequeDate" class="control-label col-sm-4" runat="server" Text="Cheque Date"><b>Cheque Date :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" BehaviorID="txtCheckInDate_CalendarExtender" TargetControlID="txtChequeDate" />
                                <%--<ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" Format="dd-MM-yyyy" TargetControlID="CreatedOnTextBox">
                    </ajaxToolkit:CalendarExtender>--%>
                                <asp:TextBox ID="txtChequeDate" CssClass="form-control" placeholder="Enter Cheque Date" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <!--7th row-->
                    <div class="form-group row" id="divDD" runat="server">
                        <div class="col-md-6">
                            <asp:Label ID="lblDDNo" class="control-label col-sm-4" runat="server" Text="DD No"><b>DD No :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtDDNo" CssClass="form-control" placeholder="Enter DD No" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblDDDate" class="control-label col-sm-4" runat="server" Text="DD Date"><b>DD Date :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" BehaviorID="txtCheckInDate_CalendarExtender" TargetControlID="txtDDDate" />
                                <asp:TextBox ID="txtDDDate" CssClass="form-control" placeholder="Enter DD Date" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <!--8th row-->
                    <div class="form-group row" id="divBank" runat="server">
                        <div class="col-md-6">
                            <asp:Label ID="lblAccountNo" class="control-label col-sm-4" runat="server" Text="Account No"><b>Account No :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtAcNo" CssClass="form-control" placeholder="Enter Account No" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblBankName" class="control-label col-sm-4" runat="server" Text="Bank Name"><b>Bank Name :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtBankName" CssClass="form-control" placeholder="Enter Bank Name" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <!--9th row--->
                    <div class="form-group row"  id="divCard" runat="server">
                        <div class="col-md-6">
                            <asp:Label ID="lblCardNo" class="control-label col-sm-4" runat="server" Text="Card No"><b>Card No :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtCardNo" CssClass="form-control" placeholder="Enter Card No" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <!--10th Row-->
                    <div class="form-group row" id="divTD" runat="server">
                        <div class="col-md-6">
                            <asp:Label ID="lblTransactionDate" class="control-label col-sm-4" runat="server" Text="Transaction Date"><b>Transaction Date :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <div class="input-group date">
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" BehaviorID="txtCheckInDate_CalendarExtender" TargetControlID="txtTDate" />
                                    <asp:TextBox ID="txtTDate" CssClass="form-control" runat="server"></asp:TextBox>
                                    <%--<div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--11th row--->
                    <div class="form-group row" id="divRN" runat="server">
                        <div class="col-md-6">
                            <asp:Label ID="lblReferenceNo" class="control-label col-sm-4" runat="server" Text="Reference No"><b>Reference No :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtReferenceNo" CssClass="form-control" placeholder="Enter Reference No" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <!--Narration--->
                    <div class="form-group row">
                        <div class="col-md-12">
                            <asp:Label ID="lblNarration" class="control-label col-sm-2" runat="server" Text="Narration"><b>Narration :</b>
                            </asp:Label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtNrtn" CssClass="form-control" placeholder="Enter Narration" TextMode="MultiLine" Height="100" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <!--Attach Files--->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblAFiles" class="control-label col-sm-4" runat="server" Text="Attach Files"><b>Attach Files :</b>
                            </asp:Label>
                            <div class="col-sm-6">
                                <asp:Label ID="lblChooseF" class="control-label" runat="server" Text=" Choose File"></asp:Label>
                            </div>
                            <div class="col-md-2">
                                <div class="btn btn-success btn-file">
                                    <i class="fa fa-paperclip"></i> Choose File
                            <asp:FileUpload ID="UploadDoc" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--Buttons--->
                    <div class="footer-bottom pull-right">
                        <asp:Button ID="btnUpdate" CssClass="btn btn-primary" runat="server" Text="Update" Style="width: 100px;" OnClick="BtnUpdate_Click" />
                        <asp:Button ID="btnBack" class="btn btn-danger" PostBackUrl="ReceiptsList.aspx" runat="server" Text="Back" Style="width: 90px" />
                        <asp:HiddenField ID="hdnReceiptID" runat="server" />
                    </div>
                </div>
            </div>
        </section>


    
</asp:Content>
