USE [SciNlayer]
GO
/****** Object:  ForeignKey [FK_ValorPropiedad_Propiedad]    Script Date: 02/07/2012 11:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_ValorPropiedad_Propiedad]') AND parent_object_id = OBJECT_ID(N'[adm].[ValorPropiedad]'))
ALTER TABLE [adm].[ValorPropiedad] DROP CONSTRAINT [FK_ValorPropiedad_Propiedad]
GO
/****** Object:  ForeignKey [FK_ValorPropiedad_Usuario]    Script Date: 02/07/2012 11:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_ValorPropiedad_Usuario]') AND parent_object_id = OBJECT_ID(N'[adm].[ValorPropiedad]'))
ALTER TABLE [adm].[ValorPropiedad] DROP CONSTRAINT [FK_ValorPropiedad_Usuario]
GO
/****** Object:  ForeignKey [FK_Perfil_Aplicacion]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_Perfil_Aplicacion]') AND parent_object_id = OBJECT_ID(N'[adm].[Perfil]'))
ALTER TABLE [adm].[Perfil] DROP CONSTRAINT [FK_Perfil_Aplicacion]
GO
/****** Object:  ForeignKey [FK_Perfil_Usuario]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_Perfil_Usuario]') AND parent_object_id = OBJECT_ID(N'[adm].[Perfil]'))
ALTER TABLE [adm].[Perfil] DROP CONSTRAINT [FK_Perfil_Usuario]
GO
/****** Object:  ForeignKey [FK_Membresia_Aplicacion]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_Membresia_Aplicacion]') AND parent_object_id = OBJECT_ID(N'[adm].[Membresia]'))
ALTER TABLE [adm].[Membresia] DROP CONSTRAINT [FK_Membresia_Aplicacion]
GO
/****** Object:  ForeignKey [FK_Membresia_Usuario]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_Membresia_Usuario]') AND parent_object_id = OBJECT_ID(N'[adm].[Membresia]'))
ALTER TABLE [adm].[Membresia] DROP CONSTRAINT [FK_Membresia_Usuario]
GO
/****** Object:  ForeignKey [FK_RolUsuario_Rol]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_RolUsuario_Rol]') AND parent_object_id = OBJECT_ID(N'[adm].[RolUsuario]'))
ALTER TABLE [adm].[RolUsuario] DROP CONSTRAINT [FK_RolUsuario_Rol]
GO
/****** Object:  ForeignKey [FK_RolUsuario_Usuario]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_RolUsuario_Usuario]') AND parent_object_id = OBJECT_ID(N'[adm].[RolUsuario]'))
ALTER TABLE [adm].[RolUsuario] DROP CONSTRAINT [FK_RolUsuario_Usuario]
GO
/****** Object:  ForeignKey [FK_RolPropiedad_Propiedad]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_RolPropiedad_Propiedad]') AND parent_object_id = OBJECT_ID(N'[adm].[RolPropiedad]'))
ALTER TABLE [adm].[RolPropiedad] DROP CONSTRAINT [FK_RolPropiedad_Propiedad]
GO
/****** Object:  ForeignKey [FK_RolPropiedad_Rol]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_RolPropiedad_Rol]') AND parent_object_id = OBJECT_ID(N'[adm].[RolPropiedad]'))
ALTER TABLE [adm].[RolPropiedad] DROP CONSTRAINT [FK_RolPropiedad_Rol]
GO
/****** Object:  StoredProcedure [adm].[SCISP_RegistrarValorPropiedad]    Script Date: 02/07/2012 11:04:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_RegistrarValorPropiedad]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_RegistrarValorPropiedad]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ResetearPasswordUsuario]    Script Date: 02/07/2012 11:04:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ResetearPasswordUsuario]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ResetearPasswordUsuario]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ValidarUsuario]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ValidarUsuario]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ValidarUsuario]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerPerfilUsuario]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerPerfilUsuario]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ObtenerPerfilUsuario]
GO
/****** Object:  StoredProcedure [adm].[SCISP_RegistrarUsuario]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_RegistrarUsuario]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_RegistrarUsuario]
GO
/****** Object:  StoredProcedure [adm].[SCISP_RegistrarUsuariosEnRoles]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_RegistrarUsuariosEnRoles]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_RegistrarUsuariosEnRoles]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerRespuestaDeSeguridad]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerRespuestaDeSeguridad]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ObtenerRespuestaDeSeguridad]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerRolesUsuario]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerRolesUsuario]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ObtenerRolesUsuario]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ActualizarIntentosFallidos]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ActualizarIntentosFallidos]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ActualizarIntentosFallidos]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ActualizarPasswordUsuario]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ActualizarPasswordUsuario]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ActualizarPasswordUsuario]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ActualizarPreguntaYRespuesta]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ActualizarPreguntaYRespuesta]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ActualizarPreguntaYRespuesta]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ActualizarUltimaActividadPerfil]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ActualizarUltimaActividadPerfil]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ActualizarUltimaActividadPerfil]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ActualizarUsuario]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ActualizarUsuario]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ActualizarUsuario]
GO
/****** Object:  StoredProcedure [adm].[SCISP_BloquearUsuario]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_BloquearUsuario]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_BloquearUsuario]
GO
/****** Object:  StoredProcedure [adm].[SCISP_DesbloquearUsuario]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_DesbloquearUsuario]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_DesbloquearUsuario]
GO
/****** Object:  StoredProcedure [adm].[SCISP_EliminarPerfil]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_EliminarPerfil]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_EliminarPerfil]
GO
/****** Object:  StoredProcedure [adm].[SCISP_EliminarPerfilesInactivos]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_EliminarPerfilesInactivos]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_EliminarPerfilesInactivos]
GO
/****** Object:  StoredProcedure [adm].[SCISP_EliminarUsuario]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_EliminarUsuario]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_EliminarUsuario]
GO
/****** Object:  StoredProcedure [adm].[SCISP_EliminarUsuariosDeRoles]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_EliminarUsuariosDeRoles]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_EliminarUsuariosDeRoles]
GO
/****** Object:  StoredProcedure [adm].[SCISP_EstaElUsuarioEnElRol]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_EstaElUsuarioEnElRol]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_EstaElUsuarioEnElRol]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerInfoIntentosFallidos]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerInfoIntentosFallidos]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ObtenerInfoIntentosFallidos]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerPerfiles]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerPerfiles]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ObtenerPerfiles]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerPerfilesInactivos]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerPerfilesInactivos]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ObtenerPerfilesInactivos]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerPerfilesInactivosPorUsuario]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerPerfilesInactivosPorUsuario]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ObtenerPerfilesInactivosPorUsuario]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerPerfilesPorUsuario]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerPerfilesPorUsuario]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ObtenerPerfilesPorUsuario]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerTotalPerfilesInactivos]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerTotalPerfilesInactivos]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ObtenerTotalPerfilesInactivos]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerTotalUsuariosEnLinea]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerTotalUsuariosEnLinea]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ObtenerTotalUsuariosEnLinea]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerUsuarioPorEmail]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerUsuarioPorEmail]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ObtenerUsuarioPorEmail]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerUsuarioPorLogin]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerUsuarioPorLogin]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ObtenerUsuarioPorLogin]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerUsuarioPorProviderUserKey]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerUsuarioPorProviderUserKey]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ObtenerUsuarioPorProviderUserKey]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerUsuarios]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerUsuarios]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ObtenerUsuarios]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerUsuariosEnRol]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerUsuariosEnRol]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ObtenerUsuariosEnRol]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerUsuariosPorEmail]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerUsuariosPorEmail]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ObtenerUsuariosPorEmail]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerUsuariosPorLogin]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerUsuariosPorLogin]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ObtenerUsuariosPorLogin]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerUsuariosPorRol]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerUsuariosPorRol]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ObtenerUsuariosPorRol]
GO
/****** Object:  StoredProcedure [adm].[SCISP_RegistrarErrorAplicativo]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_RegistrarErrorAplicativo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_RegistrarErrorAplicativo]
GO
/****** Object:  StoredProcedure [adm].[SCISP_RegistrarRol]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_RegistrarRol]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_RegistrarRol]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ExisteRol]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ExisteRol]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ExisteRol]
GO
/****** Object:  StoredProcedure [adm].[SCISP_EliminarRol]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_EliminarRol]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_EliminarRol]
GO
/****** Object:  Table [adm].[RolPropiedad]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_RolPropiedad_Propiedad]') AND parent_object_id = OBJECT_ID(N'[adm].[RolPropiedad]'))
ALTER TABLE [adm].[RolPropiedad] DROP CONSTRAINT [FK_RolPropiedad_Propiedad]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_RolPropiedad_Rol]') AND parent_object_id = OBJECT_ID(N'[adm].[RolPropiedad]'))
ALTER TABLE [adm].[RolPropiedad] DROP CONSTRAINT [FK_RolPropiedad_Rol]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[RolPropiedad]') AND type in (N'U'))
DROP TABLE [adm].[RolPropiedad]
GO
/****** Object:  Table [adm].[RolUsuario]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_RolUsuario_Rol]') AND parent_object_id = OBJECT_ID(N'[adm].[RolUsuario]'))
ALTER TABLE [adm].[RolUsuario] DROP CONSTRAINT [FK_RolUsuario_Rol]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_RolUsuario_Usuario]') AND parent_object_id = OBJECT_ID(N'[adm].[RolUsuario]'))
ALTER TABLE [adm].[RolUsuario] DROP CONSTRAINT [FK_RolUsuario_Usuario]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[RolUsuario]') AND type in (N'U'))
DROP TABLE [adm].[RolUsuario]
GO
/****** Object:  Table [adm].[Membresia]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_Membresia_Aplicacion]') AND parent_object_id = OBJECT_ID(N'[adm].[Membresia]'))
ALTER TABLE [adm].[Membresia] DROP CONSTRAINT [FK_Membresia_Aplicacion]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_Membresia_Usuario]') AND parent_object_id = OBJECT_ID(N'[adm].[Membresia]'))
ALTER TABLE [adm].[Membresia] DROP CONSTRAINT [FK_Membresia_Usuario]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[Membresia]') AND type in (N'U'))
DROP TABLE [adm].[Membresia]
GO
/****** Object:  Table [adm].[Perfil]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_Perfil_Aplicacion]') AND parent_object_id = OBJECT_ID(N'[adm].[Perfil]'))
ALTER TABLE [adm].[Perfil] DROP CONSTRAINT [FK_Perfil_Aplicacion]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_Perfil_Usuario]') AND parent_object_id = OBJECT_ID(N'[adm].[Perfil]'))
ALTER TABLE [adm].[Perfil] DROP CONSTRAINT [FK_Perfil_Usuario]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[Perfil]') AND type in (N'U'))
DROP TABLE [adm].[Perfil]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerSiteMap]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerSiteMap]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ObtenerSiteMap]
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerRoles]    Script Date: 02/07/2012 11:04:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerRoles]') AND type in (N'P', N'PC'))
DROP PROCEDURE [adm].[SCISP_ObtenerRoles]
GO
/****** Object:  Table [adm].[ValorPropiedad]    Script Date: 02/07/2012 11:04:37 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_ValorPropiedad_Propiedad]') AND parent_object_id = OBJECT_ID(N'[adm].[ValorPropiedad]'))
ALTER TABLE [adm].[ValorPropiedad] DROP CONSTRAINT [FK_ValorPropiedad_Propiedad]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_ValorPropiedad_Usuario]') AND parent_object_id = OBJECT_ID(N'[adm].[ValorPropiedad]'))
ALTER TABLE [adm].[ValorPropiedad] DROP CONSTRAINT [FK_ValorPropiedad_Usuario]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[ValorPropiedad]') AND type in (N'U'))
DROP TABLE [adm].[ValorPropiedad]
GO
/****** Object:  Table [adm].[Propiedad]    Script Date: 02/07/2012 11:04:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[Propiedad]') AND type in (N'U'))
DROP TABLE [adm].[Propiedad]
GO
/****** Object:  Table [adm].[Rol]    Script Date: 02/07/2012 11:04:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[Rol]') AND type in (N'U'))
DROP TABLE [adm].[Rol]
GO
/****** Object:  Table [adm].[Aplicacion]    Script Date: 02/07/2012 11:04:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[Aplicacion]') AND type in (N'U'))
DROP TABLE [adm].[Aplicacion]
GO
/****** Object:  Table [adm].[ErrorAplicacion]    Script Date: 02/07/2012 11:04:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[ErrorAplicacion]') AND type in (N'U'))
DROP TABLE [adm].[ErrorAplicacion]
GO
/****** Object:  Table [adm].[SiteMap]    Script Date: 02/07/2012 11:04:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SiteMap]') AND type in (N'U'))
DROP TABLE [adm].[SiteMap]
GO
/****** Object:  Table [adm].[Usuario]    Script Date: 02/07/2012 11:04:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[Usuario]') AND type in (N'U'))
DROP TABLE [adm].[Usuario]
GO
/****** Object:  Schema [adm]    Script Date: 02/07/2012 11:04:34 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'adm')
DROP SCHEMA [adm]
GO
/****** Object:  Schema [adm]    Script Date: 02/07/2012 11:04:34 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'adm')
EXEC sys.sp_executesql N'CREATE SCHEMA [adm] AUTHORIZATION [dbo]'
GO
/****** Object:  Table [adm].[Usuario]    Script Date: 02/07/2012 11:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[Usuario]') AND type in (N'U'))
BEGIN
CREATE TABLE [adm].[Usuario](
	[UsuarioId] [int] IDENTITY(1,1) NOT NULL,
	[ProviderUserKey] [uniqueidentifier] NOT NULL,
	[Login] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY],
 CONSTRAINT [UK_Usuario_Login] UNIQUE NONCLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [adm].[SiteMap]    Script Date: 02/07/2012 11:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SiteMap]') AND type in (N'U'))
BEGIN
CREATE TABLE [adm].[SiteMap](
	[SiteMapId] [int] IDENTITY(1,1) NOT NULL,
	[AplicacionId] [int] NOT NULL,
	[Titulo] [nvarchar](64) NOT NULL,
	[Descripcion] [nvarchar](512) NULL,
	[Url] [nvarchar](512) NULL,
	[Roles] [nvarchar](512) NULL,
	[PadreId] [int] NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_SiteMap] PRIMARY KEY CLUSTERED 
(
	[SiteMapId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [adm].[SiteMap] ON
INSERT [adm].[SiteMap] ([SiteMapId], [AplicacionId], [Titulo], [Descripcion], [Url], [Roles], [PadreId], [Activo]) VALUES (1, 1, N'Root', NULL, N'#Root', N'*', NULL, 1)
INSERT [adm].[SiteMap] ([SiteMapId], [AplicacionId], [Titulo], [Descripcion], [Url], [Roles], [PadreId], [Activo]) VALUES (2, 1, N'Inicio', NULL, N'~/Default.aspx', N'*', 1, 1)
SET IDENTITY_INSERT [adm].[SiteMap] OFF
/****** Object:  Table [adm].[ErrorAplicacion]    Script Date: 02/07/2012 11:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[ErrorAplicacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [adm].[ErrorAplicacion](
	[ErrorAplicacionId] [int] IDENTITY(1,1) NOT NULL,
	[Aplicacion] [nvarchar](256) NULL,
	[Error] [nvarchar](512) NULL,
	[Excepcion] [text] NULL,
	[Interna] [text] NULL,
	[Registrado] [datetime] NULL,
 CONSTRAINT [PK_ErrorAplicacion] PRIMARY KEY CLUSTERED 
(
	[ErrorAplicacionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [adm].[Aplicacion]    Script Date: 02/07/2012 11:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[Aplicacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [adm].[Aplicacion](
	[AplicacionId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Aplicacion] PRIMARY KEY CLUSTERED 
(
	[AplicacionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[adm].[Aplicacion]') AND name = N'UK_Aplicacion_Nombre')
CREATE UNIQUE NONCLUSTERED INDEX [UK_Aplicacion_Nombre] ON [adm].[Aplicacion] 
(
	[AplicacionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [adm].[Aplicacion] ON
INSERT [adm].[Aplicacion] ([AplicacionId], [Nombre]) VALUES (1, N'Sci Nlayer Admin')
INSERT [adm].[Aplicacion] ([AplicacionId], [Nombre]) VALUES (2, N'Sci Nlayer Core')
SET IDENTITY_INSERT [adm].[Aplicacion] OFF
/****** Object:  Table [adm].[Rol]    Script Date: 02/07/2012 11:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[Rol]') AND type in (N'U'))
BEGIN
CREATE TABLE [adm].[Rol](
	[RolId] [int] IDENTITY(1,1) NOT NULL,
	[AplicacionId] [int] NOT NULL,
	[Nombre] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[RolId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY],
 CONSTRAINT [UK_Rol_Unico] UNIQUE NONCLUSTERED 
(
	[AplicacionId] ASC,
	[Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [adm].[Propiedad]    Script Date: 02/07/2012 11:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[Propiedad]') AND type in (N'U'))
BEGIN
CREATE TABLE [adm].[Propiedad](
	[PropiedadId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](64) NOT NULL,
	[Tipo] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_Propiedad] PRIMARY KEY CLUSTERED 
(
	[PropiedadId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY],
 CONSTRAINT [UK_Propiedad_Nombre] UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [adm].[ValorPropiedad]    Script Date: 02/07/2012 11:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[ValorPropiedad]') AND type in (N'U'))
BEGIN
CREATE TABLE [adm].[ValorPropiedad](
	[UsuarioId] [int] NOT NULL,
	[PropiedadId] [int] NOT NULL,
	[Valor] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ValorPropiedad] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC,
	[PropiedadId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerRoles]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerRoles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ===========================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 30 de 2011
-- ===========================================================
CREATE PROCEDURE [adm].[SCISP_ObtenerRoles]
	@Aplicacion NVARCHAR(256)
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
			
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
			
			SELECT 
				Nombre
			FROM adm.Rol
			WHERE AplicacionId = @AplicacionId
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerSiteMap]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerSiteMap]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 24 de 2011
-- ==================================================
CREATE  PROCEDURE [adm].[SCISP_ObtenerSiteMap] 
	@Aplicacion NVARCHAR(256)
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 		

			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)

			SELECT 
				SiteMapId, 
				Titulo, 
				Descripcion, 
				Url, 
				Roles, 
				PadreId
			INTO #Root
			FROM adm.SiteMap
			WHERE (Activo = 1) AND (AplicacionId = @AplicacionId) AND (PadreId IS NULL)
			
			SELECT 
				SiteMapId, 
				Titulo, 
				Descripcion, 
				Url, 
				Roles, 
				PadreId
			INTO #PrimerNivel
			FROM adm.SiteMap			
			WHERE (Activo = 1) AND (AplicacionId = @AplicacionId) AND (PadreId IN (SELECT SiteMapId FROM #Root))
			
			SELECT 
				SiteMapId, 
				Titulo, 
				Descripcion, 
				Url, 
				Roles, 
				PadreId
			INTO #SegundoNivel
			FROM adm.SiteMap			
			WHERE (Activo = 1) AND (AplicacionId = @AplicacionId) AND (PadreId IN (SELECT SiteMapId FROM #PrimerNivel))			
			
			SELECT 
				SiteMapId, 
				Titulo, 
				Descripcion, 
				Url, 
				Roles, 
				PadreId
			INTO #TercerNivel
			FROM adm.SiteMap			
			WHERE (Activo = 1) AND (AplicacionId = @AplicacionId) AND (PadreId IN (SELECT SiteMapId FROM #SegundoNivel))						
			
			SELECT * FROM #Root
			UNION ALL
			SELECT * FROM #PrimerNivel
			UNION ALL
			SELECT * FROM #SegundoNivel
			UNION ALL
			SELECT * FROM #TercerNivel	
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  Table [adm].[Perfil]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[Perfil]') AND type in (N'U'))
BEGIN
CREATE TABLE [adm].[Perfil](
	[PerfilId] [int] IDENTITY(1,1) NOT NULL,
	[AplicacionId] [int] NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[UltimaActividad] [datetime] NOT NULL,
	[UltimaActualizacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[PerfilId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [adm].[Membresia]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[Membresia]') AND type in (N'U'))
BEGIN
CREATE TABLE [adm].[Membresia](
	[MembresiaId] [int] IDENTITY(1,1) NOT NULL,
	[AplicacionId] [int] NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[Password] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[PreguntaPassword] [nvarchar](256) NULL,
	[RespuestaPassword] [nvarchar](256) NULL,
	[Comentario] [nvarchar](512) NULL,
	[UltimaActividad] [datetime] NOT NULL,
	[UltimaSesion] [datetime] NOT NULL,
	[UltimoCambioDePassword] [datetime] NOT NULL,
	[CantidadIntentosFallidosPassword] [int] NOT NULL,
	[InicioIntentosFallidosPassword] [datetime] NOT NULL,
	[CantidadIntentosFallidosPregunta] [int] NOT NULL,
	[InicioIntentosFallidosPregunta] [datetime] NOT NULL,
	[EstaAprobado] [bit] NOT NULL,
	[EstaBloqueado] [bit] NOT NULL,
	[UltimoBloqueo] [datetime] NOT NULL,
	[Registrado] [datetime] NOT NULL,
 CONSTRAINT [PK_Membresia] PRIMARY KEY CLUSTERED 
(
	[MembresiaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY],
 CONSTRAINT [UK_Membresia_Aplicacion_Email] UNIQUE NONCLUSTERED 
(
	[AplicacionId] ASC,
	[Email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY],
 CONSTRAINT [UK_Membresia_Aplicacion_Usuario] UNIQUE NONCLUSTERED 
(
	[AplicacionId] ASC,
	[UsuarioId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [adm].[RolUsuario]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[RolUsuario]') AND type in (N'U'))
BEGIN
CREATE TABLE [adm].[RolUsuario](
	[RolUsuarioId] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[RolId] [int] NOT NULL,
 CONSTRAINT [PK_RolUsuario] PRIMARY KEY CLUSTERED 
(
	[RolUsuarioId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY],
 CONSTRAINT [UK_RolUsuario_Unico] UNIQUE NONCLUSTERED 
(
	[RolId] ASC,
	[UsuarioId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [adm].[RolPropiedad]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[RolPropiedad]') AND type in (N'U'))
BEGIN
CREATE TABLE [adm].[RolPropiedad](
	[RolPropiedadId] [int] IDENTITY(1,1) NOT NULL,
	[RolId] [int] NOT NULL,
	[PropiedadId] [int] NOT NULL,
 CONSTRAINT [PK_RolPropiedad] PRIMARY KEY CLUSTERED 
(
	[RolPropiedadId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_EliminarRol]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_EliminarRol]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ===================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 30 de 2011
-- ===================================================
CREATE PROCEDURE [adm].[SCISP_EliminarRol]
	@Aplicacion NVARCHAR(256),
	@Nombre NVARCHAR(128)
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
					
			DELETE FROM adm.Rol
			WHERE Nombre = @Nombre AND AplicacionId = @AplicacionId
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ExisteRol]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ExisteRol]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ===================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 30 de 2011
-- ===================================================
CREATE PROCEDURE [adm].[SCISP_ExisteRol]
	@Nombre NVARCHAR(128),
	@Aplicacion NVARCHAR(256)
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
			
			SELECT CAST((SELECT COUNT(*) FROM adm.Rol WHERE (Nombre = @Nombre) AND (AplicacionId = @AplicacionId)) AS BIT)
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_RegistrarRol]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_RegistrarRol]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ========================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 25 de 2011
-- ========================================================
CREATE PROCEDURE [adm].[SCISP_RegistrarRol]
	 @Aplicacion NVARCHAR(256),
	 @Nombre NVARCHAR(128),
	 @Activo BIT
	
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)		
		
			INSERT INTO adm.Rol(AplicacionId, Nombre)
			VALUES(@AplicacionId, @Nombre)
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_RegistrarErrorAplicativo]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_RegistrarErrorAplicativo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 24 de 2011
-- =================================================
CREATE PROCEDURE [adm].[SCISP_RegistrarErrorAplicativo]
	@Aplicacion NVARCHAR(256),
	@Error NVARCHAR(256),
	@Excepcion TEXT = NULL,
	@Interna TEXT = NULL

AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
			
			INSERT INTO adm.ErrorAplicacion (Aplicacion, Error, Excepcion, Interna, Registrado)
			VALUES(@Aplicacion, @Error, @Excepcion, @Interna, GETDATE())
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerUsuariosPorRol]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerUsuariosPorRol]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ===================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 24 de 2011
-- ===================================================
CREATE PROCEDURE [adm].[SCISP_ObtenerUsuariosPorRol]
	@Rol NVARCHAR(128),
	@Aplicacion NVARCHAR(256)
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)		
			DECLARE @RolId INT = (SELECT RolId FROM adm.Rol WHERE Nombre = @Rol AND AplicacionId = @AplicacionId)			
			
			SELECT adm.Usuario.Login
			FROM adm.RolUsuario 
			INNER JOIN adm.Usuario ON adm.RolUsuario.UsuarioId = adm.Usuario.UsuarioId
			WHERE (adm.RolUsuario.RolId = @RolId)
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerUsuariosPorLogin]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerUsuariosPorLogin]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ===================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 24 de 2011
-- ===================================================
CREATE PROCEDURE [adm].[SCISP_ObtenerUsuariosPorLogin]
	@Login NVARCHAR(32),
	@Aplicacion NVARCHAR(256),
	@Inicio INT,
	@Cantidad INT
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
		
			SELECT COUNT(*) AS N''Total''
			FROM adm.Membresia
			INNER JOIN adm.Aplicacion ON adm.Membresia.AplicacionId = adm.Aplicacion.AplicacionId
			INNER JOIN adm.Usuario ON adm.Membresia.UsuarioId = adm.Usuario.UsuarioId
			WHERE (adm.Aplicacion.AplicacionId = @AplicacionId) AND (adm.Usuario.Login LIKE @Login + ''%'' )
		
			SELECT TOP(@Cantidad)
					Usuarios.UsuarioId, 
					Usuarios.ProviderUserKey, 
					Usuarios.Aplicacion, 
					Usuarios.Login, 
					Usuarios.Password,  
					Usuarios.Email, 
					Usuarios.PreguntaPassword, 
					Usuarios.RespuestaPassword, 
					Usuarios.Comentario, 
					Usuarios.UltimaActividad, 
					Usuarios.UltimaSesion, 
					Usuarios.UltimoCambioDePassword, 
					Usuarios.CantidadIntentosFallidosPassword, 
					Usuarios.InicioIntentosFallidosPassword,
					Usuarios.CantidadIntentosFallidosPregunta,
					Usuarios.InicioIntentosFallidosPregunta,
					Usuarios.EstaAprobado,
					Usuarios.EstaBloqueado,
					Usuarios.UltimoBloqueo,
					Usuarios.Registrado				
			FROM (SELECT
					ROW_NUMBER() OVER(ORDER BY adm.Membresia.MembresiaId) AS Indice,
					adm.Membresia.UsuarioId, 
					adm.Usuario.ProviderUserKey, 
					adm.Aplicacion.AplicacionId, 
					adm.Aplicacion.Nombre AS Aplicacion, 
					adm.Usuario.Login, 
					adm.Membresia.Password AS Password,  
					adm.Membresia.Email, 
					adm.Membresia.PreguntaPassword, 
					adm.Membresia.RespuestaPassword, 
					adm.Membresia.Comentario, 
					adm.Membresia.UltimaActividad, 
					adm.Membresia.UltimaSesion, 
					adm.Membresia.UltimoCambioDePassword, 
					adm.Membresia.CantidadIntentosFallidosPassword, 
					adm.Membresia.InicioIntentosFallidosPassword,
					adm.Membresia.CantidadIntentosFallidosPregunta,
					adm.Membresia.InicioIntentosFallidosPregunta,
					adm.Membresia.EstaAprobado,
					adm.Membresia.EstaBloqueado,
					adm.Membresia.UltimoBloqueo,
					adm.Membresia.Registrado
				FROM adm.Membresia
				INNER JOIN adm.Aplicacion ON adm.Membresia.AplicacionId = adm.Aplicacion.AplicacionId
				INNER JOIN adm.Usuario ON adm.Membresia.UsuarioId = adm.Usuario.UsuarioId
				WHERE (adm.Aplicacion.AplicacionId = @AplicacionId) AND (adm.Usuario.Login LIKE  @Login + ''%'' )) AS Usuarios
			WHERE (Usuarios.Indice > @Inicio)
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerUsuariosPorEmail]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerUsuariosPorEmail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ===================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 24 de 2011
-- ===================================================
CREATE PROCEDURE [adm].[SCISP_ObtenerUsuariosPorEmail]
	@Email NVARCHAR(256),
	@Aplicacion NVARCHAR(256),
	@Inicio INT,
	@Cantidad INT
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
		
			SELECT COUNT(*) AS N''Total''
			FROM adm.Membresia
			INNER JOIN adm.Aplicacion ON adm.Membresia.AplicacionId = adm.Aplicacion.AplicacionId
			INNER JOIN adm.Usuario ON adm.Membresia.UsuarioId = adm.Usuario.UsuarioId
			WHERE (adm.Aplicacion.AplicacionId = @AplicacionId) AND (adm.Membresia.Email LIKE @Email + ''%'' )
		
			SELECT TOP(@Cantidad)
					Usuarios.UsuarioId, 
					Usuarios.ProviderUserKey, 
					Usuarios.Aplicacion, 
					Usuarios.Login, 
					Usuarios.Password,  
					Usuarios.Email, 
					Usuarios.PreguntaPassword, 
					Usuarios.RespuestaPassword, 
					Usuarios.Comentario, 
					Usuarios.UltimaActividad, 
					Usuarios.UltimaSesion, 
					Usuarios.UltimoCambioDePassword, 
					Usuarios.CantidadIntentosFallidosPassword, 
					Usuarios.InicioIntentosFallidosPassword,
					Usuarios.CantidadIntentosFallidosPregunta,
					Usuarios.InicioIntentosFallidosPregunta,
					Usuarios.EstaAprobado,
					Usuarios.EstaBloqueado,
					Usuarios.UltimoBloqueo,
					Usuarios.Registrado				
			FROM (SELECT
					ROW_NUMBER() OVER(ORDER BY adm.Membresia.MembresiaId) AS Indice,
					adm.Membresia.UsuarioId, 
					adm.Usuario.ProviderUserKey, 
					adm.Aplicacion.AplicacionId, 
					adm.Aplicacion.Nombre AS Aplicacion, 
					adm.Usuario.Login, 
					adm.Membresia.Password AS Password,  
					adm.Membresia.Email, 
					adm.Membresia.PreguntaPassword, 
					adm.Membresia.RespuestaPassword, 
					adm.Membresia.Comentario, 
					adm.Membresia.UltimaActividad, 
					adm.Membresia.UltimaSesion, 
					adm.Membresia.UltimoCambioDePassword, 
					adm.Membresia.CantidadIntentosFallidosPassword, 
					adm.Membresia.InicioIntentosFallidosPassword,
					adm.Membresia.CantidadIntentosFallidosPregunta,
					adm.Membresia.InicioIntentosFallidosPregunta,
					adm.Membresia.EstaAprobado,
					adm.Membresia.EstaBloqueado,
					adm.Membresia.UltimoBloqueo,
					adm.Membresia.Registrado
				FROM adm.Membresia
				INNER JOIN adm.Aplicacion ON adm.Membresia.AplicacionId = adm.Aplicacion.AplicacionId
				INNER JOIN adm.Usuario ON adm.Membresia.UsuarioId = adm.Usuario.UsuarioId
				WHERE (adm.Aplicacion.AplicacionId = @AplicacionId) AND (adm.Membresia.Email LIKE @Email + ''%'' )) AS Usuarios
			WHERE (Usuarios.Indice > @Inicio)
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerUsuariosEnRol]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerUsuariosEnRol]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ===================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 24 de 2011
-- ===================================================
CREATE PROCEDURE [adm].[SCISP_ObtenerUsuariosEnRol]
	@Login NVARCHAR(32),
	@Rol NVARCHAR(128),
	@Aplicacion NVARCHAR(256)
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)			
			DECLARE @RolId INT = (SELECT RolId FROM adm.Rol WHERE Nombre = @Rol AND AplicacionId = @AplicacionId)
			
			SELECT adm.Usuario.Login
			FROM adm.RolUsuario
			INNER JOIN adm.Usuario ON adm.RolUsuario.UsuarioId = adm.Usuario.UsuarioId
			WHERE (adm.Usuario.Login LIKE @Login) AND (RolId = @RolId)
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerUsuarios]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerUsuarios]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ===========================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 30 de 2011
-- ===========================================================
CREATE PROCEDURE [adm].[SCISP_ObtenerUsuarios]
	@Aplicacion NVARCHAR(256),
	@Inicio INT,
	@Cantidad INT
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
			
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
		
			SELECT COUNT(*) AS N''TotalRegistros''
			FROM adm.Membresia
			INNER JOIN adm.Aplicacion ON adm.Membresia.AplicacionId = adm.Aplicacion.AplicacionId
			INNER JOIN adm.Usuario ON adm.Membresia.UsuarioId = adm.Usuario.UsuarioId
			WHERE adm.Aplicacion.AplicacionId = @AplicacionId
		
			SELECT TOP(@Cantidad)
					Usuarios.UsuarioId, 
					Usuarios.ProviderUserKey, 
					Usuarios.Aplicacion, 
					Usuarios.Login, 
					Usuarios.Password,  
					Usuarios.Email, 
					Usuarios.PreguntaPassword, 
					Usuarios.RespuestaPassword, 
					Usuarios.Comentario, 
					Usuarios.UltimaActividad, 
					Usuarios.UltimaSesion, 
					Usuarios.UltimoCambioDePassword, 
					Usuarios.CantidadIntentosFallidosPassword, 
					Usuarios.InicioIntentosFallidosPassword,
					Usuarios.CantidadIntentosFallidosPregunta,
					Usuarios.InicioIntentosFallidosPregunta,
					Usuarios.EstaAprobado,
					Usuarios.EstaBloqueado,
					Usuarios.UltimoBloqueo,
					Usuarios.Registrado				
			FROM (SELECT
					ROW_NUMBER() OVER(ORDER BY adm.Membresia.MembresiaId) AS Indice,
					adm.Membresia.UsuarioId, 
					adm.Usuario.ProviderUserKey, 
					adm.Aplicacion.AplicacionId, 
					adm.Aplicacion.Nombre AS Aplicacion, 
					adm.Usuario.Login, 
					adm.Membresia.Password AS Password,  
					adm.Membresia.Email, 
					adm.Membresia.PreguntaPassword, 
					adm.Membresia.RespuestaPassword, 
					adm.Membresia.Comentario, 
					adm.Membresia.UltimaActividad, 
					adm.Membresia.UltimaSesion, 
					adm.Membresia.UltimoCambioDePassword, 
					adm.Membresia.CantidadIntentosFallidosPassword, 
					adm.Membresia.InicioIntentosFallidosPassword,
					adm.Membresia.CantidadIntentosFallidosPregunta,
					adm.Membresia.InicioIntentosFallidosPregunta,
					adm.Membresia.EstaAprobado,
					adm.Membresia.EstaBloqueado,
					adm.Membresia.UltimoBloqueo,
					adm.Membresia.Registrado
				FROM adm.Membresia
				INNER JOIN adm.Aplicacion ON adm.Membresia.AplicacionId = adm.Aplicacion.AplicacionId
				INNER JOIN adm.Usuario ON adm.Membresia.UsuarioId = adm.Usuario.UsuarioId
				WHERE adm.Aplicacion.AplicacionId = @AplicacionId) AS Usuarios
			WHERE (Usuarios.Indice > @Inicio)
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerUsuarioPorProviderUserKey]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerUsuarioPorProviderUserKey]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ======================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 24 de 2011
-- ======================================================
CREATE PROCEDURE [adm].[SCISP_ObtenerUsuarioPorProviderUserKey]
	@ProviderUserKey UNIQUEIDENTIFIER,
	@Aplicacion NVARCHAR(256)
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
		
			SELECT 
				adm.Membresia.UsuarioId, 
				adm.Usuario.ProviderUserKey, 
				adm.Aplicacion.Nombre AS Aplicacion, 
				adm.Usuario.Login, 
				adm.Membresia.Password AS Password,  
				adm.Membresia.Email, 
				adm.Membresia.PreguntaPassword, 
				adm.Membresia.RespuestaPassword, 
				adm.Membresia.Comentario, 
				adm.Membresia.UltimaActividad, 
				adm.Membresia.UltimaSesion, 
				adm.Membresia.UltimoCambioDePassword, 
				adm.Membresia.CantidadIntentosFallidosPassword, 
				adm.Membresia.InicioIntentosFallidosPassword,
				adm.Membresia.CantidadIntentosFallidosPregunta,
				adm.Membresia.InicioIntentosFallidosPregunta,
				adm.Membresia.EstaAprobado,
				adm.Membresia.EstaBloqueado,
				adm.Membresia.UltimoBloqueo,
				adm.Membresia.Registrado
			FROM adm.Membresia
			INNER JOIN adm.Aplicacion ON adm.Membresia.AplicacionId = adm.Aplicacion.Nombre
			INNER JOIN adm.Usuario ON adm.Membresia.UsuarioId = adm.Usuario.UsuarioId
			WHERE (adm.Usuario.ProviderUserKey = @ProviderUserKey) AND (adm.Membresia.AplicacionId = @AplicacionId)
			
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerUsuarioPorLogin]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerUsuarioPorLogin]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ===================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 24 de 2011
-- ===================================================
CREATE PROCEDURE [adm].[SCISP_ObtenerUsuarioPorLogin]
	@Login NVARCHAR(32),
	@Aplicacion NVARCHAR(256),
	@EstaEnLinea BIT
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
			DECLARE @UsuarioId INT = (SELECT UsuarioId FROM adm.Usuario WHERE Login = @Login)

			IF @EstaEnLinea = 1
				BEGIN
					UPDATE adm.Membresia SET 
						UltimaActividad = GETDATE()
					WHERE (UsuarioId = @UsuarioId) AND (AplicacionId = @AplicacionId)
				END

			SELECT 
				adm.Membresia.UsuarioId, 
				adm.Usuario.ProviderUserKey, 
				adm.Aplicacion.Nombre AS Aplicacion, 
				adm.Usuario.Login, 
				adm.Membresia.Password AS Password,  
				adm.Membresia.Email, 
				adm.Membresia.PreguntaPassword, 
				adm.Membresia.RespuestaPassword, 
				adm.Membresia.Comentario, 
				adm.Membresia.UltimaActividad, 
				adm.Membresia.UltimaSesion, 
				adm.Membresia.UltimoCambioDePassword, 
				adm.Membresia.CantidadIntentosFallidosPassword, 
				adm.Membresia.InicioIntentosFallidosPassword,
				adm.Membresia.CantidadIntentosFallidosPregunta,
				adm.Membresia.InicioIntentosFallidosPregunta,
				adm.Membresia.EstaAprobado,
				adm.Membresia.EstaBloqueado,
				adm.Membresia.UltimoBloqueo,
				adm.Membresia.Registrado
			FROM adm.Membresia
			INNER JOIN adm.Aplicacion ON adm.Membresia.AplicacionId = adm.Aplicacion.AplicacionId
			INNER JOIN adm.Usuario ON adm.Membresia.UsuarioId = adm.Usuario.UsuarioId
			WHERE (adm.Usuario.UsuarioId = @UsuarioId) AND (adm.Membresia.AplicacionId = @AplicacionId)
				
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerUsuarioPorEmail]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerUsuarioPorEmail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ======================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 25 de 2011
-- ======================================================
CREATE PROCEDURE [adm].[SCISP_ObtenerUsuarioPorEmail]
	@Email NVARCHAR(256),
	@Aplicacion NVARCHAR(256)
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
		
			SELECT 
				adm.Membresia.UsuarioId, 
				adm.Usuario.ProviderUserKey, 
				adm.Aplicacion.Nombre AS Aplicacion, 
				adm.Usuario.Login, 
				adm.Membresia.Password AS Password,  
				adm.Membresia.Email, 
				adm.Membresia.PreguntaPassword, 
				adm.Membresia.RespuestaPassword, 
				adm.Membresia.Comentario, 
				adm.Membresia.UltimaActividad, 
				adm.Membresia.UltimaSesion, 
				adm.Membresia.UltimoCambioDePassword, 
				adm.Membresia.CantidadIntentosFallidosPassword, 
				adm.Membresia.InicioIntentosFallidosPassword,
				adm.Membresia.CantidadIntentosFallidosPregunta,
				adm.Membresia.InicioIntentosFallidosPregunta,
				adm.Membresia.EstaAprobado,
				adm.Membresia.EstaBloqueado,
				adm.Membresia.UltimoBloqueo,
				adm.Membresia.Registrado
			FROM adm.Membresia
			INNER JOIN adm.Aplicacion ON adm.Membresia.AplicacionId = adm.Aplicacion.AplicacionId
			INNER JOIN adm.Usuario ON adm.Membresia.UsuarioId = adm.Usuario.UsuarioId
			WHERE (adm.Membresia.Email = @Email) AND (adm.Membresia.AplicacionId = @AplicacionId)
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerTotalUsuariosEnLinea]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerTotalUsuariosEnLinea]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==============================================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 24 de 2011
-- ==============================================================================
CREATE PROCEDURE [adm].[SCISP_ObtenerTotalUsuariosEnLinea]
	@Aplicacion NVARCHAR(256),
	@FechaComparacion DATETIME
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)			
		
			SELECT COUNT(*)
			FROM adm.Membresia
			WHERE (UltimaActividad > @FechaComparacion) AND (AplicacionId = @AplicacionId)
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerTotalPerfilesInactivos]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerTotalPerfilesInactivos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =====================================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 24 de 2011
-- =====================================================================
CREATE PROCEDURE [adm].[SCISP_ObtenerTotalPerfilesInactivos]
	@Aplicacion NVARCHAR(256),
	@UltimaActividad DATETIME
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
		
			SELECT COUNT(*) AS N''TotalRegistros''
			FROM adm.Perfil
			WHERE (AplicacionId = @AplicacionId) AND (UltimaActividad <= @UltimaActividad)
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerPerfilesPorUsuario]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerPerfilesPorUsuario]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ===========================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 30 de 2011
-- ===========================================================
CREATE PROCEDURE [adm].[SCISP_ObtenerPerfilesPorUsuario]
	@Login NVARCHAR(32),
	@Inicio INT,
	@Cantidad INT
		
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 

			DECLARE @UsuarioId INT = (SELECT UsuarioId FROM adm.Usuario WHERE Login = @Login)

			SELECT COUNT(*) AS N''TotalRegistros''
			FROM adm.Perfil
			INNER JOIN adm.Usuario ON adm.Perfil.UsuarioId = adm.Usuario.UsuarioId
			WHERE adm.Perfil.UsuarioId = @UsuarioId
					
			SELECT TOP(@Cantidad)
				Perfiles.Login,
				Perfiles.UltimaActividad,
				Perfiles.UltimaActualizacion,
				Perfiles.EsAnonimo
			FROM(SELECT
					ROW_NUMBER() OVER(ORDER BY adm.Perfil.PerfilId) AS Indice,
					adm.Usuario.Login,
					adm.Perfil.UltimaActividad,
					adm.Perfil.UltimaActualizacion,
					CAST(0 AS BIT) AS EsAnonimo
				FROM adm.Perfil
				INNER JOIN adm.Usuario ON adm.Perfil.UsuarioId = adm.Usuario.UsuarioId
				WHERE adm.Perfil.UsuarioId = @UsuarioId) AS Perfiles
			WHERE Perfiles.Indice > @Inicio
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerPerfilesInactivosPorUsuario]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerPerfilesInactivosPorUsuario]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ===========================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 30 de 2011
-- ===========================================================
CREATE PROCEDURE [adm].[SCISP_ObtenerPerfilesInactivosPorUsuario]
	@Login NVARCHAR(32),
	@UltimaActividad DATETIME,
	@Inicio INT,
	@Cantidad INT
		
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 

			DECLARE @UsuarioId INT = (SELECT UsuarioId FROM adm.Usuario WHERE Login = @Login)

			SELECT COUNT(*) AS N''TotalRegistros''
			FROM adm.Perfil
			INNER JOIN adm.Usuario ON adm.Perfil.UsuarioId = adm.Usuario.UsuarioId
			WHERE (adm.Perfil.UsuarioId = @UsuarioId) AND (UltimaActividad <= @UltimaActividad)
					
			SELECT TOP(@Cantidad)
				Perfiles.Login,
				Perfiles.UltimaActividad,
				Perfiles.UltimaActualizacion,
				Perfiles.EsAnonimo
			FROM(SELECT
					ROW_NUMBER() OVER(ORDER BY adm.Perfil.PerfilId) AS Indice,
					adm.Usuario.Login,
					adm.Perfil.UltimaActividad,
					adm.Perfil.UltimaActualizacion,
					CAST(0 AS BIT) AS EsAnonimo
				FROM adm.Perfil
				INNER JOIN adm.Usuario ON adm.Perfil.UsuarioId = adm.Usuario.UsuarioId
				WHERE (adm.Perfil.UsuarioId = @UsuarioId) AND (UltimaActividad <= @UltimaActividad)) AS Perfiles
			WHERE Perfiles.Indice > @Inicio
		
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerPerfilesInactivos]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerPerfilesInactivos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ===========================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 30 de 2011
-- ===========================================================
CREATE PROCEDURE [adm].[SCISP_ObtenerPerfilesInactivos]
	@Aplicacion NVARCHAR(256),
	@UltimaActividad DATETIME,
	@Inicio INT,
	@Cantidad INT	
AS
	SET NOCOUNT ON
	
	BEGIN TRY
	
		BEGIN TRANSACTION 

			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)

			SELECT COUNT(*) AS N''TotalRegistros''
			FROM adm.Perfil
			INNER JOIN adm.Usuario ON adm.Perfil.UsuarioId = adm.Usuario.UsuarioId
			WHERE (AplicacionId = @AplicacionId) AND (UltimaActividad <= @UltimaActividad)
					
			SELECT TOP(@Cantidad)
				Perfiles.Login,
				Perfiles.UltimaActividad,
				Perfiles.UltimaActualizacion,
				Perfiles.EsAnonimo
			FROM(SELECT
					ROW_NUMBER() OVER(ORDER BY adm.Perfil.PerfilId) AS Indice,
					adm.Usuario.Login,
					adm.Perfil.UltimaActividad,
					adm.Perfil.UltimaActualizacion,
					CAST(0 AS BIT) AS EsAnonimo
				FROM adm.Perfil
				INNER JOIN adm.Usuario ON adm.Perfil.UsuarioId = adm.Usuario.UsuarioId
				WHERE (AplicacionId = @AplicacionId) AND (UltimaActividad <= @UltimaActividad)) AS Perfiles
			WHERE Perfiles.Indice > @Inicio
			ORDER BY Perfiles.Indice					
		
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerPerfiles]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerPerfiles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ===========================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 30 de 2011
-- ===========================================================
CREATE PROCEDURE [adm].[SCISP_ObtenerPerfiles]
	@Aplicacion NVARCHAR(256),
	@Inicio INT,
	@Cantidad INT
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 

			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
					
			SELECT COUNT(*) AS N''TotalRegistros''
			FROM adm.Perfil
			INNER JOIN adm.Usuario ON adm.Perfil.UsuarioId = adm.Usuario.UsuarioId
			WHERE AplicacionId = @AplicacionId					
					
			SELECT TOP(@Cantidad)
				Perfiles.Login,
				Perfiles.UltimaActividad,
				Perfiles.UltimaActualizacion,
				Perfiles.EsAnonimo
			FROM(SELECT
					ROW_NUMBER() OVER(ORDER BY adm.Perfil.PerfilId) AS Indice,
					adm.Usuario.Login,
					adm.Perfil.UltimaActividad,
					adm.Perfil.UltimaActualizacion,
					CAST(0 AS BIT) AS EsAnonimo
				FROM adm.Perfil
				INNER JOIN adm.Usuario ON adm.Perfil.UsuarioId = adm.Usuario.UsuarioId
				WHERE AplicacionId = @AplicacionId) AS Perfiles
			WHERE Perfiles.Indice > @Inicio
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerInfoIntentosFallidos]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerInfoIntentosFallidos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =====================================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 24 de 2011
-- =====================================================================
CREATE PROCEDURE [adm].[SCISP_ObtenerInfoIntentosFallidos]
	@Login NVARCHAR(32),
	@Aplicacion NVARCHAR(256)
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
			DECLARE @UsuarioId INT = (SELECT UsuarioId FROM adm.Usuario WHERE Login = @Login)
		
			SELECT
				CantidadIntentosFallidosPassword,
				InicioIntentosFallidosPassword,
				CantidadIntentosFallidosPregunta,
				InicioIntentosFallidosPregunta
			FROM adm.Membresia
			WHERE UsuarioId = @UsuarioId AND AplicacionId = @AplicacionId			
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_EstaElUsuarioEnElRol]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_EstaElUsuarioEnElRol]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =====================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 24 de 2011
-- =====================================================
CREATE PROCEDURE [adm].[SCISP_EstaElUsuarioEnElRol]
	@Aplicacion NVARCHAR(256),
	@Login NVARCHAR(32),
	@Rol NVARCHAR(128)
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 		
			
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
			DECLARE @UsuarioId INT = (SELECT UsuarioId FROM adm.Usuario WHERE Login = @Login)
			DECLARE @RolId INT = (SELECT RolId FROM adm.Rol WHERE Nombre = @Rol AND AplicacionId = @AplicacionId)
			
			IF (SELECT COUNT(*) FROM adm.RolUsuario WHERE adm.RolUsuario.RolId = @RolId AND adm.RolUsuario.UsuarioId = @UsuarioId) > 0
			    BEGIN
					SELECT CAST(1 AS BIT) AS N''Existe''
			    END
			ELSE
				BEGIN
					SELECT CAST(0 AS BIT) AS N''Existe''
				END
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_EliminarUsuariosDeRoles]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_EliminarUsuariosDeRoles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ===================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 30 de 2011
-- ===================================================
CREATE PROCEDURE [adm].[SCISP_EliminarUsuariosDeRoles]
	 @Aplicacion NVARCHAR(256),
	 @Usuarios XML,
	 @Roles XML
	 
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
			DECLARE @UsuariosLogin TABLE(Login NVARCHAR(32))
			DECLARE @RolesNombre TABLE(Nombre NVARCHAR(128))
			
			INSERT INTO @UsuariosLogin
			SELECT
				P.Elemento.value(''@Login'', ''nvarchar(32)'')
			FROM @Usuarios.nodes(''Usuarios/Usuario'') AS P(Elemento)
			
			INSERT INTO @RolesNombre
			SELECT
				P.Elemento.value(''@Nombre'', ''nvarchar(128)'')
			FROM @Roles.nodes(''Roles/Rol'') AS P(Elemento)
			
			DECLARE @UsuariosId TABLE(UsuarioId INT)
			INSERT INTO @UsuariosId
			SELECT adm.Usuario.UsuarioId
			FROM @UsuariosLogin AS UsuariosLogin
			INNER JOIN adm.Usuario ON UsuariosLogin.Login = adm.Usuario.Login
			
			DECLARE @RolesId TABLE(RolId INT)
			INSERT INTO @RolesId
			SELECT adm.Rol.RolId
			FROM @RolesNombre AS RolesNombre
			INNER JOIN adm.Rol ON RolesNombre.Nombre = adm.Rol.Nombre
			
			DELETE adm.RolUsuario
			WHERE adm.RolUsuario.RolUsuarioId IN (
			SELECT adm.RolUsuario.RolUsuarioId FROM adm.RolUsuario
			INNER JOIN (
			SELECT UsuariosId.UsuarioId, RolesId.RolId 
			FROM @UsuariosId AS UsuariosId
			CROSS JOIN @RolesId AS RolesId) AS RolesUsuario ON adm.RolUsuario.RolId = RolesUsuario.RolId AND adm.RolUsuario.UsuarioId = RolesUsuario.UsuarioId)
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_EliminarUsuario]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_EliminarUsuario]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ===================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 30 de 2011
-- ===================================================
CREATE PROCEDURE [adm].[SCISP_EliminarUsuario]
	@Login NVARCHAR(32),
	@Aplicacion NVARCHAR(256)
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
			DECLARE @UsuarioId INT = (SELECT UsuarioId FROM adm.Usuario WHERE Login = @Login)
			
			DELETE FROM adm.Membresia
			WHERE (UsuarioId = @UsuarioId) AND (AplicacionId = @AplicacionId)
			
			DELETE FROM adm.Perfil
			WHERE (UsuarioId = @UsuarioId) AND (AplicacionId = @AplicacionId)
			
			DELETE FROM adm.RolUsuario
			WHERE (UsuarioId = @UsuarioId)
			
			DELETE FROM adm.ValorPropiedad
			WHERE (UsuarioId = @UsuarioId)
			
			DELETE FROM adm.Usuario
			WHERE (UsuarioId = @UsuarioId)
								
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_EliminarPerfilesInactivos]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_EliminarPerfilesInactivos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ===================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 30 de 2011
-- ===================================================
CREATE PROCEDURE [adm].[SCISP_EliminarPerfilesInactivos]
	@Aplicacion NVARCHAR(256),
	@UlimaActividad DATETIME
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
			
			DECLARE @Perfiles TABLE (PerfilId INT, UsuarioId INT)
			
			INSERT INTO @Perfiles
			SELECT PerfilId, UsuarioId FROM adm.Perfil WHERE AplicacionId = @AplicacionId AND UltimaActividad <= @UlimaActividad
			
			DELETE adm.ValorPropiedad
			WHERE UsuarioId IN (SELECT UsuarioId FROM @Perfiles)
			
			DELETE adm.Perfil
			WHERE PerfilId IN (SELECT PerfilId FROM @Perfiles)
			
			SELECT COUNT(*) FROM @Perfiles
					
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_EliminarPerfil]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_EliminarPerfil]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ===================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 30 de 2011
-- ===================================================
CREATE PROCEDURE [adm].[SCISP_EliminarPerfil]	
	@Aplicacion NVARCHAR(256),
	@Perfiles XML

AS
	BEGIN TRY
	
		BEGIN TRANSACTION
	
	BEGIN
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)

			DECLARE @Usuarios TABLE(Login NVARCHAR(32))
			
			INSERT INTO @Usuarios
			SELECT
				P.Elemento.value(''@Login'', ''nvarchar(32)'')
			FROM @Perfiles.nodes(''Perfiles/Perfil'') AS P(Elemento)
			
			DECLARE @PerfilesAEliminar TABLE(PerfilId INT, UsuarioId INT)
			
			INSERT INTO @PerfilesAEliminar
			SELECT 
				adm.Perfil.PerfilId,
				adm.Perfil.UsuarioId
			FROM @Usuarios AS Usuarios
			INNER JOIN adm.Usuario ON Usuarios.Login = adm.Usuario.Login
			INNER JOIN adm.Perfil ON adm.Usuario.UsuarioId = adm.Perfil.UsuarioId AND adm.Perfil.AplicacionId = @AplicacionId
			
			DELETE adm.ValorPropiedad
			WHERE adm.ValorPropiedad.UsuarioId IN (SELECT UsuarioId FROM @PerfilesAEliminar)
			
			DELETE adm.Perfil
			WHERE adm.Perfil.PerfilId IN (SELECT PerfilId FROM @PerfilesAEliminar)
			
	END
					
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_DesbloquearUsuario]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_DesbloquearUsuario]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ======================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 24 de 2011
-- ======================================================
CREATE PROCEDURE [adm].[SCISP_DesbloquearUsuario]
	@Aplicacion NVARCHAR(256),
	@Login NVARCHAR(32)
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
			DECLARE @UsuarioId INT = (SELECT UsuarioId FROM adm.Usuario WHERE Login = @Login)
		
			UPDATE adm.Membresia
			SET
				EstaBloqueado = 0,
				UltimoBloqueo = GETDATE()
			WHERE UsuarioId = @UsuarioId AND AplicacionId = @AplicacionId			
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_BloquearUsuario]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_BloquearUsuario]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ======================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 24 de 2011
-- ======================================================
CREATE PROCEDURE [adm].[SCISP_BloquearUsuario]
	@Bloquear BIT,
	@Login NVARCHAR(32),
	@Aplicacion NVARCHAR(256)
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
			DECLARE @UsuarioId INT = (SELECT UsuarioId FROM adm.Usuario WHERE Login = @Login)
		
			UPDATE adm.Membresia
			SET
				EstaBloqueado = @Bloquear,
				UltimoBloqueo = GETDATE()
			WHERE UsuarioId = @UsuarioId AND AplicacionId = @AplicacionId			
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ActualizarUsuario]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ActualizarUsuario]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ======================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 24 de 2011
-- ======================================================
CREATE PROCEDURE [adm].[SCISP_ActualizarUsuario]
	@Aplicacion NVARCHAR(256),
	@Email NVARCHAR(256),
	@Comentario NVARCHAR(512),
	@EstaBloqueado BIT,
	@Login NVARCHAR(32)
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 

			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
			DECLARE @UsuarioId INT = (SELECT UsuarioId FROM adm.Usuario WHERE Login = @Login)
					
			UPDATE adm.Membresia
			SET
				Email = @Email,
				Comentario = @Comentario,
				EstaBloqueado = @EstaBloqueado
			WHERE UsuarioId = @UsuarioId AND AplicacionId = @AplicacionId
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ActualizarUltimaActividadPerfil]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ActualizarUltimaActividadPerfil]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ======================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 24 de 2011
-- ======================================================
CREATE PROCEDURE [adm].[SCISP_ActualizarUltimaActividadPerfil]
	@Login NVARCHAR(32),
	@Aplicacion NVARCHAR(256),
	@SoloActividad BIT,
	@EstaAutenticado BIT
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
			DECLARE @UsuarioId INT = (SELECT UsuarioId FROM adm.Usuario WHERE Login = @Login)
			DECLARE @UltimaAtividad DATETIME = GETDATE()
		
			IF @SoloActividad = 1
				BEGIN
					UPDATE adm.Perfil SET UltimaActividad = @UltimaAtividad
					WHERE (UsuarioId = @UsuarioId) AND (AplicacionId = @AplicacionId)				
				END
			ELSE
				BEGIN
					DECLARE @Fecha DATETIME = @UltimaAtividad
					UPDATE adm.Perfil SET UltimaActividad = @Fecha, UltimaActualizacion = @Fecha
					WHERE (UsuarioId = @UsuarioId) AND (AplicacionId = @AplicacionId)				
				END
				
			IF @EstaAutenticado = 1
				BEGIN
					UPDATE adm.Membresia SET
						UltimaActividad = @UltimaAtividad
					WHERE adm.Membresia.AplicacionId = @AplicacionId AND adm.Membresia.UsuarioId =  @UsuarioId				
				END
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ActualizarPreguntaYRespuesta]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ActualizarPreguntaYRespuesta]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 24 de 2011
-- ==============================================================
CREATE PROCEDURE [adm].[SCISP_ActualizarPreguntaYRespuesta]
	@NuevaPregunta NVARCHAR(256),
	@NuevaRespuesta NVARCHAR(256),
	@Login NVARCHAR(32),
	@Aplicacion NVARCHAR(256)

AS
	BEGIN TRY
	
		BEGIN TRANSACTION 

			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
			DECLARE @UsuarioId INT = (SELECT UsuarioId FROM adm.Usuario WHERE Login = @Login)
		
			UPDATE adm.Membresia
			SET
				PreguntaPassword = @NuevaPregunta,
				RespuestaPassword = @NuevaRespuesta
			WHERE UsuarioId = @UsuarioId AND AplicacionId = @AplicacionId				
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ActualizarPasswordUsuario]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ActualizarPasswordUsuario]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 24 de 2011
-- ================================================
CREATE PROCEDURE [adm].[SCISP_ActualizarPasswordUsuario]
	@Aplicacion NVARCHAR(256),
	@Login NVARCHAR(32),
	@Password NVARCHAR(256),
	@NuevoPassword NVARCHAR(256)
	
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
			DECLARE @UsuarioId INT = (SELECT UsuarioId FROM adm.Usuario WHERE Login = @Login)
			
			DECLARE @DBPassword NVARCHAR(256),
					@Actualizado BIT = 0
			
			SELECT 
				@DBPassword = Password
			FROM adm.Membresia
			WHERE UsuarioId = @UsuarioId AND AplicacionId = @AplicacionId
			
			IF @DBPassword IS NOT NULL
				BEGIN
					IF @DBPassword = @Password
						BEGIN
							UPDATE adm.Membresia
							SET
								Password = @NuevoPassword,
								UltimoCambioDePassword = GETDATE()
							WHERE UsuarioId = @UsuarioId AND AplicacionId = @AplicacionId
							
							SET @Actualizado = 1
						END
				END
				
			SELECT @Actualizado AS N''Actualizado''		
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ActualizarIntentosFallidos]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ActualizarIntentosFallidos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ======================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 24 de 2011
-- ======================================================
CREATE PROCEDURE [adm].[SCISP_ActualizarIntentosFallidos]
	@Aplicacion NVARCHAR(256),
	@Login NVARCHAR(32),
	@Tipo INT,
	@IntentosPassword INT,
	@MaximoIntentosFallidos INT
AS

	BEGIN TRY
	
		BEGIN TRANSACTION

			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
			DECLARE @UsuarioId INT = (SELECT UsuarioId FROM adm.Usuario WHERE Login = @Login)
			
			DECLARE @CantidadIntentosFallidos INT,
					@InicioIntentosFallidos DATETIME,
					@FinIntentosFallidos DATETIME
			
			IF @Tipo = 1
				BEGIN
					SELECT
						@CantidadIntentosFallidos = CantidadIntentosFallidosPassword,
						@InicioIntentosFallidos = InicioIntentosFallidosPassword
					FROM adm.Membresia
					WHERE (adm.Membresia.AplicacionId = @AplicacionId) AND (adm.Membresia.UsuarioId = @UsuarioId)
				END
			ELSE
				BEGIN
					SELECT
						@CantidadIntentosFallidos = CantidadIntentosFallidosPregunta,
						@InicioIntentosFallidos = InicioIntentosFallidosPregunta
					FROM adm.Membresia
					WHERE (adm.Membresia.AplicacionId = @AplicacionId) AND (adm.Membresia.UsuarioId = @UsuarioId)				
				END
				
			SET @FinIntentosFallidos = DATEADD(MINUTE, @IntentosPassword, @InicioIntentosFallidos) 
		
			IF @CantidadIntentosFallidos = 0 OR GETDATE() > @FinIntentosFallidos
				BEGIN
					IF @Tipo = 1
						BEGIN
							UPDATE adm.Membresia SET
								CantidadIntentosFallidosPassword = 1,
								InicioIntentosFallidosPassword = GETDATE()
							WHERE AplicacionId = @AplicacionId AND UsuarioId = @UsuarioId
						END
					ELSE
						BEGIN
							UPDATE adm.Membresia SET
								CantidadIntentosFallidosPregunta = 1,
								InicioIntentosFallidosPregunta = GETDATE()
							WHERE AplicacionId = @AplicacionId AND UsuarioId = @UsuarioId
						END
				END
			ELSE
				BEGIN
					SET @CantidadIntentosFallidos = @CantidadIntentosFallidos + 1
					IF @CantidadIntentosFallidos >= @MaximoIntentosFallidos
						BEGIN
							UPDATE adm.Membresia SET
								EstaBloqueado = 1,
								UltimoBloqueo = GETDATE()
							WHERE AplicacionId = @AplicacionId AND UsuarioId = @UsuarioId
						END
					ELSE
						BEGIN
							IF @Tipo = 1
								BEGIN
									UPDATE adm.Membresia SET
										CantidadIntentosFallidosPassword = @CantidadIntentosFallidos,
										InicioIntentosFallidosPassword = GETDATE()
									WHERE AplicacionId = @AplicacionId AND UsuarioId = @UsuarioId
								END
							ELSE
								BEGIN
									UPDATE adm.Membresia SET
										CantidadIntentosFallidosPregunta = @CantidadIntentosFallidos,
										InicioIntentosFallidosPregunta = GETDATE()
									WHERE AplicacionId = @AplicacionId AND UsuarioId = @UsuarioId
								END						
						END
				END
			
		COMMIT TRANSACTION
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerRolesUsuario]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerRolesUsuario]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ==========================================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 24 de 2011
-- ==========================================================================
CREATE PROCEDURE [adm].[SCISP_ObtenerRolesUsuario]
	@Login NVARCHAR(32),
	@Aplicacion NVARCHAR(256)
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 

			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
			DECLARE @UsuarioId INT = (SELECT UsuarioId FROM adm.Usuario WHERE Login = @Login)

			SELECT adm.Rol.Nombre
			FROM adm.RolUsuario
			INNER JOIN adm.Rol ON adm.RolUsuario.RolId = adm.Rol.RolId
			WHERE (adm.RolUsuario.UsuarioId = @UsuarioId) AND (adm.Rol.AplicacionId = @AplicacionId)
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerRespuestaDeSeguridad]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerRespuestaDeSeguridad]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ======================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 24 de 2011
-- ======================================================
CREATE PROCEDURE [adm].[SCISP_ObtenerRespuestaDeSeguridad]
	@Aplicacion NVARCHAR(256),
	@Login NVARCHAR(32)
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
			DECLARE @UsuarioId INT = (SELECT UsuarioId FROM adm.Usuario WHERE Login = @Login)
					
			SELECT 
				RespuestaPassword, 
				EstaBloqueado
			FROM adm.Membresia
			WHERE UsuarioId = @UsuarioId AND AplicacionId = @AplicacionId			
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_RegistrarUsuariosEnRoles]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_RegistrarUsuariosEnRoles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ========================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 25 de 2011
-- ========================================================
CREATE PROCEDURE [adm].[SCISP_RegistrarUsuariosEnRoles]
	 @Aplicacion NVARCHAR(256),
	 @Usuarios XML,
	 @Roles XML
	
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
			DECLARE @UsuariosLogin TABLE(Login NVARCHAR(32))
			DECLARE @RolesNombre TABLE(Nombre NVARCHAR(128))
			
			INSERT INTO @UsuariosLogin
			SELECT
				P.Elemento.value(''@Login'', ''nvarchar(32)'')
			FROM @Usuarios.nodes(''Usuarios/Usuario'') AS P(Elemento)
			
			INSERT INTO @RolesNombre
			SELECT
				P.Elemento.value(''@Nombre'', ''nvarchar(128)'')
			FROM @Roles.nodes(''Roles/Rol'') AS P(Elemento)
			
			DECLARE @UsuariosId TABLE(UsuarioId INT)
			INSERT INTO @UsuariosId
			SELECT adm.Usuario.UsuarioId
			FROM @UsuariosLogin AS UsuariosLogin
			INNER JOIN adm.Usuario ON UsuariosLogin.Login = adm.Usuario.Login
			
			DECLARE @RolesId TABLE(RolId INT)
			INSERT INTO @RolesId
			SELECT adm.Rol.RolId
			FROM @RolesNombre AS RolesNombre
			INNER JOIN adm.Rol ON RolesNombre.Nombre = adm.Rol.Nombre AND @AplicacionId = adm.Rol.AplicacionId
			
			INSERT INTO adm.RolUsuario(UsuarioId, RolId)
				SELECT UsuariosId.UsuarioId, RolesId.RolId 
				FROM @UsuariosId AS UsuariosId
				CROSS JOIN @RolesId AS RolesId
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_RegistrarUsuario]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_RegistrarUsuario]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ========================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 25 de 2011
-- ========================================================
CREATE PROCEDURE [adm].[SCISP_RegistrarUsuario]
	 @Aplicacion NVARCHAR(256),
	 @ProviderUserKey UNIQUEIDENTIFIER,
	 @Login NVARCHAR(32),
	 @Password CHAR(256),
	 @Email NVARCHAR(256),
	 @PreguntaPassword NVARCHAR(256) = NULL,
	 @RespuestaPassword NVARCHAR(256)  = NULL,
	 @Comentario NVARCHAR(512) = NULL,
	 @UltimaActividad DATETIME,
	 @UltimaSesion DATETIME,
	 @UltimoCambioDePassword DATETIME,
	 @CantidadIntentosFallidosPassword INT,
	 @InicioIntentosFallidosPassword DATETIME,
	 @CantidadIntentosFallidosPregunta INT,
	 @InicioIntentosFallidosPregunta DATETIME,
	 @EstaAprobado BIT,
	 @EstaBloqueado BIT,
	 @UltimoBloqueo DATETIME,
	 @Registrado DATETIME
	
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)	
			DECLARE @UsuarioId INT = (SELECT UsuarioId FROM adm.Usuario WHERE Login = @Login)	
			
			IF @UsuarioId IS NULL
				BEGIN
					INSERT INTO adm.Usuario(Login, ProviderUserKey)
					VALUES(@Login, @ProviderUserKey)
					
					SET @UsuarioId = SCOPE_IDENTITY()				
				END
											
			INSERT INTO adm.Membresia ( AplicacionId, 
										UsuarioId, 
										Password, 
										Email, 
										PreguntaPassword, 
										RespuestaPassword, 
										Comentario, 
										UltimaActividad, 
										UltimaSesion, 
										UltimoCambioDePassword, 
										CantidadIntentosFallidosPassword, 
										InicioIntentosFallidosPassword, 
										CantidadIntentosFallidosPregunta,
										InicioIntentosFallidosPregunta, 
										EstaAprobado, 
										EstaBloqueado, 
										UltimoBloqueo, 
										Registrado)
			VALUES  (@AplicacionId, 
					@UsuarioId, 
					@Password, 
					@Email, 
					@PreguntaPassword, 
					@RespuestaPassword, 
					@Comentario, 
					@UltimaActividad, 
					@UltimaSesion, 
					@UltimoCambioDePassword, 
					@CantidadIntentosFallidosPassword, 
					@InicioIntentosFallidosPassword, 
					@CantidadIntentosFallidosPregunta,
					@InicioIntentosFallidosPregunta, 
					@EstaAprobado, 
					@EstaBloqueado, 
					@UltimoBloqueo, 
					@Registrado)
			
			EXEC	[adm].[SCISP_ObtenerUsuarioPorLogin]
						@Login =  @Login,
						@Aplicacion =  @Aplicacion,
						@EstaEnLinea = false
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ObtenerPerfilUsuario]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ObtenerPerfilUsuario]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ===========================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 30 de 2011
-- ===========================================================
CREATE PROCEDURE [adm].[SCISP_ObtenerPerfilUsuario]
	@Aplicacion NVARCHAR(256),
	@Login NVARCHAR(32),
	@SoloActividad BIT,
	@EstaAutenticado BIT
	
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
					
			DECLARE @UsuarioId INT = (SELECT UsuarioId FROM adm.Usuario WHERE Login = @Login)
						
			SELECT 
				Nombre AS Propiedad,
				Valor
			FROM adm.ValorPropiedad
			INNER JOIN adm.Propiedad ON adm.ValorPropiedad.PropiedadId = adm.Propiedad.PropiedadId
			WHERE (UsuarioId = @UsuarioId)
			
			EXEC	adm.SCISP_ActualizarUltimaActividadPerfil
					@Login = @Login,
					@Aplicacion = @Aplicacion,
					@SoloActividad = @SoloActividad,
					@EstaAutenticado = @EstaAutenticado
			
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ValidarUsuario]    Script Date: 02/07/2012 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ValidarUsuario]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 24 de 2011
-- ================================================
CREATE PROCEDURE [adm].[SCISP_ValidarUsuario]
	@Aplicacion NVARCHAR(256),
	@Login NVARCHAR(32),
	@Password NVARCHAR(256),	
	@IntentosPassword INT,
	@MaximoIntentosFallidos INT
AS
	BEGIN TRY
	
		BEGIN TRANSACTION

			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
			DECLARE @UsuarioId INT = (SELECT UsuarioId FROM adm.Usuario WHERE Login = @Login)
			
			DECLARE @DBPassword NVARCHAR(256) = NULL,
					@EstaAprobado BIT = 0,
					@EstaBloqueado BIT = 0,
					@EsValido BIT = 0
			
			SELECT 
				@DBPassword = Password,
				@EstaAprobado = EstaAprobado,
				@EstaBloqueado = EstaBloqueado
			FROM adm.Membresia
			WHERE UsuarioId = @UsuarioId AND AplicacionId = @AplicacionId
			
			IF @DBPassword IS NOT NULL
				BEGIN
					IF @Password = @DBPassword
						BEGIN
							IF @EstaAprobado = 1 AND @EstaBloqueado = 0
								BEGIN
									UPDATE adm.Membresia SET
										UltimaActividad = GETDATE()
									WHERE adm.Membresia.AplicacionId = @AplicacionId AND adm.Membresia.UsuarioId =  @UsuarioId
									
									SET @EsValido = 1
								END
						END
					ELSE
						BEGIN
							EXEC adm.SCISP_ActualizarIntentosFallidos
									@Aplicacion = @Aplicacion,
									@Login = @Login,
									@Tipo = 1,
									@IntentosPassword = @IntentosPassword,
									@MaximoIntentosFallidos = @MaximoIntentosFallidos														
						END
				END
				
			SELECT @EsValido AS N''EsValido''
					
		COMMIT TRANSACTION
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_ResetearPasswordUsuario]    Script Date: 02/07/2012 11:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_ResetearPasswordUsuario]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ======================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 24 de 2011
-- ======================================================
CREATE PROCEDURE [adm].[SCISP_ResetearPasswordUsuario]
	@Aplicacion NVARCHAR(256),
	@Login NVARCHAR(32),
	@NuevoPassword NVARCHAR(256),
	@Respuesta NVARCHAR(256),
	@IntentosPassword INT,
	@MaximoIntentosFallidos INT	
	
AS
	BEGIN TRY
	
		BEGIN TRANSACTION 
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
			DECLARE @UsuarioId INT = (SELECT UsuarioId FROM adm.Usuario WHERE Login = @Login)
		
			DECLARE @Resultado INT = 0, --Password Reestablecido
					@DBRespuesta NVARCHAR(256) = NULL,
					@EstaBloqueado BIT = 0
		
			IF @UsuarioId IS NULL
				BEGIN
					SET @Resultado = 1 --Usuario no existe.
				END
			ELSE
				BEGIN
					SELECT
						@DBRespuesta = RespuestaPassword,
						@EstaBloqueado = EstaBloqueado
					FROM adm.Membresia
					WHERE (AplicacionId = @AplicacionId) AND (UsuarioId= @UsuarioId) 
						
					IF @EstaBloqueado = 1
						BEGIN
							SET @Resultado = 2 --Está bloqueado.
						END
					ELSE
						BEGIN
							IF @DBRespuesta IS NULL
								BEGIN
									SET @Resultado = 3 --La respuesta es [NULL].
								END
							ELSE
								BEGIN
									IF @Respuesta = @DBRespuesta							
										BEGIN
											UPDATE adm.Membresia
											SET
												Password = @NuevoPassword,
												UltimoCambioDePassword = GETDATE()
											WHERE (UsuarioId= @UsuarioId) AND (AplicacionId = @AplicacionId)								
										END
									ELSE
										BEGIN
											SET @Resultado = 4 --La respuesta no coincide.
											EXEC adm.SCISP_ActualizarIntentosFallidos
													@Aplicacion = @Aplicacion,
													@Login = @Login,
													@Tipo = 2,
													@IntentosPassword = @IntentosPassword,
													@MaximoIntentosFallidos = @MaximoIntentosFallidos									
										END
								END							
						END									
				END
			
			SELECT @Resultado AS N''Resultado''
				
		COMMIT
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  StoredProcedure [adm].[SCISP_RegistrarValorPropiedad]    Script Date: 02/07/2012 11:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[SCISP_RegistrarValorPropiedad]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ========================================================
-- Author		: Jhonnys López Celedon
-- Create date	: Julio 25 de 2011
-- ========================================================
CREATE PROCEDURE [adm].[SCISP_RegistrarValorPropiedad]
	 @Aplicacion NVARCHAR(256),
	 @Login NVARCHAR(32),
	 @Propiedades XML,
	 @SoloActividad BIT,
	 @EstaAutenticado BIT
	
AS
	BEGIN TRY
	
		BEGIN TRANSACTION
		
			DECLARE @AplicacionId INT = (SELECT AplicacionId FROM adm.Aplicacion WHERE Nombre = @Aplicacion)
			DECLARE @UsuarioId INT = (SELECT UsuarioId FROM adm.Usuario WHERE Login = @Login)
			DECLARE @PerfilId INT = (SELECT PerfilId FROM adm.Perfil WHERE (UsuarioId = @UsuarioId) AND (AplicacionId = @AplicacionId))
			DECLARE @Fecha DATETIME = GETDATE()
			DECLARE @ValoresPropiedad TABLE(Nombre NVARCHAR(64), Tipo NVARCHAR(64), ValorPropiedad NVARCHAR(MAX))
			
			INSERT INTO @ValoresPropiedad
			SELECT
				P.Elemento.value(''@Nombre''        , ''nvarchar(64)''), 
				P.Elemento.value(''@Tipo''          , ''nvarchar(64)''), 
				P.Elemento.value(''@ValorPropiedad'', ''nvarchar(max)'')
			FROM @Propiedades.nodes(''Propiedades/Propiedad'') AS P(Elemento)

			INSERT INTO adm.Propiedad(Nombre, Tipo)
				SELECT Nombre, Tipo
				FROM @ValoresPropiedad
				WHERE Nombre NOT IN (SELECT Nombre FROM adm.Propiedad)

			INSERT INTO adm.ValorPropiedad(PropiedadId, UsuarioId, Valor)
			SELECT 
				adm.Propiedad.PropiedadId,
				@UsuarioId AS UsuarioId,
				N''''
			FROM @ValoresPropiedad AS ValorPropiedades
			INNER JOIN adm.Propiedad ON ValorPropiedades.Nombre = adm.Propiedad.Nombre 
			WHERE PropiedadId NOT IN (SELECT PropiedadId FROM adm.ValorPropiedad WHERE UsuarioId = @UsuarioId)

			UPDATE adm.ValorPropiedad SET Valor = ValorPropiedades.ValorPropiedad
			FROM (SELECT PropiedadId, ValorPropiedad
				  FROM @ValoresPropiedad AS ValorPropiedades
				  INNER JOIN adm.Propiedad ON ValorPropiedades.Nombre = adm.Propiedad.Nombre) AS ValorPropiedades
			WHERE UsuarioId = @UsuarioId AND adm.ValorPropiedad.PropiedadId = ValorPropiedades.PropiedadId
			
			IF @PerfilId IS NULL
				BEGIN
					INSERT INTO adm.Perfil (AplicacionId, UltimaActividad, UltimaActualizacion, UsuarioId)
					VALUES (@AplicacionId, @Fecha, @Fecha, @UsuarioId)
				END
			ELSE
				BEGIN
					EXEC	adm.SCISP_ActualizarUltimaActividadPerfil
							@Login = @Login,
							@Aplicacion = @Aplicacion,
							@SoloActividad = @SoloActividad,
							@EstaAutenticado = @EstaAutenticado			
				END

		COMMIT TRANSACTION
		
	END TRY
	
	BEGIN CATCH
		
		IF @@TRANCOUNT > 0 ROLLBACK
		
		DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT
		SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY()
		
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
		
	END CATCH
' 
END
GO
/****** Object:  ForeignKey [FK_ValorPropiedad_Propiedad]    Script Date: 02/07/2012 11:04:37 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_ValorPropiedad_Propiedad]') AND parent_object_id = OBJECT_ID(N'[adm].[ValorPropiedad]'))
ALTER TABLE [adm].[ValorPropiedad]  WITH CHECK ADD  CONSTRAINT [FK_ValorPropiedad_Propiedad] FOREIGN KEY([PropiedadId])
REFERENCES [adm].[Propiedad] ([PropiedadId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_ValorPropiedad_Propiedad]') AND parent_object_id = OBJECT_ID(N'[adm].[ValorPropiedad]'))
ALTER TABLE [adm].[ValorPropiedad] CHECK CONSTRAINT [FK_ValorPropiedad_Propiedad]
GO
/****** Object:  ForeignKey [FK_ValorPropiedad_Usuario]    Script Date: 02/07/2012 11:04:37 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_ValorPropiedad_Usuario]') AND parent_object_id = OBJECT_ID(N'[adm].[ValorPropiedad]'))
ALTER TABLE [adm].[ValorPropiedad]  WITH CHECK ADD  CONSTRAINT [FK_ValorPropiedad_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [adm].[Usuario] ([UsuarioId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_ValorPropiedad_Usuario]') AND parent_object_id = OBJECT_ID(N'[adm].[ValorPropiedad]'))
ALTER TABLE [adm].[ValorPropiedad] CHECK CONSTRAINT [FK_ValorPropiedad_Usuario]
GO
/****** Object:  ForeignKey [FK_Perfil_Aplicacion]    Script Date: 02/07/2012 11:04:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_Perfil_Aplicacion]') AND parent_object_id = OBJECT_ID(N'[adm].[Perfil]'))
ALTER TABLE [adm].[Perfil]  WITH CHECK ADD  CONSTRAINT [FK_Perfil_Aplicacion] FOREIGN KEY([AplicacionId])
REFERENCES [adm].[Aplicacion] ([AplicacionId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_Perfil_Aplicacion]') AND parent_object_id = OBJECT_ID(N'[adm].[Perfil]'))
ALTER TABLE [adm].[Perfil] CHECK CONSTRAINT [FK_Perfil_Aplicacion]
GO
/****** Object:  ForeignKey [FK_Perfil_Usuario]    Script Date: 02/07/2012 11:04:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_Perfil_Usuario]') AND parent_object_id = OBJECT_ID(N'[adm].[Perfil]'))
ALTER TABLE [adm].[Perfil]  WITH CHECK ADD  CONSTRAINT [FK_Perfil_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [adm].[Usuario] ([UsuarioId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_Perfil_Usuario]') AND parent_object_id = OBJECT_ID(N'[adm].[Perfil]'))
ALTER TABLE [adm].[Perfil] CHECK CONSTRAINT [FK_Perfil_Usuario]
GO
/****** Object:  ForeignKey [FK_Membresia_Aplicacion]    Script Date: 02/07/2012 11:04:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_Membresia_Aplicacion]') AND parent_object_id = OBJECT_ID(N'[adm].[Membresia]'))
ALTER TABLE [adm].[Membresia]  WITH CHECK ADD  CONSTRAINT [FK_Membresia_Aplicacion] FOREIGN KEY([AplicacionId])
REFERENCES [adm].[Aplicacion] ([AplicacionId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_Membresia_Aplicacion]') AND parent_object_id = OBJECT_ID(N'[adm].[Membresia]'))
ALTER TABLE [adm].[Membresia] CHECK CONSTRAINT [FK_Membresia_Aplicacion]
GO
/****** Object:  ForeignKey [FK_Membresia_Usuario]    Script Date: 02/07/2012 11:04:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_Membresia_Usuario]') AND parent_object_id = OBJECT_ID(N'[adm].[Membresia]'))
ALTER TABLE [adm].[Membresia]  WITH CHECK ADD  CONSTRAINT [FK_Membresia_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [adm].[Usuario] ([UsuarioId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_Membresia_Usuario]') AND parent_object_id = OBJECT_ID(N'[adm].[Membresia]'))
ALTER TABLE [adm].[Membresia] CHECK CONSTRAINT [FK_Membresia_Usuario]
GO
/****** Object:  ForeignKey [FK_RolUsuario_Rol]    Script Date: 02/07/2012 11:04:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_RolUsuario_Rol]') AND parent_object_id = OBJECT_ID(N'[adm].[RolUsuario]'))
ALTER TABLE [adm].[RolUsuario]  WITH CHECK ADD  CONSTRAINT [FK_RolUsuario_Rol] FOREIGN KEY([RolId])
REFERENCES [adm].[Rol] ([RolId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_RolUsuario_Rol]') AND parent_object_id = OBJECT_ID(N'[adm].[RolUsuario]'))
ALTER TABLE [adm].[RolUsuario] CHECK CONSTRAINT [FK_RolUsuario_Rol]
GO
/****** Object:  ForeignKey [FK_RolUsuario_Usuario]    Script Date: 02/07/2012 11:04:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_RolUsuario_Usuario]') AND parent_object_id = OBJECT_ID(N'[adm].[RolUsuario]'))
ALTER TABLE [adm].[RolUsuario]  WITH CHECK ADD  CONSTRAINT [FK_RolUsuario_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [adm].[Usuario] ([UsuarioId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_RolUsuario_Usuario]') AND parent_object_id = OBJECT_ID(N'[adm].[RolUsuario]'))
ALTER TABLE [adm].[RolUsuario] CHECK CONSTRAINT [FK_RolUsuario_Usuario]
GO
/****** Object:  ForeignKey [FK_RolPropiedad_Propiedad]    Script Date: 02/07/2012 11:04:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_RolPropiedad_Propiedad]') AND parent_object_id = OBJECT_ID(N'[adm].[RolPropiedad]'))
ALTER TABLE [adm].[RolPropiedad]  WITH CHECK ADD  CONSTRAINT [FK_RolPropiedad_Propiedad] FOREIGN KEY([PropiedadId])
REFERENCES [adm].[Propiedad] ([PropiedadId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_RolPropiedad_Propiedad]') AND parent_object_id = OBJECT_ID(N'[adm].[RolPropiedad]'))
ALTER TABLE [adm].[RolPropiedad] CHECK CONSTRAINT [FK_RolPropiedad_Propiedad]
GO
/****** Object:  ForeignKey [FK_RolPropiedad_Rol]    Script Date: 02/07/2012 11:04:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_RolPropiedad_Rol]') AND parent_object_id = OBJECT_ID(N'[adm].[RolPropiedad]'))
ALTER TABLE [adm].[RolPropiedad]  WITH CHECK ADD  CONSTRAINT [FK_RolPropiedad_Rol] FOREIGN KEY([RolId])
REFERENCES [adm].[Rol] ([RolId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[adm].[FK_RolPropiedad_Rol]') AND parent_object_id = OBJECT_ID(N'[adm].[RolPropiedad]'))
ALTER TABLE [adm].[RolPropiedad] CHECK CONSTRAINT [FK_RolPropiedad_Rol]
GO
