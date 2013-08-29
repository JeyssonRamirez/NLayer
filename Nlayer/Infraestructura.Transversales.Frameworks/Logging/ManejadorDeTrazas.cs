// -----------------------------------------------------------------------
// <copyright file="ManejadorDeTrazas.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// -----------------------------------------------------------------------

using System;
using System.Diagnostics;
using System.Diagnostics.CodeAnalysis;
using System.Security;
using System.Security.Permissions;
using Sci.Nlayer.Infraestructura.Transversales.Logging;

namespace Sci.Nlayer.Infraestructura.Transversales.Frameworks.Logging
{
    public class ManejadorDeTrazas : IManejadorDeTrazas
    {
        #region Miembros

        private readonly TraceSource _traceSource;

        #endregion

        #region Constructor

        public ManejadorDeTrazas()
        {
            _traceSource = new TraceSource("SCINLayer");
        }

        #endregion

        #region Métodos Privados

        private void TrazaInterna(TraceEventType tipoDeEvento, string mensaje)
        {
            if (_traceSource != null)
            {
                try
                {
                    _traceSource.TraceEvent(tipoDeEvento, (int) tipoDeEvento, mensaje);
                }
                catch (SecurityException)
                {
                    // No se puede accesar al log, o no se poseen privilegios.
                }
            }
        }

        #endregion

        #region Métodos Públicos

        [SuppressMessage("Microsoft.Security", "CA2135:SecurityRuleSetLevel2MethodsShouldNotBeProtectedWithLinkDemandsFxCopRule"),
         SecurityPermission(SecurityAction.LinkDemand)]
        public void IniciarTrazaDeOperaciónLógica(string nombreDeLaOperación)
        {
            if (String.IsNullOrEmpty(nombreDeLaOperación))
            {
                throw new ArgumentNullException("nombreDeLaOperación", "Nombre de la operación no válida.");
            }

            Trace.CorrelationManager.ActivityId = Guid.NewGuid();
            Trace.CorrelationManager.StartLogicalOperation(nombreDeLaOperación);
        }

        [SuppressMessage("Microsoft.Security", "CA2135:SecurityRuleSetLevel2MethodsShouldNotBeProtectedWithLinkDemandsFxCopRule"),
         SecurityPermission(SecurityAction.LinkDemand)]
        public void DetenerTrazaDeOperaciónLógica()
        {
            try
            {
                Trace.CorrelationManager.StopLogicalOperation();
            }
            catch (InvalidOperationException)
            {
                // La pila está vacía.
            }
        }

        public void IniciarTraza()
        {
            TrazaInterna(TraceEventType.Start, "SE INICIA");
        }

        public void DetenerTraza()
        {
            TrazaInterna(TraceEventType.Stop, "SE DETIENE");
        }

        public void TrazarInformación(string mensaje)
        {
            if (mensaje == null)
            {
                throw new ArgumentNullException("mensaje");
            }

            TrazaInterna(TraceEventType.Information, mensaje);
        }

        public void TrazarAdvertencia(string mensaje)
        {
            if (mensaje == null)
            {
                throw new ArgumentNullException("mensaje");
            }

            TrazaInterna(TraceEventType.Warning, mensaje);
        }

        public void TrazarError(string mensaje)
        {
            if (mensaje == null)
            {
                throw new ArgumentNullException("mensaje");
            }

            TrazaInterna(TraceEventType.Error, mensaje);
        }

        public void TrazarCritico(string mensaje)
        {
            if (mensaje == null)
            {
                throw new ArgumentNullException("mensaje");
            }

            TrazaInterna(TraceEventType.Critical, mensaje);
        }

        #endregion
    }
}