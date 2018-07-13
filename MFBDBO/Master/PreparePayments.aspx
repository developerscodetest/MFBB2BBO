<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="PreparePayments.aspx.cs" Inherits="MFBDBO.Master.PreparePayments" %>

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
            <h1>Prepare Payment
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li><a href="#">Voucher</a></li>
                <li class="active">Prepare Payment</li>
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
                           <%-- <div class="col-md-6">
                                <asp:Label ID="lblPaymentType" class="control-label col-sm-4" runat="server" Text="Payment Type"><b>Payment Type :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="ddlPaymentType" CssClass="form-control" runat="server" AutoPostBack="True">
                                        <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Against Purchase" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Advance Payment" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Other Payment" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvPaymentType" runat="server" ErrorMessage="Select Payment Type" ForeColor="Red" InitialValue="0" ControlToValidate="ddlPaymentType" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>--%>
                             <div class="col-md-6">
                                <asp:Label ID="lblVoucherNo" class="control-label col-sm-4" runat="server" Text="Voucher No"><b>Voucher No :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtVoucherNumber" class="form-control" placeholder="VoucherNumber" runat="server"></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="rfvVNumber" runat="server" ErrorMessage="Voucher Number is Required" ForeColor="Red" ControlToValidate="txtVoucherNumber" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revVNumber" runat="server" ErrorMessage="Enter Valid Voucher Number" ForeColor="Red" ControlToValidate="txtVoucherNumber" ValidationExpression="[a-zA-Z0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                                </div>
                            </div>
                              <div class="col-md-6">
                                <asp:Label ID="lblPaymentDate" class="control-label col-sm-4" runat="server" Text="Payment Date"><b>Payment Date :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtPaymentDate" class="form-control" type="date" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPaymentDate" runat="server" ErrorMessage="Date is Required" ForeColor="Red" ControlToValidate="txtPaymentDate" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <!--middile--->
                      <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblMajorAccount" class="control-label col-md-4" runat="server" Text="Major Account"><b> Major Account :</b> <span style="color: red;">*</span>
                            </asp:Label>
                            <div class="col-md-8">
                              <asp:DropDownList ID="ddlMAccountList" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMAccountList_SelectedIndexChanged" >
                                   <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
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
                        <!--2nd row-->
                        <div class="form-group row">
                      <div class="col-md-6">
                                <asp:Label ID="lblPaymentThrough" class="control-label col-sm-4" runat="server" Text="Payment Through"><b>Payment Through :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="ddlPaymentThrough" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlPaymentThrough_SelectedIndexChanged">
                                        <asp:ListItem Text="-Select-" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Cash" Value="1"> </asp:ListItem>
                                        <asp:ListItem Text="Bank" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvPMode" runat="server" ErrorMessage="Select Payment Mode" ForeColor="Red" InitialValue="0" ControlToValidate="ddlPaymentThrough" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                           <div class="col-md-6">
                                <asp:Label ID="lblFromAccount" class="control-label col-sm-4" runat="server" Text="From Account"><b>From Account :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="ddlFromAccount" runat="server" CssClass="form-control" AutoPostBack="True" >
                                    </asp:DropDownList>
                                  <asp:RequiredFieldValidator ID="rfvAccount" runat="server" ErrorMessage="Select From Account" ForeColor="Red" ControlToValidate="ddlFromAccount" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <!--3rd row-->
                        <div class="form-group row">
                             <div class="col-md-6">
                                <asp:Label ID="lblToAccount" class="control-label col-sm-4" runat="server" Text="To Account"><b>To Account  :</b>
                              <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="ddlToAccount" runat="server" CssClass="form-control" AutoPostBack="True"  >                                       
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvPayto" runat="server" ErrorMessage="Select To Account" ForeColor="Red" InitialValue="0" ControlToValidate="ddlToAccount" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblCurrentBalance" class="control-label col-sm-4" runat="server" Text="Current Balance "><b>Current Balance  :</b>
                           </asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtCurrentBal" class="form-control" disabled runat="server" OnTextChanged="txtCurrentBal_TextChanged" AutoPostBack="True"></asp:TextBox>
                                    <%-- <asp:RequiredFieldValidator ID="rfvCBal" runat="server" ErrorMessage="Current Balance is Required" ForeColor="Red" ControlToValidate="txtCurrentBal" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revCBal" runat="server" ErrorMessage="Current Balance Must be Numeric" ForeColor="Red" ControlToValidate="txtCurrentBal" ValidationExpression="^[0-9]+[.][0-9]{2}$" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                                </div>
                            </div>
                           
                        </div>
                        <!--4th row-->
                        <div class="form-group row">
                            <div class="col-md-6">
                                <asp:Label ID="lblPayingAmount" class="control-label col-sm-4" runat="server" Text="&lt;b&gt;Paying Amount  :&lt;/b&gt; &lt;span style=&quot;color: red;&quot;&gt;*&lt;/span&gt;" ></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtPayingAmount" class="form-control" runat="server" OnTextChanged="txtPayingAmount_TextChanged" AutoPostBack="True" ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPAmount" runat="server" ErrorMessage="Paying Amount is Required" ForeColor="Red" AutoPostBack="True" ControlToValidate="txtPayingAmount" Display="Dynamic"></asp:RequiredFieldValidator>
                                   <%-- <asp:RegularExpressionValidator ID="revPAmount" runat="server" ErrorMessage="Enter Valid Paying Amount" ForeColor="Red" ControlToValidate="txtPayingAmount" ValidationExpression="^[0-9]+[.][0-9]{2}$" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                                </div>
                            </div>
                             <div class="col-md-6">
                                <asp:Label ID="lblTBalance" class="control-label col-sm-4" runat="server" Text="Total Balance"><b>Available Balance :</b>
                             </asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtTotalBalance" class="form-control" disabled runat="server" autopostback="true" OnTextChanged="txtTotalBalance_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <!--5th row-->
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
                                    <%--<asp:RequiredFieldValidator ID="rfvPayMode" runat="server" ErrorMessage="Select Pay Mode" ForeColor="Red" InitialValue="0" ControlToValidate="ddlPayMode" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="divCheque" runat="server">
                            <div class="col-md-6">
                                <asp:Label ID="lblChequeNo" class="control-label col-sm-4" runat="server" Text="Cheque No"><b>Cheque No : </b>
                                    <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtChequeNo" class="form-control" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="rfvChequeno" runat="server" ErrorMessage="Cheque Number is Required" ForeColor="Red" ControlToValidate="txtChequeNo" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revChequeno" runat="server" ErrorMessage="Enter Valid Cheque Number" ForeColor="Red" ControlToValidate="txtChequeNo" ValidationExpression="[a-zA-Z0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                             <div class="col-md-6">
                                <asp:Label ID="lblChequeDate" class="control-label col-sm-4" runat="server" Text="Cheque Date"><b>Cheque Date : </b>
                                    <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtChequeDate" class="form-control" type="date" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvCDate" runat="server" ErrorMessage="Date is Required" ForeColor="Red" ControlToValidate="txtChequeDate" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                       
                        <div class="form-group row" id="divDD" runat="server">
                            <div class="col-md-6">
                                <asp:Label ID="lblDDNo" class="control-label col-sm-4" runat="server" Text="DD No"><b>DD No : </b>
                                    <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtDDNo" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvDDNo" runat="server" ErrorMessage="DD Number is Required" ForeColor="Red" ControlToValidate="txtDDNo" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revDDNo" runat="server" ErrorMessage="Enter Valid DD Number" ForeColor="Red" ControlToValidate="txtDDNo" ValidationExpression="[a-zA-Z0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                             <div class="col-md-6">
                                <asp:Label ID="lblDDDate" class="control-label col-sm-4" runat="server" Text="DD Date"><b>DD Date : </b>
                                    <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtDDDate" class="form-control" type="date" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Date is Required" ForeColor="Red" ControlToValidate="txtChequeDate" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                       
                        <div class="form-group row" id="divBank" runat="server">
                            <div class="col-md-6">
                                <asp:Label ID="lblAcNO" class="control-label col-sm-4" runat="server" Text="Account No"><b>Account No :</b>
                                    <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtAcNo" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvAcno" runat="server" ErrorMessage="Account Number is Required" ForeColor="Red" ControlToValidate="txtAcNo" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revAcno" runat="server" ErrorMessage="Enter Valid Account Number" ForeColor="Red" ControlToValidate="txtAcNo" ValidationExpression="^\d+$" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                              <div class="col-md-6">
                                <asp:Label ID="lblBankName" class="control-label col-sm-4" runat="server" Text="Bank Name"><b>Bank Name :</b>
                                    <span style="color: red;">*</span></asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtBankName" class="form-control" placeholder="Enter Bank Name" runat="server"></asp:TextBox>

                                    <asp:RequiredFieldValidator ID="rfvBankName" runat="server" ErrorMessage="Bank Name is Required" ForeColor="Red" ControlToValidate="txtBankName" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revBankName" runat="server" ErrorMessage="Enter Valid Bank Name" ForeColor="Red" ControlToValidate="txtBankName" ValidationExpression="[a-zA-Z0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                                    
                                </div>
                            </div>
                        </div>
                       
                        <div class="form-group row" id="divCard" runat="server">
                            <div class="col-md-6">
                                <asp:Label ID="lblCardNo" class="control-label col-sm-4" runat="server" Text="Card No"><b>Card No : </b>
                                  </asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtCardNo" class="form-control" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="tfvCardNo" runat="server" ErrorMessage="Card  Number is Required" ForeColor="Red" ControlToValidate="txtCardNo" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revCardNo" runat="server" ErrorMessage="Enter Valid Card  Number" ForeColor="Red" ControlToValidate="txtCardNo" ValidationExpression="^\d+$" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                             </div>
                          <div class="form-group row" id="divTD" runat="server">
                             <div class="col-md-6">
                                <asp:Label ID="lblTransactionDate" class="control-label col-sm-4" runat="server" Text="Transaction Date"><b>Transaction Date : </b>
                                   </asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtTransactionDate" class="form-control" type="date" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvTDate" runat="server" ErrorMessage="Transaction Date is Required" ForeColor="Red" ControlToValidate="txtTransactionDate" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            </div>
                        <div class="form-group row" id="divRN" runat="server">
                              <div class="col-md-6">
                                <asp:Label ID="lblReferenceNo" class="control-label col-sm-4" runat="server" Text="Reference No"><b>Reference No : </b>
                                    </asp:Label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtReferenceNo" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvvRNo" runat="server" ErrorMessage="Account Number is Required" ForeColor="Red" ControlToValidate="txtReferenceNo" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revRNo" runat="server" ErrorMessage="Enter Valid Account Number" ForeColor="Red" ControlToValidate="txtReferenceNo" ValidationExpression="^\d+$" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                       </div>
                     <!--Narration---->
                            <div class="form-group row">
                                    <div class="col-md-12">
                                          <asp:Label ID="lblNarration" class="control-label col-sm-2" runat="server" Text="Narration"><b>Narration : </b><span style="color: red"></span>
                                    </asp:Label>
                                        
                                        <div class="col-md-10">
                                            <asp:TextBox ID="txtNarration" runat="server" placeholder="Enter Narration" class="form-control" TextMode="MultiLine" Height="100"></asp:TextBox>
                                          <%--  <asp:RequiredFieldValidator ID="rfvNarration" runat="server" ErrorMessage="Narration is Required" ForeColor="Red" ControlToValidate="txtNarration" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revNarration" runat="server" ErrorMessage="Enter Valid Narration" ForeColor="Red" ControlToValidate="txtNarration" ValidationExpression="[a-zA-Z0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                                        </div>
                                    </div>
                            </div>
                    <!--Choose Files---->
                               <div class="form-groupn row">
                                   <div class="col-md-6">
                                    <%--  <div class="form-group">
                                            <b>Attach Files :</b>
                                            <div class="btn btn-primary btn-file">
                                                <i class="fa fa-paperclip"></i> Browse
                                                 <asp:FileUpload ID="BrowseFile" CssClass="form-control" runat="server" />
                                            </div>
                                               <asp:RequiredFieldValidator ID="rfvBFile" ErrorMessage="File Upload is Required " ControlToValidate="BrowseFile"
                                                    runat="server" Display="Dynamic" ForeColor="Red" />
                                                <asp:RegularExpressionValidator ID="revBFile" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.doc|.docx|.pdf|.png|.jpg|.gif|.txt|.xls|.xlsx)$"
                                                    ControlToValidate="BrowseFile" runat="server" ForeColor="Red" ErrorMessage="Please select a valid Document."
                                                    Display="Dynamic" />
                                        </div>--%>
                <asp:Label ID="lblChooseFile" class="control-label col-md-4" runat="server" Text="Choose File"><b>Choose File :</b><span style="color: red;"></span> 
                            </asp:Label>
                         <div class="col-md-8">
                            <asp:FileUpload ID="BrowseFile" CssClass="form-control" runat="server" />
                        </div>
                       <input type="hidden" name="FilePath" id="FilePath" />
                        </div>
                                   </div>
             <!--button--->
                        <div style="text-align: right">
                            <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" Style="width: 100px;" OnClick="btnSave_Click" />
                            <asp:Button ID="btnReset" class="btn btn-danger" runat="server" Text="Reset" Style="width: 100px;" OnClick="btnReset_Click" CausesValidation ="false"/>
                             <asp:Button ID="btnBack" class="btn btn-danger" runat="server" PostBackUrl="PaymentsList.aspx" Text="Back" Style="width: 100px;" CausesValidation ="false" />
                            <asp:HiddenField ID="hdnPaymentsID" runat="server" />
                        </div>                        

                    </div>
                </div>
            </div>
           <%-- <div id="Paymentmodal"></div>--%>
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

            $("#AdminPlaceHolder_gdvMinorAccount").prepend($("<thead><tr><th class='hidden-bound'>MinorAccountID</th><th>Major Account</th><th>Minor Account</th><th>MinorAccount Code</th><th>Status</th><th>Actions</th></tr></thead>").append($(this).find("tr:first")));
            $("#AdminPlaceHolder_gdvMinorAccount").css('width', '100%');
            $("#AdminPlaceHolder_gdvMinorAccount").dataTable({
                "pageLength": 10,
                dom: 'Bfrtip',
                buttons: [
                   
                    {
                        extend: 'excel',
                        exportOptions: {
                            columns: [0, 1]
                        }
                    },
                    //{
                    //    extend: 'pdf',
                    //    exportOptions: {
                    //        columns: [0, 1]
                    //    }
                    //},
                  
                ]

            });

        </script>
    
</asp:Content>
