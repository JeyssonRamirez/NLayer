//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Globalization;
using System.Runtime.Serialization;

namespace Sci.Nlayer.Dominio.ModuloPrincipal.Entidades
{
    [DataContract(IsReference = true)]
    [KnownType(typeof(Membresia))]
    [KnownType(typeof(Perfil))]
    [KnownType(typeof(RolUsuario))]
    [KnownType(typeof(ValorPropiedad))]
    public partial class Usuario: IObjectWithChangeTracker, INotifyPropertyChanged
    {
        #region Primitive Properties
    
        [DataMember]
        public int UsuarioId
        {
            get { return _usuarioId; }
            set
            {
                if (_usuarioId != value)
                {
                    if (ChangeTracker.ChangeTrackingEnabled && ChangeTracker.State != ObjectState.Added)
                    {
                        throw new InvalidOperationException("The property 'UsuarioId' is part of the object's key and cannot be changed. Changes to key properties can only be made when the object is not being tracked or is in the Added state.");
                    }
                    _usuarioId = value;
                    OnPropertyChanged("UsuarioId");
                }
            }
        }
        private int _usuarioId;
    
        [DataMember]
        public System.Guid ProviderUserKey
        {
            get { return _providerUserKey; }
            set
            {
                if (_providerUserKey != value)
                {
                    _providerUserKey = value;
                    OnPropertyChanged("ProviderUserKey");
                }
            }
        }
        private System.Guid _providerUserKey;
    
        [DataMember]
        public string Login
        {
            get { return _login; }
            set
            {
                if (_login != value)
                {
                    _login = value;
                    OnPropertyChanged("Login");
                }
            }
        }
        private string _login;

        #endregion
        #region Navigation Properties
    
        [DataMember]
        public TrackableCollection<Membresia> Membresia
        {
            get
            {
                if (_membresia == null)
                {
                    _membresia = new TrackableCollection<Membresia>();
                    _membresia.CollectionChanged += FixupMembresia;
                }
                return _membresia;
            }
            set
            {
                if (!ReferenceEquals(_membresia, value))
                {
                    if (ChangeTracker.ChangeTrackingEnabled)
                    {
                        throw new InvalidOperationException("Cannot set the FixupChangeTrackingCollection when ChangeTracking is enabled");
                    }
                    if (_membresia != null)
                    {
                        _membresia.CollectionChanged -= FixupMembresia;
                    }
                    _membresia = value;
                    if (_membresia != null)
                    {
                        _membresia.CollectionChanged += FixupMembresia;
                    }
                    OnNavigationPropertyChanged("Membresia");
                }
            }
        }
        private TrackableCollection<Membresia> _membresia;
    
        [DataMember]
        public TrackableCollection<Perfil> Perfil
        {
            get
            {
                if (_perfil == null)
                {
                    _perfil = new TrackableCollection<Perfil>();
                    _perfil.CollectionChanged += FixupPerfil;
                }
                return _perfil;
            }
            set
            {
                if (!ReferenceEquals(_perfil, value))
                {
                    if (ChangeTracker.ChangeTrackingEnabled)
                    {
                        throw new InvalidOperationException("Cannot set the FixupChangeTrackingCollection when ChangeTracking is enabled");
                    }
                    if (_perfil != null)
                    {
                        _perfil.CollectionChanged -= FixupPerfil;
                    }
                    _perfil = value;
                    if (_perfil != null)
                    {
                        _perfil.CollectionChanged += FixupPerfil;
                    }
                    OnNavigationPropertyChanged("Perfil");
                }
            }
        }
        private TrackableCollection<Perfil> _perfil;
    
        [DataMember]
        public TrackableCollection<RolUsuario> RolUsuario
        {
            get
            {
                if (_rolUsuario == null)
                {
                    _rolUsuario = new TrackableCollection<RolUsuario>();
                    _rolUsuario.CollectionChanged += FixupRolUsuario;
                }
                return _rolUsuario;
            }
            set
            {
                if (!ReferenceEquals(_rolUsuario, value))
                {
                    if (ChangeTracker.ChangeTrackingEnabled)
                    {
                        throw new InvalidOperationException("Cannot set the FixupChangeTrackingCollection when ChangeTracking is enabled");
                    }
                    if (_rolUsuario != null)
                    {
                        _rolUsuario.CollectionChanged -= FixupRolUsuario;
                    }
                    _rolUsuario = value;
                    if (_rolUsuario != null)
                    {
                        _rolUsuario.CollectionChanged += FixupRolUsuario;
                    }
                    OnNavigationPropertyChanged("RolUsuario");
                }
            }
        }
        private TrackableCollection<RolUsuario> _rolUsuario;
    
        [DataMember]
        public TrackableCollection<ValorPropiedad> ValorPropiedad
        {
            get
            {
                if (_valorPropiedad == null)
                {
                    _valorPropiedad = new TrackableCollection<ValorPropiedad>();
                    _valorPropiedad.CollectionChanged += FixupValorPropiedad;
                }
                return _valorPropiedad;
            }
            set
            {
                if (!ReferenceEquals(_valorPropiedad, value))
                {
                    if (ChangeTracker.ChangeTrackingEnabled)
                    {
                        throw new InvalidOperationException("Cannot set the FixupChangeTrackingCollection when ChangeTracking is enabled");
                    }
                    if (_valorPropiedad != null)
                    {
                        _valorPropiedad.CollectionChanged -= FixupValorPropiedad;
                        // This is the principal end in an association that performs cascade deletes.
                        // Remove the cascade delete event handler for any entities in the current collection.
                        foreach (ValorPropiedad item in _valorPropiedad)
                        {
                            ChangeTracker.ObjectStateChanging -= item.HandleCascadeDelete;
                        }
                    }
                    _valorPropiedad = value;
                    if (_valorPropiedad != null)
                    {
                        _valorPropiedad.CollectionChanged += FixupValorPropiedad;
                        // This is the principal end in an association that performs cascade deletes.
                        // Add the cascade delete event handler for any entities that are already in the new collection.
                        foreach (ValorPropiedad item in _valorPropiedad)
                        {
                            ChangeTracker.ObjectStateChanging += item.HandleCascadeDelete;
                        }
                    }
                    OnNavigationPropertyChanged("ValorPropiedad");
                }
            }
        }
        private TrackableCollection<ValorPropiedad> _valorPropiedad;

        #endregion
        #region ChangeTracking
    
        protected virtual void OnPropertyChanged(String propertyName)
        {
            if (ChangeTracker.State != ObjectState.Added && ChangeTracker.State != ObjectState.Deleted)
            {
                ChangeTracker.State = ObjectState.Modified;
            }
            if (_propertyChanged != null)
            {
                _propertyChanged(this, new PropertyChangedEventArgs(propertyName));
            }
        }
    
        protected virtual void OnNavigationPropertyChanged(String propertyName)
        {
            if (_propertyChanged != null)
            {
                _propertyChanged(this, new PropertyChangedEventArgs(propertyName));
            }
        }
    
        event PropertyChangedEventHandler INotifyPropertyChanged.PropertyChanged{ add { _propertyChanged += value; } remove { _propertyChanged -= value; } }
        private event PropertyChangedEventHandler _propertyChanged;
        private ObjectChangeTracker _changeTracker;
    
        [DataMember]
        public ObjectChangeTracker ChangeTracker
        {
            get
            {
                if (_changeTracker == null)
                {
                    _changeTracker = new ObjectChangeTracker();
                    _changeTracker.ObjectStateChanging += HandleObjectStateChanging;
                }
                return _changeTracker;
            }
            set
            {
                if(_changeTracker != null)
                {
                    _changeTracker.ObjectStateChanging -= HandleObjectStateChanging;
                }
                _changeTracker = value;
                if(_changeTracker != null)
                {
                    _changeTracker.ObjectStateChanging += HandleObjectStateChanging;
                }
            }
        }
    
        private void HandleObjectStateChanging(object sender, ObjectStateChangingEventArgs e)
        {
            if (e.NewState == ObjectState.Deleted)
            {
                ClearNavigationProperties();
            }
        }
    
        protected bool IsDeserializing { get; private set; }
    
        [OnDeserializing]
        public void OnDeserializingMethod(StreamingContext context)
        {
            IsDeserializing = true;
        }
    
        [OnDeserialized]
        public void OnDeserializedMethod(StreamingContext context)
        {
            IsDeserializing = false;
            ChangeTracker.ChangeTrackingEnabled = true;
        }
    
        protected virtual void ClearNavigationProperties()
        {
            Membresia.Clear();
            Perfil.Clear();
            RolUsuario.Clear();
            ValorPropiedad.Clear();
        }

        #endregion
        #region Association Fixup
    
        private void FixupMembresia(object sender, NotifyCollectionChangedEventArgs e)
        {
            if (IsDeserializing)
            {
                return;
            }
    
            if (e.NewItems != null)
            {
                foreach (Membresia item in e.NewItems)
                {
                    item.Usuario = this;
                    if (ChangeTracker.ChangeTrackingEnabled)
                    {
                        if (!item.ChangeTracker.ChangeTrackingEnabled)
                        {
                            item.StartTracking();
                        }
                        ChangeTracker.RecordAdditionToCollectionProperties("Membresia", item);
                    }
                }
            }
    
            if (e.OldItems != null)
            {
                foreach (Membresia item in e.OldItems)
                {
                    if (ReferenceEquals(item.Usuario, this))
                    {
                        item.Usuario = null;
                    }
                    if (ChangeTracker.ChangeTrackingEnabled)
                    {
                        ChangeTracker.RecordRemovalFromCollectionProperties("Membresia", item);
                    }
                }
            }
        }
    
        private void FixupPerfil(object sender, NotifyCollectionChangedEventArgs e)
        {
            if (IsDeserializing)
            {
                return;
            }
    
            if (e.NewItems != null)
            {
                foreach (Perfil item in e.NewItems)
                {
                    item.Usuario = this;
                    if (ChangeTracker.ChangeTrackingEnabled)
                    {
                        if (!item.ChangeTracker.ChangeTrackingEnabled)
                        {
                            item.StartTracking();
                        }
                        ChangeTracker.RecordAdditionToCollectionProperties("Perfil", item);
                    }
                }
            }
    
            if (e.OldItems != null)
            {
                foreach (Perfil item in e.OldItems)
                {
                    if (ReferenceEquals(item.Usuario, this))
                    {
                        item.Usuario = null;
                    }
                    if (ChangeTracker.ChangeTrackingEnabled)
                    {
                        ChangeTracker.RecordRemovalFromCollectionProperties("Perfil", item);
                    }
                }
            }
        }
    
        private void FixupRolUsuario(object sender, NotifyCollectionChangedEventArgs e)
        {
            if (IsDeserializing)
            {
                return;
            }
    
            if (e.NewItems != null)
            {
                foreach (RolUsuario item in e.NewItems)
                {
                    item.Usuario = this;
                    if (ChangeTracker.ChangeTrackingEnabled)
                    {
                        if (!item.ChangeTracker.ChangeTrackingEnabled)
                        {
                            item.StartTracking();
                        }
                        ChangeTracker.RecordAdditionToCollectionProperties("RolUsuario", item);
                    }
                }
            }
    
            if (e.OldItems != null)
            {
                foreach (RolUsuario item in e.OldItems)
                {
                    if (ReferenceEquals(item.Usuario, this))
                    {
                        item.Usuario = null;
                    }
                    if (ChangeTracker.ChangeTrackingEnabled)
                    {
                        ChangeTracker.RecordRemovalFromCollectionProperties("RolUsuario", item);
                    }
                }
            }
        }
    
        private void FixupValorPropiedad(object sender, NotifyCollectionChangedEventArgs e)
        {
            if (IsDeserializing)
            {
                return;
            }
    
            if (e.NewItems != null)
            {
                foreach (ValorPropiedad item in e.NewItems)
                {
                    item.Usuario = this;
                    if (ChangeTracker.ChangeTrackingEnabled)
                    {
                        if (!item.ChangeTracker.ChangeTrackingEnabled)
                        {
                            item.StartTracking();
                        }
                        ChangeTracker.RecordAdditionToCollectionProperties("ValorPropiedad", item);
                    }
                    // This is the principal end in an association that performs cascade deletes.
                    // Update the event listener to refer to the new dependent.
                    ChangeTracker.ObjectStateChanging += item.HandleCascadeDelete;
                }
            }
    
            if (e.OldItems != null)
            {
                foreach (ValorPropiedad item in e.OldItems)
                {
                    if (ReferenceEquals(item.Usuario, this))
                    {
                        item.Usuario = null;
                    }
                    if (ChangeTracker.ChangeTrackingEnabled)
                    {
                        ChangeTracker.RecordRemovalFromCollectionProperties("ValorPropiedad", item);
                        // Delete the dependent end of this identifying association. If the current state is Added,
                        // allow the relationship to be changed without causing the dependent to be deleted.
                        if (item.ChangeTracker.State != ObjectState.Added)
                        {
                            item.MarkAsDeleted();
                        }
                    }
                    // This is the principal end in an association that performs cascade deletes.
                    // Remove the previous dependent from the event listener.
                    ChangeTracker.ObjectStateChanging -= item.HandleCascadeDelete;
                }
            }
        }

        #endregion
    }
}
