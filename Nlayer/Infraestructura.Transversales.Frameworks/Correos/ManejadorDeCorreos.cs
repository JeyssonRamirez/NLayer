// -----------------------------------------------------------------------
// <copyright file="ManejadorDeCorreos.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// -----------------------------------------------------------------------

using System;
using System.Collections.Generic;
using ActiveUp.Net.Mail;
using Sci.Nlayer.Infraestructura.Transversales.Correos;

namespace Sci.Nlayer.Infraestructura.Transversales.Frameworks.Correos
{
    public class ManejadorDeCorreos : IManejadorDeCorreos
    {
        private List<string> _adjuntos;
        private string _asunto;
        private List<string> _destinos;
        private string _mensaje;

        #region Implementation of IManejadorDeCorreos

        public List<string> Destinos
        {
            get { return _destinos; }
            set { _destinos = value; }
        }

        public List<string> Adjuntos
        {
            get { return _adjuntos; }
            set { _adjuntos = value; }
        }

        public string Mensaje
        {
            get { return _mensaje; }
            set { _mensaje = value; }
        }

        public string Asunto
        {
            get { return _asunto; }
            set { _asunto = value; }
        }

        public void Enviar()
        {
            ServerCollection servers = new ServerCollection();
            Server sci = new Server();
            Message message = new Message();
            MimeBody mimeBody = new MimeBody(BodyFormat.Html);
            AddressCollection destinos = new AddressCollection();

            sci.Host = "mail.softwaresci.com";
            sci.Password = "12345678";
            sci.Port = 25;
            sci.Username = "informacion@softwaresci.com";

            servers.Add(sci);

            if (_destinos != null)
            {
                foreach (string destino in _destinos)
                {
                    destinos.Add(new Address(destino));
                }
            }

            if (_adjuntos != null)
            {
                foreach (string adjunto in _adjuntos)
                {
                    message.Attachments.Add(adjunto, false);
                }
            }

            mimeBody.Text = _mensaje;

            message.BodyHtml = mimeBody;
            message.Date = DateTime.Now;
            message.From = new Address("informacion@softwaresci.com");
            message.Organization = "SCI Software";
            message.Priority = MessagePriority.Normal;
            message.To = destinos;
            message.Subject = _asunto;

            AsyncCallback beginCallback = IniciaEnvio;
            SmtpClient.BeginSend(message, servers, beginCallback);
        }

        private void IniciaEnvio(IAsyncResult ar)
        {
        }

        #endregion
    }
}