<%@ Page Title="Registrarse" Language="C#" MasterPageFile="~/AdministradorSistema/SiteManager.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SistemaEquivalencias.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div id="container" class="clear"> 
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <asp:Panel runat="server" ID="Pnl_FormRegister" CssClass="panel panel-default">
         <div class="panel-heading">
             <div class="panel-title text-center"><b>REGISTRO DE USUARIO</b></div>
             </div>
        <div class="panel-body">
    <div class="form-horizontal">
        <h4>Crear una nueva cuenta</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-4 control-label">Nombre de Usuario</asp:Label>
            <div class="col-md-4">
                <asp:TextBox runat="server" ID="UserName" CssClass="form-control" placeholder="Nombre de Usuario"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                    CssClass="text-danger" ErrorMessage="El campo de correo electrónico es obligatorio." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-4 control-label">Correo electrónico</asp:Label>
            <div class="col-md-4">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" placeholder="Correo Eléctronico"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="El campo de correo electrónico es obligatorio." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-4 control-label">Contraseña</asp:Label>
            <div class="col-md-4">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" placeholder="Contraseña de Usuario"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="El campo de contraseña es obligatorio." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-4 control-label">Confirmar contraseña</asp:Label>
            <div class="col-md-4">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" placeholder="Confirmación de contraseña" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="El campo de confirmación de contraseña es obligatorio." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="La contraseña y la contraseña de confirmación no coinciden." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-4 col-md-4">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Registrarse" CssClass="btn btn-default" ToolTip="Guardar nuevo usuario" />
            </div>
        </div>
    </div>
            </div>
    </asp:Panel>
        <center>
        <%--Panel de confirmacion de registro de nuevo usuario--%>
        <asp:Panel ID="Pnl_Confirmacion" runat="server" CssClass="panel panel-success" Width="350" Height="150" Visible="false">
            <div class="panel-heading">
                <div class="panel-title text-center"><b>EXITO!!</b></div>
            </div>
            <div class="panel-body text-center">
                <span class="icon-ok-circled"></span> <asp:Label ID="Lbl_Success" CssClass="" runat="server" Text="Se ha registrado con Exito!" ForeColor="Green"></asp:Label>
                <br/>
                <br/>
                <asp:Button runat="server" ID="Btn_OKSuccess" CssClass="btn btn-success" Text="OK" Tooltip="confirmación" OnClick="Btn_OKSuccess_Click"/>

            </div>
        </asp:Panel>
        </center>
        </div>
    
</asp:Content>
