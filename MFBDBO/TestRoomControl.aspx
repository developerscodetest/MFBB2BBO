<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestRoomControl.aspx.cs" Inherits="MFBDBO.TestRoomControl" %>

<%@ Register Src="~/Master/Controls/DynamicRoom.ascx" TagPrefix="uc1" TagName="DynamicRoom" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:DynamicRoom runat="server" ID="DynamicRoom" />
        
    
    </div>
    </form>
</body>
</html>

