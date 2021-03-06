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

namespace Nlayer.Nlayer.Dominio.ModuloPrincipal.Entidades
{
    [DataContract(IsReference = true)]
    [KnownType(typeof(RolPropiedad))]
    [KnownType(typeof(RolUsuario))]
    public partial class Rol: IObjectWithChangeTracker, INotifyPropertyChanged
    {
        #region Primitive Properties
    
        [DataMember]
        public int RolId
        {
            get { return _rolId; }
            set
            {
                if (_rolId != value)
                {
                    if (ChangeTracker.ChangeTrackingEnabled && ChangeTracker.State != ObjectState.Added)
                    {
                        throw new InvalidOperationException("The property 'RolId' is part of the object's key and cannot be changed. Changes to key properties can only be made when the object is not being tracked or is in the Added state.");
                    }
                    _rolId = value;
                    OnPropertyChanged("RolId");
                }
            }
        }
        private int _rolId;
    
        [DataMember]
        public int AplicacionId
        {
            get { return _aplicacionId; }
            set
            {
                if (_aplicacionId != value)
                {
                    _aplicacionId = value;
                    OnPropertyChanged("AplicacionId");
                }
            }
        }
        private int _aplicacionId;
    
        [DataMember]
        public string Nombre
        {
            get { return _nombre; }
            set
            {
                if (_nombre != value)
                {
                    _nombre = value;
                    OnPropertyChanged("Nombre");
                }
            }
        }
        private string _nombre;

        #endregion

        #region Navigation Properties
    
        [DataMember]
        public TrackableCollection<RolPropiedad> RolPropiedad
        {
            get
            {
                if (_rolPropiedad == null)
                {
                    _rolPropiedad = new TrackableCollection<RolPropiedad>();
                    _rolPropiedad.CollectionChanged += FixupRolPropiedad;
                }
                return _rolPropiedad;
            }
            set
            {
                if (!ReferenceEquals(_rolPropiedad, value))
                {
                    if (ChangeTracker.ChangeTrackingEnabled)
                    {
                        throw new InvalidOperationException("Cannot set the FixupChangeTrackingCollection when ChangeTracking is enabled");
                    }
                    if (_rolPropiedad != null)
                    {
                        _rolPropiedad.CollectionChanged -= FixupRolPropiedad;
                    }
                    _rolPropiedad = value;
                    if (_rolPropiedad != null)
                    {
                        _rolPropiedad.CollectionChanged += FixupRolPropiedad;
                    }
                    OnNavigationPropertyChanged("RolPropiedad");
                }
            }
        }
        private TrackableCollection<RolPropiedad> _rolPropiedad;
    
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
            RolPropiedad.Clear();
            RolUsuario.Clear();
        }

        #endregion

        #region Association Fixup
    
        private void FixupRolPropiedad(object sender, NotifyCollectionChangedEventArgs e)
        {
            if (IsDeserializing)
            {
                return;
            }
    
            if (e.NewItems != null)
            {
                foreach (RolPropiedad item in e.NewItems)
                {
                    item.Rol = this;
                    if (ChangeTracker.ChangeTrackingEnabled)
                    {
                        if (!item.ChangeTracker.ChangeTrackingEnabled)
                        {
                            item.StartTracking();
                        }
                        ChangeTracker.RecordAdditionToCollectionProperties("RolPropiedad", item);
                    }
                }
            }
    
            if (e.OldItems != null)
            {
                foreach (RolPropiedad item in e.OldItems)
                {
                    if (ReferenceEquals(item.Rol, this))
                    {
                        item.Rol = null;
                    }
                    if (ChangeTracker.ChangeTrackingEnabled)
                    {
                        ChangeTracker.RecordRemovalFromCollectionProperties("RolPropiedad", item);
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
                    item.Rol = this;
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
                    if (ReferenceEquals(item.Rol, this))
                    {
                        item.Rol = null;
                    }
                    if (ChangeTracker.ChangeTrackingEnabled)
                    {
                        ChangeTracker.RecordRemovalFromCollectionProperties("RolUsuario", item);
                    }
                }
            }
        }

        #endregion

    }
}
