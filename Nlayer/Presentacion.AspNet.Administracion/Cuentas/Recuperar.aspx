<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Recuperar.aspx.cs" Inherits="Sci.Nlayer.Presentacion.AspNet.Administracion.Cuentas.Recuperar" %>

<asp:Content ID="header" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="main" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManagerProxy ID="scriptManagerProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" MembershipProvider="SCIMembershipProvider"
                AnswerLabelText="Respuesta:" AnswerRequiredErrorMessage="Es necesario responder."
                GeneralFailureText="Su intento de recuperar la contraseña no se ha realizado correctamente. Por favor, inténtalo de nuevo."
                QuestionFailureText="Su respuesta no pudo ser verificada. Por favor, inténtalo de nuevo."
                QuestionInstructionText="Responder a la pregunta siguiente para recibir su contraseña."
                QuestionLabelText="Pregunta:" QuestionTitleText="Confirmación de la identidad"
                SubmitButtonText="Recuperar" SuccessText="Su contraseña ha sido enviada." UserNameFailureText="No hemos podido acceder a su información. Por favor, inténtalo de nuevo."
                UserNameInstructionText="Introduzca su nombre de usuario para recibir su contraseña."
                UserNameLabelText="Nombre de Usuario:" UserNameRequiredErrorMessage="Nombre de usuario es requerido."
                UserNameTitleText="¿Olvidó su contraseña?">
            </asp:PasswordRecovery>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
