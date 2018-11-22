using SistemaEquivalencias.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaEquivalencias.ProSolicEs_NuevoIngreso
{
    public partial class FormularioAlumnoExterno : System.Web.UI.Page
    {
        EquivalenciasDataContext miBD = new EquivalenciasDataContext();

        ClaseAlumnoExterno clext = new ClaseAlumnoExterno();
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            //Usando la clase ClaseAlumnoExterno
            string msj = clext.InsertarEstudianteExterno(this.txt_Nombres.Text, this.txt_Apellidos.Text, this.ddl_TipoDocumento.SelectedValue,
            NumDoc(), this.txt_Telefono.Text, this.ddl_EstadoCivil.SelectedValue, Convert.ToDateTime(this.txt_FechaNacimiento.Text),
            this.rb_Sexo.SelectedValue, Convert.ToInt32(this.ddl_UnivProcedencia.SelectedValue), Convert.ToInt32(this.ddl_Carrera.SelectedValue),
            this.txt_Email.Text, this.txt_Comentario.Text, true);

            Pnl_ConfirmAlumnoExt.Visible = true;
            Pnl_FormAlumnoExterno.Visible = false;           
        }
        public string NumDoc()
        {
            string num_doc = txt_Dui.Text;
            //Codigo de inserción de número de documento de alumnos a la BD                       
            switch (ddl_TipoDocumento.SelectedValue)
            {
                case "DUI":
                    num_doc = txt_Dui.Text;
                    break;
                case "NIT":
                    num_doc = txt_Nit.Text;
                    break;
                case "CMenoridad":
                    num_doc = txt_cMinoridad.Text;
                    break;
                case "Pasaporte":
                    num_doc = txt_Pasaporte.Text;
                    break;
            }
            return num_doc;
        }
        protected void ddl_TipoDocumento_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (ddl_TipoDocumento.SelectedValue)
            {
                case "":
                    div_Dui.Visible = false;
                    txt_Dui.Text = "";
                    div_Nit.Visible = false;
                    txt_Nit.Text = "";
                    div_Cminoridad.Visible = false;
                    txt_cMinoridad.Text = "";
                    div_Pasaporte.Visible = false;
                    txt_Pasaporte.Text = "";
                    break;
                case "DUI":
                    div_Dui.Visible = true;
                    txt_Dui.Focus();
                    div_Nit.Visible = false;
                    txt_Nit.Text = "";
                    div_Cminoridad.Visible = false;
                    txt_cMinoridad.Text = "";
                    div_Pasaporte.Visible = false;
                    txt_Pasaporte.Text = "";
                    break;
                case "NIT":
                    div_Dui.Visible = false;
                    txt_Dui.Text = "";
                    div_Nit.Visible = true;
                    txt_Nit.Focus();
                    div_Cminoridad.Visible = false;
                    txt_cMinoridad.Text = "";
                    div_Pasaporte.Visible = false;
                    txt_Pasaporte.Text = "";
                    break;
                case "Pasaporte":
                    div_Dui.Visible = false;
                    txt_Dui.Text = "";
                    div_Nit.Visible = false;
                    txt_Nit.Text = "";
                    div_Cminoridad.Visible = false;
                    txt_cMinoridad.Text = "";
                    div_Pasaporte.Visible = true;
                    txt_Pasaporte.Focus();
                    break;
                case "CMinoridad":
                    div_Dui.Visible = false;
                    txt_Dui.Text = "";
                    div_Nit.Visible = false;
                    txt_Nit.Text = "";
                    div_Cminoridad.Visible = true;
                    div_Pasaporte.Visible = false;
                    txt_Pasaporte.Text = "";
                    break;
            }
        }
        protected void Cb_AlumnoInterno_CheckedChanged(object sender, EventArgs e)
        {
            if (Cb_AlumnoInterno.Checked == true)
            {
                Response.Redirect("~/ProSolicEs_NuevoIngreso/FormularioAlumnoInterno");
            }
        }
        protected void btn_Exito_Click(object sender, EventArgs e)
        {
            Response.Redirect("../ProSolicEs_NuevoIngreso/Default");
        }    
    }
}