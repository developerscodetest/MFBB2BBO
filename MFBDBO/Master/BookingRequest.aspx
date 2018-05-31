<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="BookingRequest.aspx.cs" Inherits="MFBDBO.Master.OfflineRequestView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminPlaceHolder" runat="server">
      <form runat="server">
        <section class="content-header">
            <h1>Booking Request</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Booking Request</li>
            </ol>
        </section>
          <section class="content">
            <!-- SELECT2 EXAMPLE -->
            <div class="box box-default">
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <!--Begin Form-->
                            <form class="form-horizontal">
                                <!--1st Row-->
                                <div class="form-group row">
                                    <div class="col-md-6">
                                        <asp:Label ID="lblCompany" class="control-label col-sm-3" runat="server" Text="Company"><b>Company : </b> <span style="color:red;">*</span></asp:Label>
                                        <div class="col-sm-9">
                                            <select class="form-control">
                                                <option>--Select--</option>
                                                <option>1</option>
                                                <option>2</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <!--2nd  Row-->
                                <div class="form-group row">
                                    <div class="col-md-6">
                                        <asp:Label ID="lblDestination" class="control-label col-sm-3" runat="server" Text="Destination"><b>Destination : </b> <span style="color:red;">*</span></asp:Label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtDest" placeholder="Enter Destination" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="lblNationality" class="control-label col-sm-3" runat="server" Text="Nationality"><b>Nationality : </b> <span style="color:red;">*</span></asp:Label>
                                        <div class="col-sm-9">
                                            <select class="form-control">
                                                <option>India</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <!--3rd  Row-->
                                <div class="form-group row">
                                    <div class="col-md-6">
                                        <asp:Label ID="lblCheckInDate" class="control-label col-sm-3" runat="server" Text="Check-In Date"><b>Check-In : </b></asp:Label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtDate" type="date" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="lblCheckOutDate" class="control-label col-sm-3" runat="server" Text="Check-Out Date"><b>Check-Out : </b></asp:Label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtCheckOutDate" type="date" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!--End Form-->

                            <hr />
                            <!-- Begin Form 2-->
                            <form>
                                <!-- Begin Room 1-->
                                <!--1st Row-->
                                <div class="row">
                                    <div class="form-group col-md-1" style="margin-top: 30px; margin-left: 30px;">
                                        <asp:Label ID="lblRoom" class="control-label" runat="server" Text="Room 1"><b>Room 1 : </b></asp:Label>
                                    </div>
                                    <div class="form-group col-md-5">
                                        <label>Adult</label>
                                        <select class="form-control">
                                            <option>--Select--</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                            <option>6</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-5">
                                        <asp:Label ID="lblChild" class="control-label" runat="server" Text="Room 1"><b>Child</b></asp:Label>
                                        <select class="form-control">
                                            <option>--Select--</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                            <option>6</option>
                                        </select>
                                    </div>
                                </div>
                                <!--2nd row-->
                                <div class="row">
                                    <div class="form-group col-md-1" style="margin-left: 30px;"></div>
                                    <div class="form-group col-md-1">
                                        <asp:Label ID="lblSlt" class="control-label" runat="server" Text="Salutation"><b>Salutation</b></asp:Label>
                                        <select class="form-control" style="padding-left: 0px !important">
                                            <option>Mr</option>
                                            <option>Miss</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-2">
                                        <asp:Label ID="lblFN" class="control-label" runat="server" Text="First Name"><b>First Name</b></asp:Label>
                                        <asp:TextBox ID="txtFN" class="form-control" required="" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-2">
                                        <asp:Label ID="lblLN" class="control-label" runat="server" Text="Last Name"><b>Last Name</b></asp:Label>
                                        <asp:TextBox ID="txtLN" class="form-control" required="" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-1">
                                        <label>Age</label>
                                        <select class="form-control">
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                            <option>6</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-2">
                                        <asp:Label ID="lblFName" class="control-label" runat="server" Text="Last Name"><b>First Name</b></asp:Label>
                                        <asp:TextBox ID="txtFName" class="form-control" required="" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-2">
                                        <asp:Label ID="lblLName" class="control-label" runat="server" Text="Last Name"><b>Last Name</b></asp:Label>
                                        <asp:TextBox ID="txtLName" class="form-control" required="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- End Room 1-->
                                <!--2nd Row-->
                                <div class="row">
                                    <div class="form-group col-md-3 col-md-push-5">
                                        <asp:Label ID="lblAdd" class="btn btn-success fa fa-plus-circle" Style="width: 90px;" runat="server" Text="Add"><b> Add</b></asp:Label>
                                        <asp:Label ID="lblRemove" class="btn btn-danger fa fa-minus-circle" Style="width: 90px;" runat="server" Text="Remove"><b> Remove</b></asp:Label>
                                    </div>
                                </div>

                                <hr />
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <asp:Label ID="lblPH" class="control-label col-sm-2" runat="server" Text="Prefered Hotels"><b>Prefered Hotels :</b></asp:Label>
                                        <div class="col-sm-10">
                                            <textarea type="text" class="form-control" rows="5"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <asp:Label ID="lblSightseeing" class="control-label col-sm-2" runat="server" Text="Sightseeing"><b>Sightseeing :</b></asp:Label>
                                        <div class="col-sm-5">
                                            <select class="form-control" style="font-style: italic">
                                                <option>--Select--</option>
                                                <option>1</option>
                                                <option>2</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- End Form 2-->
                            <div class="button pull-right">
                                <asp:Button ID="btnSubmit" class="btn btn-success" runat="server" Text="Submit" Style="width: 100px;" />
                                <asp:Button ID="btnBack" class="btn btn-danger" PostBackUrl="OfflineRequests.aspx" runat="server" Text="Back" Style="width: 100px;" />
                            </div>


                        </div>
                    </div>
                </div>
                <!-- /.box-body -->

            </div>
            <!-- /.box -->
            <!-- /.row -->
        </section>
          </form>

</asp:Content>
