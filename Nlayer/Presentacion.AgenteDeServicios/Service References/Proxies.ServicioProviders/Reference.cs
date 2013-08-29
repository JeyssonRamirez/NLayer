﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18052
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Nlayer.Nlayer.Presentacion.AgenteDeServicios.Proxies.ServicioProviders {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="ErrorServicio", Namespace="http://schemas.datacontract.org/2004/07/Nlayer.Nlayer.ServiciosDistribuidos.Nucle" +
        "o.ManejoDeErrores")]
    [System.SerializableAttribute()]
    public partial class ErrorServicio : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string MensajeDeErrorField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string MensajeDeError {
            get {
                return this.MensajeDeErrorField;
            }
            set {
                if ((object.ReferenceEquals(this.MensajeDeErrorField, value) != true)) {
                    this.MensajeDeErrorField = value;
                    this.RaisePropertyChanged("MensajeDeError");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="Proxies.ServicioProviders.IServicioProviders")]
    public interface IServicioProviders {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServicioProviders/Test", ReplyAction="http://tempuri.org/IServicioProviders/TestResponse")]
        [System.ServiceModel.FaultContractAttribute(typeof(Nlayer.Nlayer.Presentacion.AgenteDeServicios.Proxies.ServicioProviders.ErrorServicio), Action="http://tempuri.org/IServicioProviders/TestErrorServicioFault", Name="ErrorServicio", Namespace="http://schemas.datacontract.org/2004/07/Nlayer.Nlayer.ServiciosDistribuidos.Nucle" +
            "o.ManejoDeErrores")]
        bool Test();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServicioProviders/RegistrarUsuario", ReplyAction="http://tempuri.org/IServicioProviders/RegistrarUsuarioResponse")]
        [System.ServiceModel.FaultContractAttribute(typeof(Nlayer.Nlayer.Presentacion.AgenteDeServicios.Proxies.ServicioProviders.ErrorServicio), Action="http://tempuri.org/IServicioProviders/RegistrarUsuarioErrorServicioFault", Name="ErrorServicio", Namespace="http://schemas.datacontract.org/2004/07/Nlayer.Nlayer.ServiciosDistribuidos.Nucle" +
            "o.ManejoDeErrores")]
        void RegistrarUsuario(
                    System.Guid providerUserKey, 
                    string aplicacion, 
                    string login, 
                    string password, 
                    string email, 
                    string preguntaPassword, 
                    string respuestaPassword, 
                    string comentario, 
                    System.DateTime ultimaActividad, 
                    System.DateTime ultimaSesion, 
                    System.DateTime ultimoCambioDePassword, 
                    int cantidadIntentosFaillidosPassword, 
                    System.DateTime inicioIntentosFallidosPassword, 
                    int cantidadIntentosFallidosPregunta, 
                    System.DateTime inicioIntentosFallidosPregunta, 
                    bool estaAprobadao, 
                    bool estaBloqueado, 
                    System.DateTime ultimoBloqueo, 
                    System.DateTime registrado);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServicioProviders/ObtenerLoginPorEmail", ReplyAction="http://tempuri.org/IServicioProviders/ObtenerLoginPorEmailResponse")]
        [System.ServiceModel.FaultContractAttribute(typeof(Nlayer.Nlayer.Presentacion.AgenteDeServicios.Proxies.ServicioProviders.ErrorServicio), Action="http://tempuri.org/IServicioProviders/ObtenerLoginPorEmailErrorServicioFault", Name="ErrorServicio", Namespace="http://schemas.datacontract.org/2004/07/Nlayer.Nlayer.ServiciosDistribuidos.Nucle" +
            "o.ManejoDeErrores")]
        System.Data.DataTable ObtenerLoginPorEmail(string aplicacion, string email);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IServicioProvidersChannel : Nlayer.Nlayer.Presentacion.AgenteDeServicios.Proxies.ServicioProviders.IServicioProviders, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class ServicioProvidersClient : System.ServiceModel.ClientBase<Nlayer.Nlayer.Presentacion.AgenteDeServicios.Proxies.ServicioProviders.IServicioProviders>, Nlayer.Nlayer.Presentacion.AgenteDeServicios.Proxies.ServicioProviders.IServicioProviders {
        
        public ServicioProvidersClient() {
        }
        
        public ServicioProvidersClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public ServicioProvidersClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ServicioProvidersClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ServicioProvidersClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public bool Test() {
            return base.Channel.Test();
        }
        
        public void RegistrarUsuario(
                    System.Guid providerUserKey, 
                    string aplicacion, 
                    string login, 
                    string password, 
                    string email, 
                    string preguntaPassword, 
                    string respuestaPassword, 
                    string comentario, 
                    System.DateTime ultimaActividad, 
                    System.DateTime ultimaSesion, 
                    System.DateTime ultimoCambioDePassword, 
                    int cantidadIntentosFaillidosPassword, 
                    System.DateTime inicioIntentosFallidosPassword, 
                    int cantidadIntentosFallidosPregunta, 
                    System.DateTime inicioIntentosFallidosPregunta, 
                    bool estaAprobadao, 
                    bool estaBloqueado, 
                    System.DateTime ultimoBloqueo, 
                    System.DateTime registrado) {
            base.Channel.RegistrarUsuario(providerUserKey, aplicacion, login, password, email, preguntaPassword, respuestaPassword, comentario, ultimaActividad, ultimaSesion, ultimoCambioDePassword, cantidadIntentosFaillidosPassword, inicioIntentosFallidosPassword, cantidadIntentosFallidosPregunta, inicioIntentosFallidosPregunta, estaAprobadao, estaBloqueado, ultimoBloqueo, registrado);
        }
        
        public System.Data.DataTable ObtenerLoginPorEmail(string aplicacion, string email) {
            return base.Channel.ObtenerLoginPorEmail(aplicacion, email);
        }
    }
}
