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
    using System.Collections.Generic;
    
    public partial class VW_ClientesIndex
    {
        public int cli_Id { get; set; }
        public string cli_Nombre { get; set; }
        public string cli_Apellido { get; set; }
        public string cli_Telefono { get; set; }
        public string cli_CorreoElectronico { get; set; }
        public decimal cli_saldo { get; set; }
        public decimal cli_LimiteCredito { get; set; }
        public decimal cli_Descuento { get; set; }
        public System.DateTime cli_FechaCreacion { get; set; }
        public int cli_UsuarioCreacion { get; set; }
        public Nullable<System.DateTime> cli_FechaModificacion { get; set; }
        public Nullable<int> cli_UsuarioModificacion { get; set; }
        public bool cli_Estado { get; set; }
    }
}
