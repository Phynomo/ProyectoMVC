
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
    
public partial class tbEmpleados
{

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public tbEmpleados()
    {

        this.tbUsuarios2 = new HashSet<tbUsuarios>();

        this.tbPedidos = new HashSet<tbPedidos>();

    }


    public int emp_Id { get; set; }

    public string emp_Nombre { get; set; }

    public string emp_Apellido { get; set; }

    public string emp_Sexo { get; set; }

    public string mun_Id { get; set; }

    public string emp_DireccionExacta { get; set; }

    public string estciv_Id { get; set; }

    public string emp_Telefono { get; set; }

    public string emp_CorreoElectronico { get; set; }

    public System.DateTime emp_FechaNacimiento { get; set; }

    public System.DateTime emp_FechaContratacion { get; set; }

    public int car_Id { get; set; }

    public System.DateTime emp_FechaCreacion { get; set; }

    public int emp_UsuarioCreacion { get; set; }

    public Nullable<System.DateTime> emp_FechaModificacion { get; set; }

    public Nullable<int> emp_UsuarioModificacion { get; set; }

    public bool emp_Estado { get; set; }



    public virtual tbCargos tbCargos { get; set; }

    public virtual tbEstadosCiviles tbEstadosCiviles { get; set; }

    public virtual tbMunicipios tbMunicipios { get; set; }

    public virtual tbUsuarios tbUsuarios { get; set; }

    public virtual tbUsuarios tbUsuarios1 { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<tbUsuarios> tbUsuarios2 { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<tbPedidos> tbPedidos { get; set; }

}

}
