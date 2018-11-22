using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using SistemaEquivalencias.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaEquivalencias.AdministradorSistema
{
    public partial class RolesUsuarios : System.Web.UI.Page
    {
        ApplicationDbContext RolesBD = new ApplicationDbContext();
        EquivalenciasDataContext rol = new EquivalenciasDataContext();
        RoleManager<IdentityRole> adminRoles = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(new ApplicationDbContext()));
        IdentityResult roleResultado;
        UserManager adminUsers = new UserManager();
        public string miPerfil;

        public void Page_Load()
        {
            Msg.Text = "";
            Lbl_Mensaje1.Text = "";
            if (!IsPostBack)
            {
                //llenar el listbox de Roles
                var misroles = (from rol in RolesBD.Roles select rol.Name).ToList();
                ListBoxRoles.DataSource = misroles;
                ListBoxRoles.DataBind();

                var misusers = (from usr in RolesBD.Users select usr.UserName).ToList();
                ListBoxUser.DataSource = misusers;
                ListBoxUser.DataBind();
            }

            if (ListBoxRoles.SelectedItem != null)
            {
                //Cargar todos los usuarios que pertenecen al Rol seleccionado
                CargarRolesUsuarios();
            }

            var usuario = Context.User.Identity.GetUserId();
            if (usuario == null)
            {
                Response.Redirect("~/Account/Login.aspx");
            }

            SacarMiRole(usuario);
        }

        protected void SacarMiRole(string idUsuario)
        {
            var miRole = (from rol in RolesBD.Roles select rol).ToList();
            foreach (var losroles in miRole)
            {
                if (adminUsers.IsInRole(idUsuario, losroles.Name))
                {
                    miPerfil = losroles.Name.ToString();
                }
            }
            if (miPerfil != "Administrador")
            {
                Response.Redirect("~/");
            }
        }
        public void Btn_Cambiar_OnClick(object sender, EventArgs e)
        {
            if (ListBoxRoles.SelectedItem == null)
            {
                Msg.Text = "Debe seleccionar un Nivel de la lista";
                return;
            }
            if (ListBoxUser.SelectedItem == null)
            {
                Msg.Text = "Debe seleccionar un Usuario de la lista";
                return;
            }

            string nombreUser = ListBoxUser.SelectedValue.ToString();
            var idUser = (from u in RolesBD.Users where u.UserName.Equals(nombreUser) select u).FirstOrDefault();
            //Instruccion para agregar el usuario seleccionado al Role seleccionado
            adminUsers.AddToRole(idUser.Id, ListBoxRoles.SelectedValue.ToString());
            Lbl_Mensaje1.Text = "Usuario " + nombreUser + " agregado con exito al role " + ListBoxRoles.SelectedValue.ToString();
            CargarRolesUsuarios();
        }

        protected void UsersInRoleGridView_RemoveFromRole(object sender, GridViewCommandEventArgs args)
        {
            int fila = Convert.ToInt32(args.CommandArgument);
            string nombreUser = UsersInRoleGridview.Rows[fila].Cells[0].Text.ToString();

            var idUser = (from u in RolesBD.Users where u.UserName.Equals(nombreUser) select u).FirstOrDefault();
            adminUsers.RemoveFromRole(idUser.Id, ListBoxRoles.SelectedValue.ToString());
            Lbl_Mensaje1.Text = "Usuario " + nombreUser + " removido con exito del Nivel " + ListBoxRoles.SelectedValue.ToString();

            CargarRolesUsuarios();
        }

        protected void CargarRolesUsuarios()
        {
            string nombrerole = this.ListBoxRoles.SelectedValue.ToString();
            var misroles = (from rol in RolesBD.Roles where rol.Name.Contains(nombrerole) select rol).FirstOrDefault();
            var usersinRoles = RolesBD.Users.Where(x => x.Roles.Select(y => y.RoleId).Contains(misroles.Id)).ToList();
            if (usersinRoles.Count == 0)
            {
                Msg.Text = "No hay usuarios en el Nivel seleccionado " + nombrerole;
            }

            this.UsersInRoleGridview.DataSource = usersinRoles;
            this.UsersInRoleGridview.DataBind();

        }

        //Seccion para eliminacion de roles en la pagina

        protected void Agregar_Click(object sender, EventArgs e)
        {
            string createRole = NewRol.Text;
            if (NewRol.Text.Equals(""))
            {
                Lbl_Mensaje2.Text = "Por favor ingrese información a la caja de texto!!";

            }
            else
            {
                try
                {
                    if (adminRoles.RoleExists(createRole))
                    {
                        Msg.Text = "Rol " + Server.HtmlEncode(createRole) + " YA existe. Especifique uno nuevo.";
                        return;
                    }
                    //Crear el Role nuevo
                    roleResultado = adminRoles.Create(new IdentityRole(createRole));
                    Lbl_Mensaje3.Text = "Rol " + Server.HtmlEncode(createRole) + " Creado con exito";
                    SacarRoles();
                }
                catch (Exception ex)
                {
                    Lbl_Mensaje2.Text = "Rol " + Server.HtmlEncode(createRole) + " no se pudo crear " + ex;
                }
            }
        }

        protected void SacarRoles()
        {
            //Llenar el grid con Roles
            var misroles = (from r in RolesBD.Roles select r.Name).ToList();
            RolesGrid.DataSource = misroles;
            RolesGrid.DataBind();
            if (RolesGrid.Rows.Count <= 0)
            {
                Msg.Text = "No hay Roles";
                return;
            }
        }
    }
}