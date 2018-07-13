<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="BookingDetails.aspx.cs" Inherits="MFBDBO.Master.OfflineRequestEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .checkbox {
            padding-left: 20px;
        }

            .checkbox label {
                display: inline-block;
                vertical-align: middle;
                position: relative;
                padding-left: 5px !important;
                margin-top: 8px;
            }

                .checkbox label::before {
                    content: "";
                    display: inline-block;
                    position: absolute;
                    width: 17px;
                    height: 17px;
                    left: 0;
                    margin-left: -20px;
                    border: 1px solid #cccccc;
                    border-radius: 3px;
                    background-color: #fff;
                    -webkit-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
                    -o-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
                    transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
                }

                .checkbox label::after {
                    display: inline-block;
                    position: absolute;
                    width: 16px;
                    height: 16px;
                    left: 0;
                    top: 0;
                    margin-left: -20px;
                    padding-left: 3px;
                    padding-top: 1px;
                    font-size: 11px;
                    color: #555555;
                }

            .checkbox input[type="checkbox"] {
                opacity: 0;
                z-index: 1;
            }

                .checkbox input[type="checkbox"]:checked + label::after {
                    font-family: "FontAwesome";
                    content: "\f00c";
                }

        .checkbox-primary input[type="checkbox"]:checked + label::before {
            background-color: #337ab7;
            border-color: #337ab7;
        }

        .checkbox-primary input[type="checkbox"]:checked + label::after {
            color: #fff;
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
            <h1>Booking Details</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Booking Details</li>
            </ol>
        </section>
        <section class="content">
            <div class="box">
                <!--Hotel Details -->
                <div class="box-header with-border">
                    <h3 class="box-title">Booking Details</h3>
                </div>
                <div class="box-body">
                    <!--1st Row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblBookingID" CssClass="control-label col-sm-3" runat="server" Text="Booking ID"><b>Booking ID : </b></asp:Label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtBID" CssClass="form-control" placeholder="Enter Booking ID" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblFCDate" CssClass="control-label col-sm-4" runat="server" Text="Free Cancellation Date"><b>Free Cancellation : </b></asp:Label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtFreeCancellationD" CssClass="form-control" type="date" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFCAncel" runat="server" ErrorMessage="Date is Required" ForeColor="Red" ControlToValidate="txtFreeCancellationD" Display="Dynamic"></asp:RequiredFieldValidator>
                                <%-- <asp:RequiredFieldValidator ID="rfvFreeCancelation" runat="server" ErrorMessage="Free Cancellation is Required" ForeColor="Red" ControlToValidate="txtFreeCancellationD" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revFreeCancelation" runat="server" ErrorMessage="Enter Valid Free Cancellation" ForeColor="Red" ControlToValidate="txtFreeCancellationD" ValidationExpression="^[a-zA-Z'.\s]{1,100}$" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                            </div>
                        </div>
                    </div>
               <%--     <div class="clearfix"></div>
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblPaymentType" CssClass="control-label col-sm-3" runat="server" Text="Payment Type : "><b>Payment Type : </b></asp:Label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddlPaymentType" CssClass="form-control" runat="server">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblPaymentStatus" CssClass="control-label col-sm-4" runat="server" Text="Payment Status"><b>Payment Status : </b></asp:Label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddlPaymentStatus" CssClass="form-control" runat="server">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblBookingType" CssClass="control-label col-sm-3" runat="server" Text="Booking Type : "><b>Booking Type : </b></asp:Label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddlBookingType" CssClass="form-control" runat="server">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblSupBookRef" CssClass="control-label col-sm-4" runat="server" Text="Sup Book Ref : "><b>Sup Book Ref :</b></asp:Label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtSBRef" CssClass="form-control" placeholder="Enter Sup Book Ref" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <!--Check Boxes-->
                    <div class="checkbox checkbox-primary">
                        <div class="col-md-2">
                            <asp:CheckBox ID="cbCancellation" CssClass="styled" runat="server" Text="Cancellation" />
                        </div>
                        <div class="col-md-2">
                            <asp:CheckBox ID="cbAmendment" CssClass="styled" runat="server" Text="Amendment" />
                        </div>
                        <div class="col-md-2">
                            <asp:CheckBox ID="cbNonRefundable" CssClass="styled" runat="server" Text="Non-Refundable" />
                        </div>
                    </div>--%>

                </div>
                <hr />
                <!--Booking Details -->
                <div class="box-header with-border">
                    <h3 class="box-title">Hotel Details</h3>
                </div>
                <div class="box-body">
                    <!--2nd  Row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblHN" CssClass="control-label col-sm-3" runat="server" Text="Hotel Name"><b>Hotel Name : </b></asp:Label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtHN" placeholder="Enter Hotel Name" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvHotelName" runat="server" ErrorMessage="Hotel Name is Required" ForeColor="Red" ControlToValidate="txtHN" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revHotelName" runat="server" ErrorMessage="Hotel Name Must be Alphabets" ForeColor="Red" ControlToValidate="txtHN" ValidationExpression="^[a-zA-Z'.\s]{1,100}$" Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblHContact" CssClass="control-label col-sm-4" runat="server" Text="Hotel Contact No "><b>Hotel Contact No : </b></asp:Label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtHCNo" placeholder="Enter Hotel Contact No" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvHCNo" runat="server" ErrorMessage="Mobile No is Required" ControlToValidate="txtHCNo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revHCNo" runat="server" ErrorMessage="Mobile No Contains 10 Digits" ForeColor="Red" ControlToValidate="txtHCNo" ValidationExpression="[0-9]{10}" Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <!--3rd Row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblHAddress" CssClass="control-label col-sm-3" runat="server" Text="Hotel Address"><b>Hotel Address : </b></asp:Label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtHtAdress" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Address is Required" ForeColor="Red" ControlToValidate="txtHtAdress" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblLocation" CssClass="control-label col-sm-4" runat="server" Text="Hotel Location"><b>Hotel Location : </b></asp:Label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtHLocation" placeholder="Enter Hotel location" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvHLocation" runat="server" ErrorMessage="Hotel Location is Required" ForeColor="Red" ControlToValidate="txtHLocation" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revHLocation" runat="server" ErrorMessage="Enter Valid Hotel Location" ForeColor="Red" ControlToValidate="txtHLocation" ValidationExpression="^[a-zA-Z'.\s]{1,100}$" Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <!--4th Row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblCheckInDate" CssClass="control-label col-sm-3" runat="server" Text="Check-In Date"><b>Check-In : </b></asp:Label>
                            <div class="col-sm-9">
                                <%--<asp:TextBox ID="txtCheckInDate"  type="date" Cssclass="form-control" runat="server"></asp:TextBox>--%>
                                <asp:TextBox ID="txtCheckInDate" placeholder="mm/dd/yyyy" class="form-control" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="txtCheckInDate_CalendarExtender" runat="server" BehaviorID="txtCheckInDate_CalendarExtender" TargetControlID="txtCheckInDate" />
                                <asp:RequiredFieldValidator ID="rfvCheckindDate" runat="server" ErrorMessage="Date is Required" ForeColor="Red" ControlToValidate="txtCheckInDate" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblCheckOutDate" CssClass="control-label col-sm-4" runat="server" Text="Check-Out Date"><b>Check-Out : </b></asp:Label>
                            <div class="col-sm-8">
                                <%--<asp:TextBox ID="txtCheckOutDate" type="date" Cssclass="form-control" runat="server"></asp:TextBox>--%>
                                <asp:TextBox ID="txtCheckOutDate" CssClass="form-control" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="txtCheckOutDate_CalendarExtender" runat="server" BehaviorID="txtCheckOutDate_CalendarExtender" TargetControlID="txtCheckOutDate" />
                                <asp:RequiredFieldValidator ID="rfvCheckOutDate" runat="server" ErrorMessage="Date is Required" ForeColor="Red" ControlToValidate="txtCheckOutDate" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblDestination" CssClass="control-label col-sm-4" runat="server" Text="Destination"><b>Destination :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblDest" CssClass="control-label" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblNationality" CssClass="control-label col-sm-4" runat="server" Text="Nationality"><b>Nationality :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblIn" CssClass="control-label" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblPreferedHotels" CssClass="control-label col-sm-4" runat="server" Text="Prefered Hotels"><b>Prefered Hotels :</b>
                            </asp:Label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblHName" CssClass="control-label" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                 <hr />
                <!--Room Details -->
                <div class="box-header with-border">
                    <h3 class="box-title">Room 1</h3>
                </div>
                <div class="box-body">
                    <!-- Begin Room 1-->
                    <!--1st Row-->
                    <div class="row">
                        <div class="form-group col-md-2" style="">
                            <asp:Label ID="lblAdult" CssClass="control-label" runat="server" Text="Room 1"><b>Adult(s) Detail : </b></asp:Label>
                        </div>
                        <div class="form-group col-md-2">
                            <asp:Label ID="lblAdultSal" CssClass="control-label" runat="server" Text="Salutation"><b>Salutation</b></asp:Label>
                            <asp:DropDownList ID="ddlAdultSalutation1" CssClass="form-control" runat="server">
                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Mr" Value="Mr"></asp:ListItem>
                                                <asp:ListItem Text="Mrs" Value="Mrs"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvsalutation" runat="server" ErrorMessage="Select Salutation" ForeColor="Red" InitialValue="0" ControlToValidate="ddlAdultSalutation1" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-md-3">
                            <asp:Label ID="lblAdultFN" CssClass="control-label" runat="server" Text="First Name"><b>First Name</b></asp:Label>
                            <asp:TextBox ID="txtAdultFN1" CssClass="form-control" placeholder="Enter First Name" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvFName" runat="server" ErrorMessage="First Name is Required" ForeColor="Red" ControlToValidate="txtAdultFN1" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revFName" runat="server" ErrorMessage="Last Name Must be Alphabets" ForeColor="Red" ControlToValidate="txtAdultFN1" ValidationExpression="^[a-zA-Z'.\s]{1,100}$" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group col-md-3">
                            <asp:Label ID="lblAdultLN" CssClass="control-label" runat="server" Text="Last Name"><b>Last Name</b></asp:Label>
                            <asp:TextBox ID="txtAdultLN1" CssClass="form-control" placeholder="Enter Last Name" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvLName" runat="server" ErrorMessage="First Name is Required" ForeColor="Red" ControlToValidate="txtAdultLN1" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revLName" runat="server" ErrorMessage="Last Name Must be Alphabets" ForeColor="Red" ControlToValidate="txtAdultLN1" ValidationExpression="^[a-zA-Z'.\s]{1,100}$" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                       <asp:HiddenField ID="hdnAdultGuestId1" runat="server" />
                    <!--2nd  Row-->
                    <div class="row">
                        <div class="form-group col-md-2 col-md-offset-2">
                            <asp:Label ID="lblAdultsal2" CssClass="control-label" runat="server" Text="Salutation"><b>Salutation</b></asp:Label>
                            <asp:DropDownList ID="ddlAdultSalutation2" CssClass="form-control" runat="server">
                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Mr" Value="Mr"></asp:ListItem>
                                                <asp:ListItem Text="Mrs" Value="Mrs"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-md-3">
                            <asp:Label ID="lblAdultFN2" CssClass="control-label" runat="server" Text="First Name"><b>First Name</b></asp:Label>
                            <asp:TextBox ID="txtAdultFN2" CssClass="form-control" placeholder="Enter First Name" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-3">
                            <asp:Label ID="lblAdultLN2" CssClass="control-label" runat="server" Text="Last Name"><b>Last Name</b></asp:Label>
                            <asp:TextBox ID="txtAdultLN2" CssClass="form-control" placeholder=" Enter Last Name" runat="server"></asp:TextBox>
                              
                        </div>
                    </div>
                     <asp:HiddenField ID="hdnAdultGuestId2" runat="server" />
                    <!--Child Details-->
                    <div class="row">
                        <div class="form-group col-md-2" style="">
                            <asp:Label ID="lblChild" CssClass="control-label" runat="server" Text="Room 1"><b>Child(s) Detail : </b></asp:Label>
                        </div>
                        <div class="form-group col-md-2">
                            <asp:Label ID="lblChildAge1" CssClass="control-label" runat="server" Text="Age"><b>Age</b></asp:Label>
                          <asp:DropDownList ID="ddlChildAge1" CssClass="form-control" AutoPostBack="false" runat="server">
                                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                                <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-md-3">
                            <asp:Label ID="lblChildFN1" CssClass="control-label" runat="server" Text="First Name"><b>First Name</b></asp:Label>
                            <asp:TextBox ID="txtChildFN1" CssClass="form-control" placeholder="Enter First Name" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-3">
                            <asp:Label ID="lblChildLN1" CssClass="control-label" runat="server" Text="Last Name"><b>Last Name</b></asp:Label>
                            <asp:TextBox ID="txtChildLN1" CssClass="form-control" placeholder=" Enter Last Name" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <asp:HiddenField ID="hdnChildGuestId1" runat="server" />
                    <div class="row">
                        <div class="form-group col-md-2" style="">
                        </div>
                        <div class="form-group col-md-2">
                            <asp:Label ID="lblChildAge2" CssClass="control-label" runat="server" Text="Age"><b>Age</b></asp:Label>
                           <asp:DropDownList ID="ddlChildAge2" CssClass="form-control" AutoPostBack="false" runat="server">
                                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                                <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-md-3">
                            <asp:Label ID="lblChildFN2" CssClass="control-label" runat="server" Text="First Name"><b>First Name</b></asp:Label>
                            <asp:TextBox ID="txtChildFN2" CssClass="form-control" placeholder="Enter First Name" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-3">
                            <asp:Label ID="lblChildLN2" CssClass="control-label" runat="server" Text="Last Name"><b>Last Name</b></asp:Label>
                            <asp:TextBox ID="txtChildLN2" CssClass="form-control" placeholder=" Enter Last Name" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <asp:HiddenField ID="hdnChildGuestId2" runat="server" />
                    <!-- End Room 1-->
                </div>
                 <hr />
                <!--Booking Amount Breakup-->
                <div class="box-header with-border">
                    <h3 class="box-title">Booking Amount Breakup</h3>
                </div>
                <div class="box-body">
                    <div class="form-group row">
                        <div class=" col-md-4">
                            <asp:Label ID="lblRoomType" CssClass="control-label col-md-5" runat="server" Text="Room Type :"><b>Room Type :</b></asp:Label>
                            <div class="col-md-7">
                                <asp:TextBox ID="txtRT" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <asp:Label ID="lblInclusion" CssClass="control-label col-md-5" runat="server" Text="Inclusion :"><b>Inclusion :</b></asp:Label>
                            <div class=" col-md-7">
                                <asp:TextBox ID="txtInclusion" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <asp:Label ID="lblNORooms" CssClass="control-label col-md-5" runat="server" Text="No.of Rooms :"><b>No.of Rooms : </b></asp:Label>
                            <div class="col-md-7">
                                <asp:TextBox ID="txtNORooms" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                    <div class="form-group row">
                        <div class="col-md-4">
                            <asp:Label ID="lblActualAmount" CssClass="control-label col-md-5" runat="server" Text="Actual Amount : "><b>Actual Amount :</b></asp:Label>
                            <div class="col-md-7">
                                <asp:TextBox ID="txtAA" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <asp:Label ID="lblFinalAmount" CssClass="control-label col-md-5" runat="server" Text="Final Amount :"><b>Final Amount :</b></asp:Label>
                            <div class="col-md-7">
                                <asp:TextBox ID="txtFA" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <asp:Label ID="lblStatus" CssClass="control-label col-sm-5" runat="server" Text="Status :"><b>Status :</b></asp:Label>
                            <div class="col-sm-7">
                                <asp:DropDownList ID="ddlStatus" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Confirm" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Reconfirm" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Request" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="Cancel" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="Duplicate" Value="3"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvStatus" ControlToValidate="ddlStatus" runat="server" ForeColor="Red" InitialValue="0" ErrorMessage="Select Status" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <!--Button-->
                    <div class="form-group pull-right">
                        <asp:Button ID="btnBookNow" CssClass="btn btn-primary" runat="server" Text="Book Now" Style="width: 100px;" OnClick="btnBookNow_Click" />
                        <asp:Button ID="btnBack" CssClass="btn btn-danger" PostBackUrl="OfflineRequests.aspx" CausesValidation="false" runat="server" Text="Back" Style="width: 100px;" OnClick="btnBack_Click" />
                   <asp:HiddenField ID="hdnRequestId" runat="server" />
                                <asp:HiddenField ID="hdnGuestId" runat="server" />
                           </div>
                </div>
            </div>

        </section>
   
</asp:Content>
