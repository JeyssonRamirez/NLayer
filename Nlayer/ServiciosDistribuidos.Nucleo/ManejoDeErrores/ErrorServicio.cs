// -----------------------------------------------------------------------
// <copyright file="ErrorServicio.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// -----------------------------------------------------------------------

using System.Runtime.Serialization;

namespace Sci.Nlayer.ServiciosDistribuidos.Nucleo.ManejoDeErrores
{
    [DataContract]
    public class ErrorServicio
    {
        public ErrorServicio(string mensajedeError)
        {
            MensajeDeError = mensajedeError;
        }

        [DataMember]
        public string MensajeDeError { get; set; }
    }
}