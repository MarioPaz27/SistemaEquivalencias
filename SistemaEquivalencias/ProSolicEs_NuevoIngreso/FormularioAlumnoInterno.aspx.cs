using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaEquivalencias.ProSolicEs_NuevoIngreso
{
    public partial class FormularioAlumnoInterno : System.Web.UI.Page
    {
        EquivalenciasDataContext miBD = new EquivalenciasDataContext();
        ClaseAlumnoInterno clint = new ClaseAlumnoInterno();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Cb_AlumnoInt_CheckedChanged(object sender, EventArgs e)
        {
            if (Cb_AlumnoInt.Checked == true)
            {
                Response.Redirect("~/ProSolicEs_NuevoIngreso/FormularioAlumnoExterno");
            }
        }

        protected void btn_Guardar_Click(object sender, EventArgs e)
        {
            //Usando la clase ClaseAlumnoInterno
            string msj = clint.InsertarEstudianteInterno(this.txt_Nombres.Text, this.txt_Apellidos.Text, this.txt_Carnet.Text, this.txt_Telefono.Text,
                this.ddl_EstadoCivil.SelectedValue, Convert.ToDateTime(this.txt_FechaNacimiento.Text), null,
                Convert.ToInt32(this.ddl_CarrerasInternas.SelectedValue), this.txt_Email.Text, this.txt_Comentario.Text, true,
                this.rb_Sexo.SelectedValue);

            Pnl_ConfirmAlumnoInt.Visible = true;
            Pnl_FormAlumnoInterno.Visible = false;        
        }     
        protected void btn_Exito_Click(object sender, EventArgs e)
        {
            Response.Redirect("../ProSolicEs_NuevoIngreso/Default");
        }
    }
}