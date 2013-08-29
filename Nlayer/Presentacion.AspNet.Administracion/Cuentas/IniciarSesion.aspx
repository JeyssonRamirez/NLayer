<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="IniciarSesion.aspx.cs" Inherits="Sci.Nlayer.Presentacion.AspNet.Administracion.Cuentas.IniciarSesion" %>

<asp:Content ID="header" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="main" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManagerProxy ID="scriptManagerProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Login ID="Login1" runat="server" MembershipProvider="SCIMembershipProvider"
                FailureText="Su intento de conexión no se ha realizado correctamente. Por favor, inténtalo de nuevo."
                LoginButtonText="Entrar" PasswordLabelText="contraseña:" PasswordRequiredErrorMessage="Se requiere contraseña."
                RememberMeText="Recordarme la próxima vez." TitleText="Entrar" UserNameLabelText="Nombre de Usuario:"
                UserNameRequiredErrorMessage="Nombre de usuario es requerido.">
            </asp:Login>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
