﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="NewRequest.aspx.cs" Inherits="MFBDBO.Master.NewRequest" EnableEventValidation="false" %>

<%--<%@ Register Src="~/Control/DynamicRoomControl.ascx" TagPrefix="uc1" TagName="DynamicRoomControl" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function alertMessage(text) {
            alert(text);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
 
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <section class="content-header">
            <h1>New Request</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">New Request</li>
            </ol>
        </section>
        <section class="content">
            <!-- SELECT2 EXAMPLE -->
            <div class="box box-default">
                <!-- /.box-header -->
                <div class="box-body">
                    <!--Begin Form-->
                    <!--1st Row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblAgency" CssClass="control-label col-sm-3" runat="server" Text="Agency"><b>Agency : </b> <span style="color:red;">*</span></asp:Label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddlAgency" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvAgency" ControlToValidate="ddlAgency" runat="server" ForeColor="Red" InitialValue="0" ErrorMessage="Select Agency Name" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <!--2nd  Row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblDestination" CssClass="control-label col-sm-3" runat="server" Text="Destination"><b>Destination : </b> <span style="color:red;">*</span></asp:Label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtDest" placeholder="Enter Destination" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvDestination" runat="server" ErrorMessage="Destination is Required" ForeColor="Red" ControlToValidate="txtDest" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revDestination" runat="server" ErrorMessage="Destination Must be Alphabets" ForeColor="Red" ControlToValidate="txtDest" ValidationExpression="^[a-zA-Z'.\s]{1,100}$" Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblNationality" CssClass="control-label col-sm-3" runat="server" Text="Nationality"><b>Nationality : </b> <span style="color:red;">*</span></asp:Label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddlNationality" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="India" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Usa" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvNationality" ControlToValidate="ddlNationality" runat="server" ForeColor="Red" InitialValue="0" ErrorMessage="Select Your Nationality" Display="Dynamic"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                    </div>
                    <!--3rd  Row-->
                    <div class="form-group row">
                        <div class="col-md-6">
                            <asp:Label ID="lblCheckInDate" CssClass="control-label col-sm-3" runat="server" Text="Check-In Date"><b>Check-In : </b></asp:Label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtCheckInDate" placeholder="mm/dd/yyyy" class="form-control" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="txtCheckInDate_CalendarExtender" runat="server" BehaviorID="txtCheckInDate_CalendarExtender" TargetControlID="txtCheckInDate" />
                                <asp:RequiredFieldValidator ID="rfvCheckindDate" runat="server" ErrorMessage="Date is Required" ForeColor="Red" ControlToValidate="txtCheckInDate" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblCheckOutDate" placeholder="mm/dd/yyyy" CssClass="control-label col-sm-3" runat="server" Text="Check-Out Date"><b>Check-Out : </b></asp:Label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtCheckOutDate" CssClass="form-control" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="txtCheckOutDate_CalendarExtender" runat="server" BehaviorID="txtCheckOutDate_CalendarExtender" TargetControlID="txtCheckOutDate" />
                                <asp:RequiredFieldValidator ID="rfvCheckOutDate" runat="server" ErrorMessage="Date is Required" ForeColor="Red" ControlToValidate="txtCheckOutDate" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
                <!--End Form-->
                <div class="form-group row">
                    <hr />
                    <!-- Begin Room 1-->
                    <div class="row">
                        <!--Room No-->
                        <div class="col-md-2">
                            <div class="form-group" style="margin: 20px 30px;">
                                <asp:Label ID="Label1" CssClass="control-label" runat="server" Text="Room 1"><b>Room 1 : </b></asp:Label>
                            </div>
                        </div>
                        <!--Adult Part-->
                        <div class="col-md-5">
                            <div class="form-group col-md-12">
                                <asp:Label ID="lblAdult" CssClass="control-label" runat="server" Text="Room 1"><b>Adult</b></asp:Label>
                                <asp:DropDownList ID="ddlAdult" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvRooms" ControlToValidate="ddlAdult" runat="server" ForeColor="Red" InitialValue="0" ErrorMessage="Select Adult" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <asp:PlaceHolder runat="server" ID="ctrlPlaceholder"></asp:PlaceHolder>
                            <!--1st Person-->
                            <div class="form-group col-md-3">
                                <asp:Label ID="lblAdultsal1" class="control-label" runat="server" Text="Salutation"><b>Salutation</b></asp:Label>
                                <asp:DropDownList ID="ddlAdultSalutation1" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Mr" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Mrs" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group col-md-5">
                                <asp:Label ID="lblAdultFN1" class="control-label" runat="server" Text="First Name"><b>First Name</b></asp:Label>
                                <asp:TextBox ID="txtAdultFN1" class="form-control"  runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-4">
                                <asp:Label ID="lblAdultLN1" class="control-label" runat="server" Text="Last Name"><b>Last Name</b></asp:Label>
                                <asp:TextBox ID="txtAdultLN1" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <!--2nd row-->
                            <div class="form-group col-md-3">
                                <asp:Label ID="lblAdultsal2" class="control-label" runat="server" Text="Salutation"><b>Salutation</b></asp:Label>
                                <asp:DropDownList ID="ddlAdultSalutation2" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Mr" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Mrs" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group col-md-5">
                                <asp:Label ID="lblAdultFn2" class="control-label" runat="server" Text="First Name"><b>First Name</b></asp:Label>
                                <asp:TextBox ID="txtAdultFN2" class="form-control"  runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-4">
                                <asp:Label ID="lblAdultLN2" class="control-label" runat="server" Text="Last Name"><b>Last Name</b></asp:Label>
                                <asp:TextBox ID="txtAdultLN2" class="form-control"  runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <!--Child Part-->
                        <div class="col-md-5">
                            <div class="form-group col-md-12">
                                <asp:Label ID="lblChild" CssClass="control-label" runat="server" Text="Room 1"><b>Child</b></asp:Label>
                                <asp:DropDownList ID="ddlChild" CssClass="form-control" AutoPostBack="false" runat="server">
                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvChild" ControlToValidate="ddlChild" runat="server" ForeColor="Red" InitialValue="0" ErrorMessage="Select Child " Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <asp:PlaceHolder runat="server" ID="CtrlPlaceHolder2"></asp:PlaceHolder>

                            <!--1st Person-->
                            <div class="form-group col-md-3">
                                <asp:Label ID="lblChildAge1" class="control-label" runat="server" Text="Age"><b>Age</b></asp:Label>
                                <asp:DropDownList ID="ddlChildAge1" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group col-md-5">
                                <asp:Label ID="lblChildFName1" class="control-label" runat="server" Text="Last Name"><b>First Name</b></asp:Label>
                                <asp:TextBox ID="txtChildFName1" class="form-control"  runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-4">
                                <asp:Label ID="lblChildLName1" class="control-label" runat="server" Text="Last Name"><b>Last Name</b></asp:Label>
                                <asp:TextBox ID="txtChildLName1" class="form-control"  runat="server"></asp:TextBox>
                            </div>
                            <!--2nd row-->
                            <div class="form-group col-md-3">
                                <asp:Label ID="lblChildAge2" class="control-label" runat="server" Text="Age"><b>Age</b></asp:Label>
                                <asp:DropDownList ID="ddlChildAge2" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group col-md-5">
                                <asp:Label ID="lblChildFName2" class="control-label" runat="server" Text="Last Name"><b>First Name</b></asp:Label>
                                <asp:TextBox ID="txtChildFName2" class="form-control"  runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-4">
                                <asp:Label ID="lblChildLName2" class="control-label" runat="server" Text="Last Name"><b>Last Name</b></asp:Label>
                                <asp:TextBox ID="txtChildLName2" class="form-control"  runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="CtrlPlaceHolder3"></asp:PlaceHolder>
                    <!-- End Room 1-->
                    <div class="form-group row">
                        <div class="col-md-12">
                            <asp:Label ID="lblPH" CssClass="control-label col-sm-2" runat="server" Text="Prefered Hotels"><b>Prefered Hotels :</b></asp:Label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtPH" TextMode="MultiLine" Width="500px" Height="100px" Style="resize: none" runat="server"></asp:TextBox>
                                <%--<textarea type="text" class="form-control" rows="5"></textarea>--%>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-12">
                            <asp:Label ID="lblSightseeing" CssClass="control-label col-sm-2" runat="server" Text="Sightseeing"><b>Sightseeing :</b></asp:Label>
                            <div class="col-sm-5">
                                <asp:DropDownList ID="ddlSightSeeing" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvsightseeing" ControlToValidate="ddlSightSeeing" runat="server" ForeColor="Red" InitialValue="0" ErrorMessage="Select Sightseeing " Display="Dynamic"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="button pull-right">
                            <asp:Button ID="btnSubmit" CssClass="btn btn-success" runat="server" Text="Submit" Style="width: 100px;" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnBack" CssClass="btn btn-danger" CausesValidation="false" PostBackUrl="OfflineRequests.aspx" runat="server" Text="Back" Style="width: 100px;" OnClick="btnBack_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.box-body -->
            <!-- /.row -->
        </section>

</asp:Content>
