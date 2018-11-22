using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaEquivalencias.AdministradorSistema;
using SistemaEquivalencias.AdministradorSistema.Servicios;

namespace SistemaEquivalencias.AdministradorSistema
{
    public partial class FacultadForm : System.Web.UI.Page
    {
        FacultadService facultad = new FacultadService();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            if (facultad.InsertarDatosFacultad(TbxNombre.Text))
            {
                LblMensaje.CssClass = "col-md-offset-2 col-md-9 text-success";
                LblMensaje.ForeColor.Equals("Green");
                LblMensaje.Text = facultad.GetMensaje();
                TbxNombre.Text = "";
            }
            else
            {
                LblMensaje.CssClass = "col-md-offset-2 col-md-9 text-danger";
                LblMensaje.ForeColor.Equals("Red");
                LblMensaje.Text = facultad.GetMensaje();
                TbxNombre.Text = "";
            }

        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Response.Redirect("FacultadForm");
            }
        }
    }
}