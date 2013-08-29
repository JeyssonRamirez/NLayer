﻿// -----------------------------------------------------------------------
// <copyright file="Registrarse.aspx.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
// -----------------------------------------------------------------------

using System;
using System.Web.Security;
using System.Web.UI;

namespace Sci.Nlayer.Presentacion.AspNet.Administracion.Cuentas
{
    public partial class Registrarse : Page
    {
        protected void CreatedUser(object sender, EventArgs e)
        {
            string userName = CreateUserWizard1.UserName;
            Roles.AddUserToRole(userName, "REGISTRADO");
            FormsAuthentication.SetAuthCookie(userName, false);
            string continueUrl = CreateUserWizard1.ContinueDestinationPageUrl;
            if (String.IsNullOrEmpty(continueUrl))
            {
                continueUrl = "~/";
            }
            Response.Redirect(continueUrl);
        }
    }
}