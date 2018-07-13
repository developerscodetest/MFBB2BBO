<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="SupplierEdit.aspx.cs" Inherits="MFBDBO.Master.SupplierEdit" %>
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
            <h1>Supplier Edit</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
               <li class="#">Supplier List</li>
                <li class="active">Supplier Edit</li>
            </ol>
        </section>

        <section class="content">
        <div class="box">
            <div class="row">
                <div class="col-xs-12">
                    <!--Supplier Details--->
                      <div class="box-header with-border">
                            <h4 class="box-title">Supplier Details</h4>
                        </div>
                    <div class="box-body">
                        <div class="form-group row">
                            <div class="col-md-4">
                                <asp:Label ID="lblSupplier" CssClass="control-label" runat="server" Text="Supplier"><b>Supplier : </b></asp:Label>
                                <asp:TextBox ID="txtSupplier" CssClass="form-control" placeholder="Enter Supplier" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvSupplier" runat="server" ErrorMessage="Supplier Name is Required " ForeColor="Red" ControlToValidate="txtSupplier" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revSupplier" runat="server" ErrorMessage="Enter Valid Supplier  " ForeColor="Red" ControlToValidate="txtSupplier" ValidationExpression="[a-zA-Z 0-9 %*#!@$& ]*$" Display="Dynamic"></asp:RegularExpressionValidator>                              
                            </div>
                            <div class="col-md-4">
                             <asp:Label ID="lblName" CssClass="control-label" runat="server" Text="Name"><b>Name :</b></asp:Label>                           
                             <asp:TextBox ID="txtName" placeholder="Enter Name" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is Required" ForeColor="Red" ControlToValidate="txtName" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revName" runat="server" ErrorMessage="Name Must be Alphabets" ForeColor="Red" ControlToValidate="txtName" ValidationExpression="[a-zA-Z 0-9%*#!@$& ]*$" Display="Dynamic"></asp:RegularExpressionValidator>                                                                                         
                            </div>

                              <div class="col-md-4">
                             <asp:Label ID="lblEmail" CssClass="control-label" runat="server" Text="Email"><b>Email :</b></asp:Label>                         
                            <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Enter Email" runat="server"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="rfvmail" runat="server" ErrorMessage="Email is Required" ForeColor="Red" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revmail" runat="server" ErrorMessage="Enter Valid Email" ForeColor="Red" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>                       
                            </div>
                        </div>
                       <div class="clearfix"></div>
                        <div class="form-group row">
                            <div class="col-md-4">
                                 <asp:Label ID="lblMobile" CssClass="control-label" runat="server" Text="Mobile No"><b>Mobile No :</b></asp:Label>               
                             <asp:TextBox ID="txtMobile" placeholder="Enter Mobile No" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvMobileNo" runat="server" ErrorMessage="Mobile No is Required" ControlToValidate="txtMobile" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revMobileNo" runat="server" ErrorMessage="Mobile No Must be Numbers And 10 Digits" ForeColor="Red" ControlToValidate="txtMobile" ValidationExpression="^[0-9]{10}$" Display="Dynamic"></asp:RegularExpressionValidator>                                                    
                            </div>
                       
                         <div class="col-md-8">
                                    <asp:Label ID="lblAddress" CssClass="control-label" runat="server" Text="Address"><b>Address :</b></asp:Label>
                                     <asp:TextBox ID="txtAddress"  style="resize:none;" class="form-control"  runat="server"  TextMode="MultiLine"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Address is Required" ForeColor="Red" ControlToValidate="txtAddress" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                             </div>
                        <div class="clearfix"></div>
                        
                        </div>
                          <div class="clearfix"></div>

                      <!--API Details-->
                        <div class="box-header with-border">
                            <h4 class="box-title">API Details</h4>
                        </div>
                        <div class="box-body">
                            <div class="form-group row">
                                 <div class="col-md-4">
                              <asp:Label ID="lblAPIPurchaseDate" CssClass="control-label" runat="server" Text="API Purchase Date"><b>Api Purchase Date :</b></asp:Label>                              
                              <div class="input-group date">
                                  <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" BehaviorID="txtCheckInDate_CalendarExtender" TargetControlID="txtAPDate" />
                                <asp:TextBox ID="txtAPDate"  CssClass="form-control" placeholder="Enter Cheque Date" runat="server"></asp:TextBox>
                                <%--<asp:TextBox ID="txtAPDate" type="date" CssClass="form-control" runat="server" ></asp:TextBox>--%>  
                                  <%--Text='<%# Convert.ToDateTime(Eval("dateTime")).ToString("d") %>'--%>                                  
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                  </div>
                                      <asp:RequiredFieldValidator ID="rfvAPIDate" runat="server" ErrorMessage="Date is Required" ForeColor="Red" ControlToValidate="txtAPDate" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-4">
                                 <asp:Label ID="lblAPIKey" CssClass="control-label" runat="server" Text="API Key"><b>API Key :</b></asp:Label>               
                             <asp:TextBox ID="txtAPIKey" placeholder="Enter API Key" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvAPIKey" runat="server" ErrorMessage="API Key is Required" ControlToValidate="txtAPIKey" ForeColor="Red" Display="Dynamic" ></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revAPIKey" runat="server"  ErrorMessage="Enter Valid API Key" ControlToValidate="txtAPIKey" ValidationExpression="[a-zA-Z 0-9 %*#!@$& ]*$"  ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>                                                    
                            </div>
                                 <div class="col-md-4">
                                 <asp:Label ID="lblAPValue" CssClass="control-label" runat="server" Text="API Purchase Value"><b>API Purchase Value :</b></asp:Label>               
                             <asp:TextBox ID="txtAPValue" placeholder="Enter API Purchase Value" CssClass="form-control" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="rfvAPValue" runat="server" ErrorMessage="API Value is Required" ControlToValidate="txtAPValue" ForeColor="Red" Display="Dynamic" ></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revAPValue" runat="server"  ErrorMessage="Enter Valid API Value" ControlToValidate="txtAPValue" ValidationExpression="^[1-9]\d*(\.\d+)?$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>                                                    
                            </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                            <!--Access Details-->
                        <div class="box-header with-border">
                            <h4 class="box-title">Access Details</h4>
                        </div>
                        <div class="box-body">
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <asp:Label ID="lblALink" CssClass="control-label" runat="server" Text="Agent Link"><b>Agent Link :</b></asp:Label>
                                     <asp:TextBox ID="txtALink" placeholder="Enter Agent Link" CssClass="form-control" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="rfvALink" runat="server" ErrorMessage="Agent Link Required" ForeColor="Red" ControlToValidate="txtALink" Display="Dynamic"></asp:RequiredFieldValidator>
                                     <asp:RegularExpressionValidator ID="revALink" runat="server" ErrorMessage="Enter Valid Agent Link" ForeColor="Red" ControlToValidate="txtALink" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" Display="Dynamic"></asp:RegularExpressionValidator>
                                    
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblACode" CssClass="control-label" runat="server" Text="Agent Code"><b>Supplier Code :</b></asp:Label>
                                    <asp:TextBox ID="txtSupplierCode" placeholder="Enter Agent Code" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvSCode" runat="server" ErrorMessage="Agent Code is Required" ForeColor="Red" ControlToValidate="txtSupplierCode" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="refSCode" runat="server" ErrorMessage="Enter Valid Agent Code" ForeColor="Red" ControlToValidate="txtSupplierCode" ValidationExpression="[a-zA-Z 0-9 %*#!@$& ]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblUserName" CssClass="control-label" runat="server" Text="Username"><b>Username :</b></asp:Label>
                                    <asp:TextBox ID="txtUserName" placeholder="Enter Username" CssClass="form-control" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="rfvUN" runat="server" ErrorMessage="User Name is Required" ForeColor="Red" ControlToValidate="txtUserName" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revUN" runat="server" ErrorMessage="User Name Must be Alphabets" ForeColor="Red" ControlToValidate="txtUserName" ValidationExpression="[a-zA-Z 0-9 %*#!@$& ]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                             <div class="form-group row">
                                <div class="col-md-4">
                                    <asp:Label ID="lblPassword" CssClass="control-label" runat="server" Text="Password"><b>Password:</b></asp:Label>
                                     <asp:TextBox ID="txtPassword" placeholder="Enter Password" CssClass="form-control" runat="server" ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPswd" runat="server" ErrorMessage="Password is Required" ForeColor="Red" ControlToValidate="txtPassword" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revPswd" runat="server" ErrorMessage="Enter Valid Password" ForeColor="Red" ControlToValidate="txtPassword" ValidationExpression="[a-zA-Z 0-9 %*#!@$& ]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                                   <div class="clearfix"></div>
                            </div>
                        </div>
                        <!--Contact Details--->
                        <div class="box-header with-border">
                      <h3 class="box-title">Contact Details</h3>
                        </div>
                      <div class="box-body">
                       <div class="form-group row">
                            <div class="col-md-4">
                                <asp:Label ID="lblAccounts" CssClass="control-label" runat="server" Text="Accounts"><b>Accounts :</b></asp:Label>                           
                             <asp:TextBox ID="txtAccounts" placeholder="Enter Name" CssClass="form-control" runat="server"></asp:TextBox>
                                <%--<asp:RequiredFieldValidator ID="rfvAccounts" runat="server" ErrorMessage="Accounts is Required" ForeColor="Red" ControlToValidate="txtAccounts" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revAccounts" runat="server" ErrorMessage="Enter Accounts"  ForeColor="Red" ValidationExpression="^[a-zA-Z'.\s]{1,100}$" ControlToValidate="txtAccounts" Display="Dynamic"></asp:RegularExpressionValidator>         --%>                                                                               
                            </div>
                             <div class="col-md-4">
                            <asp:Label ID="lblOperations" CssClass="control-label" runat="server" Text="Operations"><b>Operations :</b></asp:Label>                         
                            <asp:TextBox ID="txtOperationsName" placeholder="Enter Name" CssClass="form-control"  runat="server"></asp:TextBox>
                                 <%--<asp:RequiredFieldValidator ID="rfvOName" runat="server" ErrorMessage="Accounts is Required" ForeColor="Red" ControlToValidate="txtOperationsName" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revOName" runat="server" ErrorMessage="Enter Accounts"  ForeColor="Red" ValidationExpression="^[a-zA-Z'.\s]{1,100}$" ControlToValidate="txtOperationsName" Display="Dynamic"></asp:RegularExpressionValidator>--%> 
                                                        
                            </div>
                              <div class="col-md-4">
                                 <asp:Label ID="lblManagement" CssClass="control-label" runat="server" Text="Management"><b>Management :</b></asp:Label>               
                             <asp:TextBox ID="txtManagementName" placeholder="Enter Name" CssClass="form-control" runat="server"></asp:TextBox>
                                  <%--<asp:RequiredFieldValidator ID="rfvMName" runat="server" ErrorMessage="Accounts is Required" ForeColor="Red" ControlToValidate="txtManagementName" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revMName" runat="server" ErrorMessage="Enter Accounts"  ForeColor="Red" ValidationExpression="^[a-zA-Z'.\s]{1,100}$" ControlToValidate="txtManagementName" Display="Dynamic"></asp:RegularExpressionValidator>--%>                                                    
                            </div>
                           <div class="col-md-1"></div>
                        </div>
                        <div class="clearfix"></div>

                       <div class="form-group row">
                            <div class="col-md-4">
                             <asp:TextBox ID="txtAEmail" placeholder="Enter Email" CssClass="form-control" runat="server"></asp:TextBox>
                                 <%--<asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is Required" ForeColor="Red" ControlToValidate="txtAEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Enter Valid Email" ForeColor="Red" ControlToValidate="txtAEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator> --%>                                                                                       
                            </div>
                             <div class="col-md-4">
                            <asp:TextBox ID="txtOEmail" placeholder="Enter Email" CssClass="form-control"  runat="server"></asp:TextBox>
                                <%-- <asp:RequiredFieldValidator ID="rfvOEmail" runat="server" ErrorMessage="Email is Required" ForeColor="Red" ControlToValidate="txtOEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revOEmail" runat="server" ErrorMessage="Enter Valid Email" ForeColor="Red" ControlToValidate="txtOEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>   --%>                    
                            </div>
                              <div class="col-md-4">
                             <asp:TextBox ID="txtMEmail" placeholder="Enter Email" CssClass="form-control" runat="server"></asp:TextBox>
                                 <%-- <asp:RequiredFieldValidator ID="rfvMEmail" runat="server" ErrorMessage="Email is Required" ForeColor="Red" ControlToValidate="txtMEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revMEmail" runat="server" ErrorMessage="Enter Valid Email" ForeColor="Red" ControlToValidate="txtMEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator> --%>                                                   
                            </div>
                        </div>
                        <div class="clearfix"></div>
                         <div class="form-group row">
                            <div class="col-md-4">
                             <asp:TextBox ID="txtANumber" placeholder="Enter Number" CssClass="form-control" runat="server"></asp:TextBox>
                                <%--<asp:RequiredFieldValidator ID="rfvANumber" runat="server" ErrorMessage="Mobile No is required" ControlToValidate="txtANumber" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revANumber" runat="server" ErrorMessage="Mobile No contains 10 digits" ForeColor="Red" ControlToValidate="txtANumber" ValidationExpression="[0-9]{10}"  Display="Dynamic"></asp:RegularExpressionValidator>     --%>                                                                                   
                            </div>
                             <div class="col-md-4">
                             <asp:TextBox ID="txtONumber" placeholder="Enter Number" CssClass="form-control" runat="server"></asp:TextBox>
                                 <%--<asp:RequiredFieldValidator ID="rfvONumber" runat="server" ErrorMessage="Mobile No is Required" ControlToValidate="txtONumber" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revONumber" runat="server" ErrorMessage="Mobile No contains 10 digits" ForeColor="Red" ControlToValidate="txtONumber" ValidationExpression="[0-9]{10}"  Display="Dynamic"></asp:RegularExpressionValidator>                                                    --%>
                            </div>
                              <div class="col-md-4">
                             <asp:TextBox ID="txtMNumber" placeholder="Enter Number" CssClass="form-control" runat="server"></asp:TextBox>
                                  <%--<asp:RequiredFieldValidator ID="rfvMNumber" runat="server" ErrorMessage="Mobile No is Required" ControlToValidate="txtMNumber" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revMNumber" runat="server" ErrorMessage="Mobile No contains 10 digits" ForeColor="Red" ControlToValidate="txtMNumber" ValidationExpression="[0-9]{10}"  Display="Dynamic"></asp:RegularExpressionValidator>                                                    --%>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                          <!--Buttons--->
                          <div style="text-align: right">
                            <asp:Button ID="btnUpdate" CssClass="btn btn-primary" runat="server" Text="Update" Style="width: 100px;" OnClick="BtnUpdate_Click" />                         
                            <asp:Button ID="btnBack" CssClass="btn btn-danger" PostBackUrl="SuppliersList.aspx" runat="server" CausesValidation="false" Text="Back" style="width: 90px" />                                                                                          
                            <asp:HiddenField ID="hdnSupplierID" runat="server" />
                            <%--<asp:HiddenField ID="hdnAddress" runat="server" />                            
                            <asp:HiddenField ID="hdnAgentLink" runat="server" />
                            <asp:HiddenField ID="hdnAgentCode" runat="server" />
                            <asp:HiddenField ID="hdnUserName" runat="server" />
                            <asp:HiddenField ID="hdnPassword" runat="server" />--%>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>


       
    
</asp:Content>
