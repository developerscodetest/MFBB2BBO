<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="Receipts.aspx.cs" Inherits="MFBDBO.Master.Receipts" EnableEventValidation="false" %>

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
            <h1>Receipts</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="#">Settings</li>
                <li class="active">Receipts</li>
            </ol>
        </section>
        <section class="content">
            <div class="box">
                <!-- /.box-header -->
                <div class="box-header">
                    <asp:Label ID="lblIFR" class="control-label col-sm-12" runat="server" Text="">
                      <span style="color: red;font-weight:600">Indicate fields are required : *</span></asp:Label>
                </div>
                <div class="box-body">
                    <!-- 1st row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblVoucherNo" class="control-label col-md-4" runat="server" Text="Receipts"><b> Voucher No :</b>
                            </asp:Label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtVoucherNo" CssClass="form-control" placeholder="Enter Voucher No" runat="server"></asp:TextBox>
                                <%--<asp:RequiredFieldValidator ID="rfVNo" runat="server" ErrorMessage="Voucher No is Required" ForeColor="Red" ControlToValidate="txtVoucherNo" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="refVNo" runat="server" ErrorMessage="Enter Valid Voucher No" ForeColor="Red" ControlToValidate="txtVoucherNo" ValidationExpression="^[a-zA-Z'.\s]{1,100}$" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblReceiveDate" class="control-label col-md-4" runat="server" Text="Receipts"><b> Received Date :</b>  <span style="color: red;">*</span>
                            </asp:Label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtReceiveDate" type="date" CssClass="form-control" placeholder="Enter Receive Date" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvReceviedDate" runat="server" ErrorMessage="Date is Required" ForeColor="Red" ControlToValidate="txtReceiveDate" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <!--middile--->
                      <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblMajorAccount" class="control-label col-md-4" runat="server" Text="Major Account"><b> Major Account :</b> <span style="color: red;">*</span>
                            </asp:Label>
                            <div class="col-md-8">
                              <asp:DropDownList ID="ddlMAccountList" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMAccountList_SelectedIndexChanged">
                                    <%--<asp:ListItem Text="--Select--" Value="0"></asp:ListItem>--%>
                                    <%--<asp:ListItem Text="" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="" Value="2"></asp:ListItem>--%>
                                </asp:DropDownList> 
                                <asp:RequiredFieldValidator ID="rfvMAccountList" runat="server" ErrorMessage="Select Major Account" InitialValue="0" ForeColor="Red" ControlToValidate="ddlMAccountList" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblMinorAccount" class="control-label col-md-4" runat="server" Text="Minor Account"><b> Minor Account :</b> <span style="color: red;">*</span>
                            </asp:Label>
                            <div class="col-md-8">
                               <asp:DropDownList ID="ddlMinorAccountList" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMinorAccountList_SelectedIndexChanged">
                                    <%--<asp:ListItem Text="--Select--" Value="0"></asp:ListItem>--%>
                                    <%--<asp:ListItem Text="" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="" Value="2"></asp:ListItem>--%>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvMAccount" runat="server" ErrorMessage="Select Minor Account" InitialValue="0" ForeColor="Red" ControlToValidate="ddlMinorAccountList" Display="Dynamic"></asp:RequiredFieldValidator>      
                            </div>
                        </div>
                    </div>   
                    <!--2nd Row--->
                    <div class="form-group row">
                           <div class="col-md-6">
                            <asp:Label ID="lblReceivedThrough" class="control-label col-md-4" runat="server" Text="Received Through"><b>Received Through :</b>  <span style="color: red;">*</span>
                            </asp:Label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="DdlReceivedThrough" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DdlRecievedThrough_SelectedIndexChanged">
                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Cash" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Bank" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                               <asp:RequiredFieldValidator ID="rfvRMode" runat="server" ErrorMessage="Select Received Mode" ForeColor="Red" InitialValue="0" ControlToValidate="DdlReceivedThrough" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblFromAccount" class="control-label col-md-4" runat="server" Text="Receipts"><b> From Account :</b>  <span style="color: red;">*</span>
                            </asp:Label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="DdlFromAccount" CssClass="form-control" runat="server" AutoPostBack="True">
                                    <%--<asp:ListItem Text="--Select--" Value="0"></asp:ListItem>--%>
                                </asp:DropDownList>
                               <asp:RequiredFieldValidator ID="rfvFromAccount" runat="server" ErrorMessage="Select From Account" ForeColor="Red" InitialValue="0" ControlToValidate="DdlFromAccount" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <!--3rd row--->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblToAccount" class="control-label col-md-4" runat="server" Text="To Account"><b>To Account :</b><span style="color: red;">*</span>
                            </asp:Label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="DdlToAccount" CssClass="form-control" runat="server" AutoPostBack="True">
                                     <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvToAccount" runat="server" ErrorMessage="Select To Account" ForeColor="Red" InitialValue="0" ControlToValidate="DdlToAccount" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblCurrentBalance" class="control-label col-md-4" runat="server" Text="Receipts"><b> Current Balance :</b>
                            </asp:Label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtCurrentBalance" CssClass="form-control " disabled  runat="server" autopostback="true" OnTextChanged="txtCurrentBalance_TextChanged1" ></asp:TextBox>
                                <%--<asp:RequiredFieldValidator ID="rfvCCBal" runat="server" ErrorMessage="Current Balance is Required" ForeColor="Red" ControlToValidate="txtCurrentBalance" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revCCBal" runat="server" ErrorMessage="Current Balance Must be Numeric" ForeColor="Red" ControlToValidate="txtCurrentBalance" ValidationExpression="^[0-9]+[.][0-9]{2}$" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                            </div>
                        </div>
                        </div>

                     <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblReceivingAmount" class="control-label col-md-4" runat="server" Text="&lt;b&gt; Receiving Amount :&lt;/b&gt;  &lt;span style=&quot;color: red;&quot;&gt;*&lt;/span&gt;
                            "></asp:Label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtReceivingAmount" CssClass="form-control" placeholder="Enter Receiving Amount" runat="server" AutoPostBack="True" OnTextChanged="txtReceivingAmount_TextChanged"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="rfvRAmount" runat="server" ErrorMessage="Receiving Amount is Required" ForeColor="Red" ControlToValidate="txtReceivingAmount" Display="Dynamic"></asp:RequiredFieldValidator>
                                  <%--<asp:RegularExpressionValidator ID="revRAmount" runat="server" ErrorMessage="Receiving Amount Must be Numeric" ForeColor="Red" ControlToValidate="txtReceivingAmount" ValidationExpression="^[0-9]+[.][0-9]{2}$" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                            </div>
                        </div>
                <div class="col-md-6">
                            <asp:Label ID="lblABalance" class="control-label col-md-4" runat="server" Text="Available Balance"><b> Available Balance :</b>
                            </asp:Label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtABalance" CssClass="form-control" disabled runat="server" autopostback="true" OnTextChanged="txtABalance_TextChanged"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <%--<div>
                        <asp:textbox id="txt1" runat="server" autopostback="true" xmlns:asp="#unknown">
                            ontextchanged="txt1_TextChanged"></asp:textbox>
                        <asp:textbox id="txt2" runat="server" autopostback="true" xmlns:asp="#unknown">
                            ontextchanged="txt2_TextChanged"></asp:textbox>
                        <asp:textbox id="txt3" runat="server" autopostback="true" readonly="true" xmlns:asp="#unknown"></asp:textbox>
                    </div>--%>

                    <!--4th row-->
                    <div class="form-group row" id="divPM" runat="server">
                        <div class="col-md-6">
                            <asp:Label ID="lblPaymentMode" class="control-label col-md-4" runat="server" Text="Receipts"><b>Payment Mode</b><span style="color: red;">*</span>
                            </asp:Label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="DdlPaymentMode" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DdlPaymentMode_SelectedIndexChanged">
                                    <asp:ListItem Text="--Select Cheque/DD--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Cheque" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="DD" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Credit/Debit Card" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="Internet Banking" Value="4"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvPMode" runat="server" ErrorMessage="Select Payment Mode" ForeColor="Red" InitialValue="0" ControlToValidate="DdlPaymentMode" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <!---5th row--->
                    <div class="form-group row" id="divCheque" runat="server">
                        <div class="col-md-6">
                            <asp:Label ID="lblChequeNo" class="control-label col-md-4" runat="server" Text="Receipts"><b> Cheque No</b>
                            </asp:Label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtChequeNo" CssClass="form-control" placeholder="Enter Cheque No" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvChequeno" runat="server" ErrorMessage="Cheque Number is Required" ForeColor="Red" ControlToValidate="txtChequeNo" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revChequeno" runat="server" ErrorMessage="Enter Valid Cheque Number" ForeColor="Red" ControlToValidate="txtChequeNo" ValidationExpression="[a-zA-Z0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblChequeDate" class="control-label col-md-4" runat="server" Text="Receipts"><b> Cheque Date</b>
                            </asp:Label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtChequeDate" type="date" CssClass="form-control" placeholder="Enter Cheque Date" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvCDate" runat="server" ErrorMessage="Date is Required" ForeColor="Red" ControlToValidate="txtChequeDate" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <!--6th row-->
                    <div class="form-group row" id="divDD" runat="server">
                        <div class="col-md-6">
                            <asp:Label ID="lblDDNo" class="control-label col-md-4" runat="server" Text="Receipts"><b> DD No</b><span style="color: red;">*</span>
                            </asp:Label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtDDNo" CssClass="form-control" placeholder="Enter DD No" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvDDNo" runat="server" ErrorMessage="DD Number is Required" ForeColor="Red" ControlToValidate="txtDDNo" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revDDNo" runat="server" ErrorMessage="Enter Valid DD Number" ForeColor="Red" ControlToValidate="txtDDNo" ValidationExpression="[a-zA-Z0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <div class="col-md-6" >
                            <asp:Label ID="lblDate" class="control-label col-md-4" runat="server" Text="Receipts"><b>DD Date</b><span style="color: red;">*</span>
                            </asp:Label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtDate" type="date" CssClass="form-control" placeholder="Enter Date" runat="server"></asp:TextBox>
                                <%--<asp:RequiredFieldValidator ID="rfv" runat="server" ErrorMessage="Date is Required" ForeColor="Red" ControlToValidate="txtDate" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                            </div>
                        </div>
                    </div>
                    <!--7th row-->
                    <div class="form-group row" id="divBank" runat="server">
                        <div class="col-md-6">
                            <asp:Label ID="lblAccountNo" class="control-label col-md-4" runat="server" Text="Receipts"><b> Account No</b><span style="color: red;">*</span>
                            </asp:Label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtAccountNo" CssClass="form-control" placeholder="Enter Account No" runat="server"></asp:TextBox>
                                <%--<asp:RequiredFieldValidator ID="rfvAccountno" runat="server" ErrorMessage="Account Number is Required" ForeColor="Red" ControlToValidate="txtAccountNo" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revAccountno" runat="server" ErrorMessage="Enter Valid Account Number" ForeColor="Red" ControlToValidate="txtAccountNo" ValidationExpression="^\d+$" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblBankName" class="control-label col-md-4" runat="server" Text="Receipts"><b> Bank Name</b><span style="color: red;">*</span>
                            </asp:Label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtBankName" CssClass="form-control" placeholder="Enter Bank Name" runat="server"></asp:TextBox>
                               <%-- <asp:RequiredFieldValidator ID="rfvBankName" runat="server" ErrorMessage="Bank Name is Required" ForeColor="Red" ControlToValidate="txtBankName" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revBankName" runat="server" ErrorMessage="Enter Valid Bank Name" ForeColor="Red" ControlToValidate="txtBankName" ValidationExpression="[a-zA-Z0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                            </div>
                        </div>
                        </div>
                        <!--8th row-->
                        <div class="form-group row" id="divCard" runat="server">
                        <div class="col-md-6">
                            <asp:Label ID="lblCardNo" class="control-label col-md-4" runat="server" Text="Receipts"><b> Card No </b><span style="color: red;">*</span>
                            </asp:Label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtCardNo" CssClass="form-control" placeholder="Enter Card No" runat="server"></asp:TextBox>
                                 <%--<asp:RequiredFieldValidator ID="tfvCardNo" runat="server" ErrorMessage="Card  Number is Required" ForeColor="Red" ControlToValidate="txtCardNo" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revCardNo" runat="server" ErrorMessage="Enter Valid Card  Number" ForeColor="Red" ControlToValidate="txtCardNo" ValidationExpression="^\d+$" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                            </div>
                        </div>
                            </div>
                    <!--9th row-->
                     <div class="form-group row" id="divTD" runat="server">
                        <div class="col-md-6">
                            <asp:Label ID="lblTransactionDate" class="control-label col-md-4" runat="server" Text="Receipts"><b> Transaction Date</b><span style="color: red;">*</span>
                            </asp:Label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtTransactionDate" type="date" CssClass="form-control" placeholder="Enter Transaction Date" runat="server"></asp:TextBox>
                                <%--<asp:RequiredFieldValidator ID="rfvTDate" runat="server" ErrorMessage="Transaction Date is Required" ForeColor="Red" ControlToValidate="txtTransactionDate" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                            </div>
                        </div>
                            </div>
                     <!--10th row-->
                    <div class="form-group row" id="divRN" runat="server">
                        <div class="col-md-6">
                            <asp:Label ID="lblReferenceNo" class="control-label col-md-4" runat="server" Text="Receipts"><b> Reference No</b><span style="color: red;">*</span>
                            </asp:Label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtReferenceNo" CssClass="form-control" placeholder="Enter Reference No" runat="server"></asp:TextBox>
                                <%-- <asp:RequiredFieldValidator ID="rfvvRNo" runat="server" ErrorMessage="Account Number is Required" ForeColor="Red" ControlToValidate="txtReferenceNo" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revRNo" runat="server" ErrorMessage="Enter Valid Account Number" ForeColor="Red" ControlToValidate="txtReferenceNo" ValidationExpression="^\d+$" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                            </div>
                        </div>
                        </div>
                    <!--Narration-->
                    <div class="form-group row">
                        <div class="col-md-12">
                            <asp:Label ID="lblNarration" class="control-label col-md-2" runat="server" Text="Receipts"><b>Narration</b><span style="color: red;"></span>
                            </asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox ID="txtNarration" CssClass="form-control" TextMode="multiline" Height="100" placeholder="Enter Narration" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                      <!--Choose File-->
                    <div class="form-group">
                  <asp:Label ID="lblChooseFile" class="control-label col-md-2" runat="server" Text="Choose File"><b>Choose File :</b><span style="color: red;"></span> 
                            </asp:Label>
                         <div class="col-md-5">
                            <asp:FileUpload ID="UploadDoc" CssClass="form-control" runat="server" />
                        </div>
                    </div>
                    <!--Buttons-->
        <div class="form-group row">
                    <div class="modal-footer pull-right">
                        <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" Style="width: 100px;" OnClick="BtnSave_Click" />
                        <asp:Button ID="btnReset" CssClass="btn btn-danger" runat="server" Text="Reset" Style="width: 90px" OnClick="BtnReset_Click" UseSubmitBehavior="False" CausesValidation="False" />
                        <asp:Button ID="btnBack" CssClass="btn btn-danger" PostBackUrl="ReceiptsList.aspx" runat="server" Text="Back" Style="width: 90px" CausesValidation="False" />
                    </div>
                    </div>
            </div>
            </div>
        
                </section>
        <!-- jQuery 2.2.3 -->
        <script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
        <!--Data Tables-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
        <link type="text/css" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" rel="stylesheet">
        <!--Responsive css--->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.dataTables.min.css" />
        <link type="text/css" href="https://cdn.datatables.net/buttons/1.1.2/css/buttons.dataTables.min.css" rel="stylesheet">
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
        <!--Responsive js--->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/responsive/2.2.1/js/dataTables.responsive.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.1.2/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.1.2/js/buttons.flash.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
        <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.1.2/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.1.2/js/buttons.print.min.js"></script>

        <script type="text/javascript">
            //Data Table Function

            $("#AdminPlaceHolder_gdvAccReceiptInVoices").prepend($("<thead><tr><th class='hidden-bound'>RecieptID</th><th>Invoice #</th><th>Received</th><th>Outstanding</th><th>Due Date</th><th>Received Amount</th></tr></thead>").append($(this).find("tr:first")));
            $("#AdminPlaceHolder_gdvAccReceiptInVoices").css('width', '100%');
            $("#AdminPlaceHolder_gdvAccReceiptInVoices").dataTable({
                "pageLength": 10,
                dom: 'Bfrtip',
                buttons: [
                    {
                        extend: 'copy',
                        exportOptions: {
                            columns: [0, 1]
                        }
                    },
                    {
                        extend: 'csv',
                        exportOptions: {
                            columns: [0, 1]
                        }
                    },
                    {
                        extend: 'excel',
                        exportOptions: {
                            columns: [0, 1]
                        }
                    },
                    {
                        extend: 'pdf',
                        exportOptions: {
                            columns: [0, 1]
                        }
                    },
                    {
                        extend: 'print',
                        exportOptions: {
                            columns: [0, 1]
                        }
                    }
                ]

            });

        </script>
    
</asp:Content>

