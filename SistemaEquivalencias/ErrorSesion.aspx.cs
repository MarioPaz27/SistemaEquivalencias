using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaEquivalencias
{
    public partial class ErrorSesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String rol = Request.QueryString["parameter"];
            if (rol != "Administrador")
            {
                Lbl_Mensaje.Text = "Acceso Denegado, su rol es "+rol+" e intenta iniciar " +
                    "sesion como Adminsitrador";
            }
            if (rol != "Equivalencias")
            {
                Lbl_Mensaje.Text = "Acceso Denegado, su rol es "+rol+" e intenta iniciar " +
                    "sesion como Equivalencias";
            }
            if (rol != "NuevoIngreso")
            {
                Lbl_Mensaje.Text = "Acceso Denegado, su rol es "+rol+" e intenta iniciar " +
                    "sesion como Nuevo Ingreso";
            }
        }

        protected void Btn_Enviar_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["parameter"] == "Administrador")
            {
                Response.Redirect("~/AdministradorSistema/");
            }
            if (Request.QueryString["parameter"] == "Equivalencias")
            {
                Response.Redirect("~/AdministradorSistema/");
            }
            if (Request.QueryString["parameter"] == "NuevoIngreso")
            {
                Response.Redirect("~/AdministradorSistema/");
            }
        }
    }
}