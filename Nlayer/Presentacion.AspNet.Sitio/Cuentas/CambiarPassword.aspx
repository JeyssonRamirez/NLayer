<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CambiarPassword.aspx.cs" Inherits="Nlayer.Nlayer.Presentacion.AspNet.Sitio.Cuentas.CambiarPassword" %>
<asp:Content ID="header" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="main" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManagerProxy ID="scriptManagerProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ChangePassword ID="ChangePassword1" runat="server" MembershipProvider="NlayerMembershipProvider"
                CancelButtonText="Cancelar" ChangePasswordButtonText="Cambiar Contraseña" ChangePasswordFailureText="Contraseña incorrecta o Nueva Contraseña no válida. Nuevo mínimo longitud de la contraseña: {0}. Caracteres no alfanuméricos necesarios"
                ChangePasswordTitleText="Cambie su contraseña" ConfirmNewPasswordLabelText="Confirmar nueva contraseña:"
                ConfirmPasswordCompareErrorMessage="La Confirmar nueva contraseña debe coincidir con la entrada de la nueva contraseña."
                ConfirmPasswordRequiredErrorMessage="Confirmar nueva contraseña se requiere."
                ContinueButtonText="Continuar" NewPasswordLabelText="Nueva contraseña:" NewPasswordRegularExpressionErrorMessage="Por favor, introduzca una contraseña diferente."
                NewPasswordRequiredErrorMessage="Nueva contraseña se requiere." PasswordLabelText="Contraseña:"
                PasswordRequiredErrorMessage="Password is required.Se requiere contraseña." SuccessText="Su contraseña ha sido cambiada!"
                SuccessTitleText="Cambiar la contraseña completa" UserNameLabelText="Nombre de Usuario:"
                UserNameRequiredErrorMessage="Nombre de usuario es requerido.">
            </asp:ChangePassword>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>