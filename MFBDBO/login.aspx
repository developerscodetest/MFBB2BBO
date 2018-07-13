<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="MFBDBO.login" EnableEventValidation="false" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="theme-color" content="#000000">
    <meta name="msapplication-navbutton-color" content="#000000">
    <meta name="apple-mobile-web-app-status-bar-style" content="#000000">
    <meta name="keywords" content="">
    <title>MFBDBO :: Login</title>
    <!--Css Links-->
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

    <style>
        .main {
            margin-top: 200px;
        }

        h3.title {
            font-size: 25px;
            font-weight: 500;
            color: #222;
        }

        hr {
            width: 100%;
            color: #fff;
        }

        .input-group-addon {
            padding: 6px 12px;
            font-size: 14px;
            font-weight: normal;
            line-height: 1;
            text-align: center;
            border: 1px solid #ccc;
            border-radius: 4px;
            color: #636363;
        }

        .form-group {
            margin-bottom: 15px;
        }

        input,
        input::-webkit-input-placeholder {
            font-size: 14px;
            padding-top: 3px;
        }

        .main-login {
            background-color: #fff;
            -moz-border-radius: 2px;
            -webkit-border-radius: 2px;
            border-radius: 2px;
            -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        }

        .main-center {
            margin-top: 30px;
            margin: 0 auto;
            max-width: 310px;
            padding: 0px 20px;
            border: 1px solid #ddd;
            border-top: 2px solid #1a99e4;
        }
    </style>
    <script type="text/javascript">
        function alertMessage(text) {
            alert(text);
        }
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function openModal() {
            $('#myModal').modal('show');
            $('.myModal').modal();
            console.log('hello');
        }
    </script>
</head>
<body class="hold-transition login-page" style="background: url(../dist/img/pexels-photo-518244.jpeg)  left center / cover no-repeat fixed; background-size: cover; overflow-y: hidden">
    <form id="form1" runat="server">

        <!--Forgot Password-->
      <%--  <div class="modal fade" id="myModal" role="dialog" data-keyboard="false" data-backdrop="static">--%>
    <div class="modal fade myModal" id="myModal" tabindex="0" role="dialog" aria-labelledby="myModalLabel">
            <%--<div class="modal fade" id="myModal" role="dialog">--%>
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="col-md-2 col-md-offset-2">
                    <div class="modal-content" style="width: 400px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title" style="text-align: center;">Forgot Password</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                        <asp:TextBox ID="txtEmailID" ValidationGroup="Forgot" class="form-control" placeholder="Enter Your Email ID" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator
                                        ID="rfvEmail" ValidationGroup="Forgot" runat="server" ErrorMessage="Please Enter Your Email ID"
                                        Display="Dynamic" SetFocusOnError="true" ForeColor="Red"
                                        ControlToValidate="txtEmailID"></asp:RequiredFieldValidator>
                                </div>
                                <div class="cols-sm-12">
                                    <asp:Label ID="lblMessage" Visible="false" runat="server"><span style="color:green">Reset password link sent to your mail please check.</span></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="col-md-12 col-sm-12">
                                <asp:Button ID="btnSubmit" ValidationGroup="Forgot" class="btn btn-primary" Style="width: 100px;" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                <%-- <asp:Button ID="btnClose" ValidationGroup="Forgot" class="btn btn-danger" data-dismiss="modal" Style="width: 100px;" runat="server" Text="Close" />--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row main">
                <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-8">
                    <div class="main-login main-center">
                        <div class="panel-title text-center">
                            <h3 class="title">Login</h3>
                            <hr />
                        </div>
                       
                            <div class="form-group">
                                <%--  <asp:Label ID="lblUsername" class="cols-sm-2 control-label" runat="server" Text="Username"></asp:Label>--%>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                        <asp:TextBox ID="txtUsername" ValidationGroup="Login" class="form-control" placeholder="Username" runat="server"></asp:TextBox>

                                    </div>
                                    <asp:RequiredFieldValidator
                                        ID="rfvUsername" ValidationGroup="Login" runat="server" ErrorMessage="Please Enter Username"
                                        Display="Dynamic" SetFocusOnError="true" ForeColor="Red"
                                        ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <%-- <asp:Label ID="lblPassword" class="cols-sm-2 control-label" runat="server" Text="Password"></asp:Label>--%>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                        <asp:TextBox ID="txtPassword" ValidationGroup="Login" class="form-control" placeholder="Password" runat="server"></asp:TextBox>

                                    </div>
                                    <asp:RequiredFieldValidator
                                        ID="rfvPwd" ValidationGroup="Login" runat="server" ErrorMessage="Please Enter Password"
                                        Display="Dynamic" SetFocusOnError="true" ForeColor="Red"
                                        ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-6 col-sm-12">
                                    <asp:Button ID="btnSave" ValidationGroup="Login" CssClass="btn btn-primary" runat="server" Text="Login" Style="width: 100%;" OnClick="btnLogin_Click" />
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <asp:Button ID="btnReset" ValidationGroup="Login" CssClass="btn btn-danger" runat="server" Text="Reset" Style="width: 100%;" CausesValidation="false" OnClick="btnReset_Click" />
                                </div>
                            </div>

                            <div class="form-group">
                                <span style="line-height: 30px;">Forgot password ? <a href="#" data-toggle="modal" data-target="#myModal">Click Here</a></span>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!--Js links-->
    
    <script>
        //$(document).ready(function () {
        //    $('.myModal').modal();
        //});
    </script>

</body>
</html>
