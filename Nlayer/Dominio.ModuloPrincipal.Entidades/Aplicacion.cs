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
    [KnownType(typeof(Membresia))]
    [KnownType(typeof(Perfil))]
    public partial class Aplicacion: IObjectWithChangeTracker, INotifyPropertyChanged
    {
        #region Primitive Properties
    
        [DataMember]
        public int AplicacionId
        {
            get { return _aplicacionId; }
            set
            {
                if (_aplicacionId != value)
                {
                    if (ChangeTracker.ChangeTrackingEnabled && ChangeTracker.State != ObjectState.Added)
                    {
                        throw new InvalidOperationException("The property 'AplicacionId' is part of the object's key and cannot be changed. Changes to key properties can only be made when the object is not being tracked or is in the Added state.");
                    }
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
                    item.Aplicacion = this;
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
                    if (ReferenceEquals(item.Aplicacion, this))
                    {
                        item.Aplicacion = null;
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
                    item.Aplicacion = this;
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
                    if (ReferenceEquals(item.Aplicacion, this))
                    {
                        item.Aplicacion = null;
                    }
                    if (ChangeTracker.ChangeTrackingEnabled)
                    {
                        ChangeTracker.RecordRemovalFromCollectionProperties("Perfil", item);
                    }
                }
            }
        }

        #endregion

    }
}
