using Microsoft.AspNet.Identity;
using SistemaEquivalencias.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaEquivalencias.ProSolicEs_NuevoIngreso
{
    public partial class Default : System.Web.UI.Page
    {
        public String miPerfil;

        ApplicationDbContext role = new ApplicationDbContext();
        UserManager adminUsers = new UserManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            var usuario = Context.User.Identity.GetUserId();
            if (usuario == null)
            {
                Response.Redirect("~/Account/Login.aspx");
            }

            SacarMiRole(usuario);
            CargarMenu(miPerfil);
        }

        protected void SacarMiRole(string idUsuario)
        {
            var miRole = (from rol in role.Roles select rol).ToList();
            foreach (var losroles in miRole)
            {
                if (adminUsers.IsInRole(idUsuario, losroles.Name))
                {
                    miPerfil = losroles.Name.ToString();
                }
            }
        }

        protected void CargarMenu(string prmRole)
        {
            //if (prmRole == "Administrador")
            //{
            //    this.Menu1.Visible = true;
            //    this.Menu2.Visible = false;
            //}
            //else
            //{
            //    if (prmRole == "Consulta")
            //    {
            //        this.Menu2.Visible = true;
            //        this.Menu1.Visible = false;
            //    }
            //    else
            //    {
            //        this.Menu1.Visible = false;
            //        this.Menu2.Visible = false;
            //    }
            //}
        }
    }
}