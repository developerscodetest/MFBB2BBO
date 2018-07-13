<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="PreparePaymentsView.aspx.cs" Inherits="MFBDBO.Master.PreparePaymentsListView" %>

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
    
        <section class="content-header">
            <h1>Payments View</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">Prepare Payments</li>
                <li class="active">Payments View</li>
            </ol>
        </section>
        <section class="content">
            <div class="box">
                <!-- /.box-header -->
                <div class="box-body">
                        <!--1st row-->
                        <div class="form-group row">
                            <asp:HiddenField ID="hdnPaymentsID" runat="server" />
                           <%-- <div class="col-md-6">
                                <asp:Label ID="lblPaymentType" class="control-label col-sm-4" runat="server" Text="Payment Type "><b>Payment Type :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblAgainstPurchase" class="control-label " runat="server" Text="Against Purchase">Against Purchase
                                    </asp:Label>
                                </div>
                            </div>--%>
                            <div class="col-md-6">
                                <asp:Label ID="lblVoucherNo" class="control-label col-sm-4" runat="server" Text="Voucher No "><b>Voucher No :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblVNo" class="control-label " runat="server" Text="12334">
                                    </asp:Label>
                                </div>
                            </div>
                              <div class="col-md-6">
                                <asp:Label ID="lblPaymentDate" class="control-label col-sm-4" runat="server" Text="Payment Date"><b>Payment Date :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblPDate" class="control-label " runat="server" Text="20-06-2018">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <!--Middle-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblMajorAccount" class="control-label col-sm-4" runat="server" Text="Major Account"><b>Major Account :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                              <asp:Label ID="lblMaAcc" class="control-label" runat="server" Text="Account"></asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblMinorAccount" class="control-label col-sm-4" runat="server" Text="Minor Account"><b>Minor Account :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblMiAcc" class="control-label" runat="server" Text="Account"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <!--3rd row-->
                        <div class="form-group row">
                             <div class="col-md-6">
                                <asp:Label ID="lblPaymentThrough" class="control-label col-sm-4" runat="server" Text="Payment Mode"><b>Payment Through :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblPayThrough" class="control-label " runat="server" Text="Cash">
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblFromAccount" class="control-label col-sm-4" runat="server" Text="Account"><b>From Account :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblFAccount" class="control-label " runat="server" Text="21436586">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <!--4th row-->
                        <div class="form-group row">
                             <div class="col-md-6">
                                <asp:Label ID="lblToAccount" class="control-label col-sm-4" runat="server" Text="Pay To"><b>To Account :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblTAccount" class="control-label " runat="server" Text="Karthik">
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblCurrentBalance" class="control-label col-sm-4" runat="server" Text="Current Balance"><b>Current Balance :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblCurrentBal" class="control-label " runat="server" Text="">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                       <div class="clearfix"></div>
                      <!--Row--->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblPayingAmount" class="control-label col-sm-4" runat="server" Text="Paying Amount"><b>Paying Amount :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblPayingAmt" class="control-label " runat="server" Text="">
                                    </asp:Label>
                                </div>
                            </div>
                             <%--<div class="col-md-6">
                                <asp:Label ID="lblABalance" class="control-label col-sm-4" runat="server" Text="Available Balance"><b>Available Balance :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblABal" class="control-label" runat="server" Text="">
                                    </asp:Label>
                                </div>
                            </div>--%>
                        </div>
                     
                        <!--5th row-->
                    <div class="form-group row" id="divPM" runat="server">
                        <%--<div class="form-group row"></div>--%>
                            <div class="col-md-6">
                                <asp:Label ID="lblPaymentMode" class="control-label col-sm-4" runat="server" Text="PaymentMode"><b>Payment Mode :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblPaymMode" class="control-label " runat="server" Text="">
                                    </asp:Label>
                                </div>
                            </div>
                        <%--</div>--%>
                        </div>
                        <!--6th row-->
                    <div class="form-group row" id="divCheque" runat="server">
                        <%--<div class="form-group row">--%>
                            <div class="col-md-6">
                                <asp:Label ID="lblChequeNo" class="control-label col-sm-4" runat="server" Text="Cheque No"><b>Cheque No :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblCNo" class="control-label " runat="server" Text="134256">
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblChequeDate" class="control-label col-sm-4" runat="server" Text="Cheque Date"><b>Cheque Date :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblCDate" class="control-label " runat="server" Text="20-06-2018">
                                    </asp:Label>
                                </div>
                            </div>
                        <%--</div>--%>
                        </div>
                        <!--7th row-->
                    <div class="form-group row" id="divDD" runat="server">
                        <%--<div class="form-group row">--%>
                            <div class="col-md-6">
                                <asp:Label ID="lblDDNo" class="control-label col-sm-4" runat="server" Text="DD No"><b>DD No :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblDDN" class="control-label " runat="server" Text="134256">
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblDDDate" class="control-label col-sm-4" runat="server" Text="DD Date"><b>DD Date :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblDDD" class="control-label " runat="server" Text="20-06-2018">
                                    </asp:Label>
                                </div>
                            </div>
                        <%--</div>--%>
                        </div>
                        <!--8th row-->
                    <div class="form-group row" id="divBank" runat="server">
                        <%--<div class="form-group row">--%>
                            <div class="col-md-6">
                                <asp:Label ID="lblAcnt" class="control-label col-sm-4" runat="server" Text="Account"><b>Account :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblAcunt" class="control-label " runat="server" Text="">
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblBankName" class="control-label col-sm-4" runat="server" Text="Bank Name"><b>Bank Name :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblBName" class="control-label " runat="server" Text="Axis Bank">
                                    </asp:Label>
                                </div>
                            </div>
                        <%--</div>--%>
                        </div>
                        <!--9th row-->
                    <div class="form-group row" id="divCard" runat="server">
                        <%--<div class="form-group row">--%>
                            <div class="col-md-6">
                                <asp:Label ID="lblCardNo" class="control-label col-sm-4" runat="server" Text="Card No"><b>Card No :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblCrdN" class="control-label " runat="server" Text="134256">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <!--10th row-->
                        <div class="form-group row" id="divTD" runat="server">
                        <%--<div class="form-group row">--%>
                            <div class="col-md-6">
                                <asp:Label ID="lblTDate" class="control-label col-sm-4" runat="server" Text="Transaction Date"><b>Transaction Date :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblTD" class="control-label" runat="server" Text="20-06-2018">
                                    </asp:Label>
                                </div>
                            </div>
                        <%--</div>--%>
                            </div>
                        <!--11th row-->
                        <div class="form-group row" id="divRN" runat="server">
                        <%--<div class="form-group row">--%>
                            <div class="col-md-6">
                                <asp:Label ID="lblRNo" class="control-label col-sm-4" runat="server" Text="Reference No"><b>Reference No :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblRefNo" class="control-label " runat="server" Text="134256"></asp:Label>
                                </div>
                            </div>
                        <%--</div>--%>
                            </div>
                   <!--Narration--->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblNarration" class="control-label col-sm-4" runat="server" Text="Narration"><b>Narration :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblNrtn" class="control-label " runat="server" Text="text">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                      
                      <!--Attach Files--->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblAFiles" class="control-label col-sm-4" runat="server" Text="Attach Files"><b>Attach Files :</b>
                                </asp:Label>
                                <div class="col-sm-5">
                                    <asp:Label ID="lblFN" class="control-label" runat="server" Text="File Name"></asp:Label>
                                    </div>
                                <div class="col-md-3">
                                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                                </div>
                                </div>
                            </div>
                    <!--Buttons--->
                    <div style="text-align: right">
                        <asp:Button ID="btnBack" class="btn btn-danger" PostBackUrl="PaymentsList.aspx" runat="server" Text="Back" Style="width: 90px" />
                        <asp:HiddenField ID="hdnPaymentID" runat="server" />
                    </div>
                </div>
            </div>
        </section>


    
</asp:Content>
