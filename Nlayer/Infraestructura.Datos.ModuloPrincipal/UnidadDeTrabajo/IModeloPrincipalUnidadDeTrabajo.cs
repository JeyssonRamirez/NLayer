﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

#pragma warning disable 1591 // this is for supress no xml comments in public members warnings 

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Common;
using System.Data.EntityClient;
using System.Data.Metadata.Edm;
using System.Data.Objects.DataClasses;
using System.Data.Objects;
using System.Data;
using System.Diagnostics;
using System.Globalization;
using System.Linq;



using Nlayer.Nlayer.Infraestructura.Datos.Nucleo;
using Nlayer.Nlayer.Dominio.ModuloPrincipal.Entidades;

namespace Nlayer.Nlayer.Infraestructura.Datos.ModuloPrincipal.UnidadDeTrabajo
{
    
    ///<sumary>
    ///Base contract for context in Main Module 
    ///</sumary>
    public interface IModeloPrincipalUnidadDeTrabajo : IConsultableUnidadDeTrabajo
    {
       
        #region ObjectSet Properties
    
    	IObjectSet<Aplicacion> Aplicacion{get;}
    	
    
    	IObjectSet<ErrorAplicacion> ErrorAplicacion{get;}
    	
    
    	IObjectSet<Membresia> Membresia{get;}
    	
    
    	IObjectSet<Perfil> Perfil{get;}
    	
    
    	IObjectSet<Propiedad> Propiedad{get;}
    	
    
    	IObjectSet<Rol> Rol{get;}
    	
    
    	IObjectSet<RolPropiedad> RolPropiedad{get;}
    	
    
    	IObjectSet<RolUsuario> RolUsuario{get;}
    	
    
    	IObjectSet<SiteMap> SiteMap{get;}
    	
    
    	IObjectSet<Usuario> Usuario{get;}
    	
    
    	IObjectSet<ValorPropiedad> ValorPropiedad{get;}
    	

        #endregion

    
    }
}
	
