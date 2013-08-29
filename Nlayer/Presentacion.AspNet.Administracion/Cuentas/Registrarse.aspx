<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Registrarse.aspx.cs" Inherits="Nlayer.Nlayer.Presentacion.AspNet.Administracion.Cuentas.Registrarse" %>

<asp:Content ID="header" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="main" ContentPlaceHolderID="MainContent" runat="server">
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" MembershipProvider="NlayerMembershipProvider"
        OnCreatedUser="CreatedUser" AnswerLabelText="Respuesta de seguridad:" AnswerRequiredErrorMessage="Respuesta de seguridad es necesaria."
        CancelButtonText="Cancelar" CompleteSuccessText="Su cuenta ha sido creada con éxito."
        ConfirmPasswordCompareErrorMessage="La contraseña y la contraseña de confirmación deben coincidir."
        ConfirmPasswordLabelText="Confirmar contraseña:" ConfirmPasswordRequiredErrorMessage="Confirmar contraseña es necesaria."
        ContinueButtonText="Continuar" CreateUserButtonText="Crear Usuario" DuplicateEmailErrorMessage="La dirección de correo electrónico que ha introducido ya está en uso. Por favor, introduzca otra dirección de correo electrónico."
        DuplicateUserNameErrorMessage="Por favor, introduzca un nombre de usuario diferente."
        EmailRegularExpressionErrorMessage="Por favor ingrese un correo electrónico diferente."
        EmailRequiredErrorMessage="El correo electrónico es necesario." FinishCompleteButtonText="Terminar"
        FinishPreviousButtonText="Anterior" InvalidAnswerErrorMessage="Por favor, introduzca una respuesta de seguridad diferentes."
        InvalidEmailErrorMessage="Por favor, introduzca una dirección de correo electrónico válida."
        InvalidPasswordErrorMessage="Longitud mínima de la contraseña: {0}. Caracteres no alfanuméricos necesarios: {1}."
        InvalidQuestionErrorMessage="Por favor, introduzca una pregunta de seguridad diferentes."
        PasswordLabelText="Contraseña:" PasswordRegularExpressionErrorMessage="Por favor, introduzca una contraseña diferente."
        PasswordRequiredErrorMessage="Se requiere contraseña." QuestionLabelText="La pregunta de seguridad:"
        QuestionRequiredErrorMessage="La pregunta de seguridad es necesaria." StartNextButtonText="Siguiente"
        StepNextButtonText="Siguiente" StepPreviousButtonText="Anterior" UnknownErrorMessage="Su cuenta no se ha creado. Por favor, inténtalo de nuevo."
        UserNameLabelText="Nombre de Usuario:" UserNameRequiredErrorMessage="Nombre de usuario es requerido.">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
</asp:Content>
