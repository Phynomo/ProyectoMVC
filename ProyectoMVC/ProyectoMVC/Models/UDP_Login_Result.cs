//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProyectoMVC.Models
{
    using System;
    
    public partial class UDP_Login_Result
    {
        public int usu_Id { get; set; }
        public string usu_Usuario { get; set; }
        public string usu_Contrasenia { get; set; }
        public int emp_Id { get; set; }
        public string emp_Nombre { get; set; }
        public int usu_UsuarioCreacion { get; set; }
        public System.DateTime usu_FechaCreacion { get; set; }
        public Nullable<int> usu_UsuarioModificacion { get; set; }
        public Nullable<System.DateTime> usu_FechaModificacion { get; set; }
        public bool usu_Estado { get; set; }
    }
}
