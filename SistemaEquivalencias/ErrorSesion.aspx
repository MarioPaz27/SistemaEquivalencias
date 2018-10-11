<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorSesion.aspx.cs" Inherits="SistemaEquivalencias.ErrorSesion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Página de Error - Equivalencias</title>
<link rel="Stylesheet" href="Content/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="layout/styles/layout.css" type="text/css" />
<script type="text/javascript" src="layout/scripts/jquery.min.js"></script>
<script type="text/javascript" src="layout/scripts/jquery.ui.min.js"></script>
<!-- Homepage Specific -->
<script type="text/javascript" src="layout/scripts/galleryviewthemes/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="layout/scripts/galleryviewthemes/jquery.timers.1.2.js"></script>
<script type="text/javascript" src="layout/scripts/galleryviewthemes/jquery.galleryview.2.1.1.min.js"></script>
<script type="text/javascript" src="layout/scripts/galleryviewthemes/jquery.galleryview.setup.js"></script>
<!-- / Homepage Specific -->
</head>
<body id="top">
    <form id="form1" runat="server">
    <div class="wrapper row3">
    <div id="container" align="center" class="clear">
        <asp:Panel ID="Pnl_MensajeError" runat="server" Width="600" CssClass="panel panel-danger">
            <div class="panel-heading">
                <div class="panel-title text-center"><b>Mensaje</b></div>
            </div>
                <br/>
                <asp:Label ID="Lbl_Mensaje" runat="server" Font-Size="24px  " Text=""></asp:Label>
                <br/>
                <br/>
                <asp:Button ID="Btn_Enviar" runat="server" Text="Aceptar" CssClass="btn btn-success" OnClick="Btn_Enviar_Click"/>
                <br/>
        </asp:Panel>
    </div>
    </div>
    </form>
</body>
</html>
