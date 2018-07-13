<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DynamicRoom.ascx.cs" Inherits="MFBDBO.Master.Controls.DynamicRoom" %>
  <div class="row">
    <div class="form-group col-md-1" style="margin-top: 30px; margin-left: 30px;">
        <asp:Label ID="Label1" class="control-label" runat="server" Text="Room 1"><b>Room 1 : </b></asp:Label>
    </div>
          <div class="form-group col-md-5">
              <label>Adult</label>
               <asp:DropDownList ID="ddlAdult" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlAdult_SelectedIndexChanged">
                <asp:ListItem>--Select--</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
               </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvAdult" runat="server" ErrorMessage="Select Adult Room" ForeColor="Red" ControlToValidate="DDLAdult" InitialValue="--Select--" Display="Dynamic"></asp:RequiredFieldValidator>
         </div>
        <asp:PlaceHolder runat="server" ID="ctrlPlaceholder"></asp:PlaceHolder>
   </div>
        <div class="form-group col-md-5">
               <asp:Label ID="lblChild" class="control-label" runat="server" Text="Room 1"><b>Child</b></asp:Label>
                <asp:DropDownList ID="ddlChild" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlChild_SelectedIndexChanged">
                    <asp:ListItem>--Select--</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                </asp:DropDownList>
                      <asp:RequiredFieldValidator ID="rfvChild" runat="server" ErrorMessage="Select Child Room" ForeColor="Red" ControlToValidate="DDLChild" InitialValue="--Select--" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <asp:PlaceHolder runat="server" ID="CtrlPlaceHolder2"></asp:PlaceHolder>
          <hr />
                <asp:PlaceHolder runat="server" ID="CtrlPlaceHolder3"></asp:PlaceHolder>
        <div class="row">
            <div class="col-md-4 col-md-offset-6">
                <asp:Button ID="btnAdd" CssClass="btn btn-success btn-xs" runat="server" Text="Add" OnClick="btnAdd_Click" />
                <asp:Button ID="btnRemove" CssClass="btn btn-xs btn-danger" runat="server" Text="Remove" OnClick="btnRemove_Click" />
            </div>
        </div>
        <!-- End Room 1-->
        <!--2nd Row-->
        <div class="row">
        </div>
