<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="PrepareAReceiptsView.aspx.cs" Inherits="MFBDBO.Master.PrepareAReceiptsView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
 
        <section class="content-header">
            <h1>Receipts View</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">Accounts</li>
                <li class="#"> Receipts List</li>
                <li class="active">Receipts View</li>
            </ol>
        </section>
        <section class="content">
            <div class="box">
                <!-- /.box-header -->
                <div class="box-body">
                        <!--1st row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblVoucherNo" class="control-label col-sm-4" runat="server" Text="Voucher No "><b>Voucher No :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblVNo" class="control-label " runat="server" Text="12334">
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblReceiveDate" class="control-label col-sm-4" runat="server" Text="Received Date"><b>Received Date :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                           <asp:Label ID="lblRDate" class="control-label" runat="server" Text="Received Date">Received Date</asp:Label>
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
                        <!--2nd row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblReceivedThrough" class="control-label col-sm-4" runat="server" Text="Recieved Through"><b>Received Through :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblReceivedThro" class="control-label" runat="server" Text="Cash"></asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblFromAccount" class="control-label col-sm-4" runat="server" Text="From Account"><b>From Account :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                              <asp:Label ID="lblFromAcc" class="control-label" runat="server" Text="Customer"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>                    
                        <!--3rd row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblToAccount" class="control-label col-sm-4" runat="server" Text="To Account"><b>To Account :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblToAcct" class="control-label" runat="server" Text="Axis Bank"></asp:Label>
                                </div>
                            </div>
                           <div class="col-md-6">
                                <asp:Label ID="lblCurrentBalance" class="control-label col-sm-4" runat="server" Text="Current Balance"><b>Current Balance :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                             <asp:Label ID="lblCBalance" class="control-label " runat="server" Text="0.00"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                       <!----->
                    <div class="form-group row">
                         <div class="col-md-6">
                                <asp:Label ID="lblReceivingAmount" class="control-label col-sm-4" runat="server" Text="Receiving Amount"><b>Receiving Amount :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                             <asp:Label ID="lblReceivingAmt" class="control-label " runat="server" Text="0.00"></asp:Label>
                                </div>
                            </div>
                        <%-- <div class="col-md-6">
                                <asp:Label ID="lblABalance" class="control-label col-sm-4" runat="server" Text="Available Balance"><b>Available Balance :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                             <asp:Label ID="lblABal" class="control-label" runat="server" Text="0.00"></asp:Label>
                                </div>
                            </div>--%>
                    </div>
                      <div class="clearfix"></div>
                        <!--5th row-->
                        <div class="form-group row" id="divPM" runat="server">
                            <div class="col-md-6">
                                <asp:Label ID="lblPaymentMode" class="control-label col-sm-4" runat="server" Text="Cheque"><b>Payment Mode :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblPaytMode" class="control-label " runat="server" Text="DD">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <!--6th row-->
                        <div class="form-group row" id="divCheque" runat="server">
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
                        </div>
                        <!--7th row-->
                        <div class="form-group row" id="divDD" runat="server">
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
                        </div>
                        <!--8th row-->
                        <div class="form-group row" id="divBank" runat="server">
                            <div class="col-md-6">
                          <asp:Label ID="lblAccountNo" class="control-label col-sm-4" runat="server" Text="Account No"><b>Account No :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblAcuntNo" class="control-label" runat="server" Text="1243436587">
                                    </asp:Label>
                                </div>
                            </div>
                             <div class="col-md-6">
                                <asp:Label ID="lblBankName" class="control-label col-sm-4" runat="server" Text="Bank Name"><b>Bank Name :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblBName" class="control-label" runat="server" Text="Axis Bank">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                    <!--9th Row-->
                        <div class="form-group row" id="divCard" runat="server">
                            <div class="col-md-6">
                                <asp:Label ID="lblCardNo" class="control-label col-sm-4" runat="server" Text="Card No"><b>Card No :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblCardNumber" class="control-label" runat="server" Text="134256">
                                    </asp:Label>
                                </div>
                            </div>
                            </div>
                       <div class="form-group row" id="divTD" runat="server">
                            <div class="col-md-6">
                                <asp:Label ID="lblTransactionDate" class="control-label col-sm-4" runat="server" Text="Transaction Date"><b>Transaction Date :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblTDate" class="control-label" runat="server" Text="20-06-2018">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                     <div class="form-group row" id="divRN" runat="server">
                            <div class="col-md-6">
                                <asp:Label ID="lblReferenceNo" class="control-label col-sm-4" runat="server" Text="Reference No"><b>Reference No :</b>
                                </asp:Label>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblRefrnceNo" class="control-label" runat="server" Text="1324326">
                                    </asp:Label>
                                </div>
                            </div>
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
                                <div class="col-sm-6">
                             <asp:Label ID="lblFN" class="control-label" runat="server" Text="File Name"></asp:Label>
                                         </div>
                                <div class="col-md-2">
                                        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                                    </div>
                            </div>
                        </div>
                  
                    <!--Buttons--->
                    <div class="footer-bottom" style="text-align: right">
                        <asp:Button ID="btnBack" class="btn btn-danger" PostBackUrl="ReceiptsList.aspx" runat="server" Text="Back" Style="width: 90px" />
                        <asp:HiddenField ID="hdnReceiptID" runat="server" />
                    </div>
                </div>
            </div>
        </section>


    
</asp:Content>
