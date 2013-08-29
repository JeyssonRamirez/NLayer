// -----------------------------------------------------------------------
// <copyright file="ErrorServicio.cs" company="Nlayer Software">
//     Copyright (c) Nlayer Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// -----------------------------------------------------------------------

using System.Runtime.Serialization;

namespace Nlayer.Nlayer.ServiciosDistribuidos.Nucleo.ManejoDeErrores
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