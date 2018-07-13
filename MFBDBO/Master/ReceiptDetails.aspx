<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="ReceiptDetails.aspx.cs" Inherits="MFBDBO.Master.RecieptDetails" %>
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
            <h1>Reciept Details</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                 <li class="#">Voucher</li>
                <li class="active">Reciept Details</li>
            </ol>
        </section>    
<section class="content">
    <div class="row">
        <div class="box">
            <!-- /.box-header -->
            <div class="box-body table-responsive">

                <div class="content">
                    <form>
                        <table class="table table-bordered table-hover">
                            <tr style="background-color:lightgray">
                                <td colspan="8">Voucher Details</td>
                            </tr>
                            <tr style="width:50%">
                                <td colspan="2" style="width:16%">
                                    Date
                                </td>
                                <td colspan="2">
                                    <label id="lblrecDate">12/10/2017</label>
                                </td>

                                <td colspan="2">
                                    Voucher No
                                </td>
                                <td colspan="2">
                                    <label id="lblrecVchrNo">2017VOC123</label>
                                </td>
                            </tr>
                        </table>
                        <div class="row">
                            <div class="box-body table-responsive" style="overflow:hidden;">
                                <table id="tblreceipts" class="table table-bordered table-hover" style="margin-left: 3px;margin-top: -23px;    width: 99%;">
                                    <thead>
                                        <tr>
                                            <th>Type</th>
                                            <th>Account Header</th>
                                            <th>Detail </th>
                                            <th>Amount</th>
                                        </tr>
                                    </thead>
                                    <tr>
                                        <td>
                                            <span id="lblrecDebit">Debit</span>
                                        </td>
                                        <td>
                                            <span id="lblreceiptdebitType">Cash</span>
                                        </td>
                                        <td>
                                            <span id="lbldebitHeaderType">Cash-in Hand</span>

                                        </td>
                                        <td>
                                            <span id="lbldebitamount">100</span>
                                        </td>


                                    </tr>
                                    <tr>
                                        <td>
                                            <span id="lblCredit">Credit</span>
                                        </td>
                                        <td>
                                            <span id="lblcreditAccount">Taxes </span>

                                        </td>
                                        <td>
                                            <span id="lblcreditDetails">Entertainment tax</span>
                                        </td>
                                        <td>
                                            <span id="lblcreditamount">100</span>

                                        </td>

                                    </tr>
                                    <tbody id="tbodyReceipt"></tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="box-body table-responsive">
                                <table class="table table-bordered table-hover">
                                    <tr style="background-color:lightgray">
                                        <td colspan="8">Bank Details</td>
                                    </tr>
                                    <tr id="ChequeID">
                                        <td>
                                            Cheque
                                        </td>
                                        <td>
                                            <label id="ddlPaymentBill">Cheque</label>

                                        </td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr id="ChequeRowID">
                                        <td>
                                            Cheque No
                                        </td>
                                        <td>
                                            <label id="lblChequeno">1236547895412</label>

                                        </td>
                                        <td>
                                            Cheque Date
                                        </td>
                                        <td>
                                            <label id="lblChequedate">12/10/2017</label>

                                        </td>
                                    </tr>
                                    <tr id="DDrowId">
                                        <td>
                                            DD No
                                        </td>
                                        <td>
                                            <label id="lblDDno">1236547894</label>

                                        </td>
                                        <td>
                                            Date
                                        </td>
                                        <td>
                                            <label id="lblDDdate">15/10/2017</label>

                                        </td>
                                    </tr>
                                    <tr id="AccountId">
                                        <td>
                                            Account No
                                        </td>
                                        <td>
                                            <label id="lblAccno">31325698412</label>

                                        </td>
                                        <td>
                                            Bank Name
                                        </td>
                                        <td>
                                            <label id="lblBankName">Axis</label>

                                        </td>
                                    </tr>
                                    <tr id="CommentsName">
                                        <td>
                                            Comments / Reason :
                                        </td>

                                        <td>
                                            <label id="lblComments">Testing</label>

                                        </td>
                                        <td></td>
                                        <td></td>
                                    </tr>

                                </table>
                            </div>
                            <div class="box-body table-responsive">
                                <table class="table table-bordered table-hover">

                                    <tr style="background-color:lightgray">
                                        <td colspan="8">Creditor Details</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Company Name
                                        </td>
                                        <td>
                                            <label id="lblCompName">Developers code</label>

                                        </td>
                                        <td>
                                            Type
                                        </td>
                                        <td>
                                            <label id="lblType">IT</label>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Contact Person
                                        </td>
                                        <td>
                                            <label id="lblConPerson">Prasanth</label>

                                        </td>
                                        <td>
                                            Mobile
                                        </td>
                                        <td>
                                            <label id="lblmobile">9958936684</label>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Email
                                        </td>
                                        <td>
                                            <label id="lblEmail">Prasanth@gmail.com</label>

                                        </td>
                                        <td>
                                            City
                                        </td>
                                        <td>
                                            <label id="lblcity">Hyderabad</label>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Address
                                        </td>

                                        <td>
                                            <label id="txtAddress">Telangana</label>

                                        </td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="box-body table-responsive">
                                <table class="table table-bordered table-hover" id="tblimage">
                                    <tr style="background-color:lightgray">
                                        <td colspan="8">Bill / Voucher Details</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Narration
                                        </td>

                                        <td>
                                            <label id="lblnarration">test>Bank>Axis</label>

                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            Voucher / Bill :
                                            <!-- <label style="color:red">Maximum size allowed 3 MB ( * .jpg,.jpeg,.png,.pdf)</label> -->
                                        </td>
                                        <td>
                                            <label id="txtfile"></label>

                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div style="text-align:right">
                            <input type="button" id="btnAbtSave" class="btn btn-success" style="width:90px" value="Verify" />
                            <!-- <input type="button" id="btnAboutUpdate" class="btn btn-success"  value="Approve" style="width:90px" /> -->
                            <!-- <input type="button" id="btnReset" class="btn btn-danger" value="Reject" style="width:90px" /> -->
                            <input type="button" id="btnBack" class="btn btn-danger" onclick="Back()" value="Back" style="width:90px" />
                        </div>
                    
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

            $("#AdminPlaceHolder_gdvMinorAccount").prepend($("<thead><tr><th class='hidden-bound'>MinorAccountID</th><th>Major Account</th><th>Minor Account</th><th>MinorAccount Code</th><th>Status</th><th>Actions</th></tr></thead>").append($(this).find("tr:first")));
            $("#AdminPlaceHolder_gdvMinorAccount").css('width', '100%');
            $("#AdminPlaceHolder_gdvMinorAccount").dataTable({
                "pageLength": 50,
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
