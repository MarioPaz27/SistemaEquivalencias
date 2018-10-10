using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using SistemaEquivalencias;
using System.Linq;
using SistemaEquivalencias.Models;

namespace SistemaEquivalencias
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        public String miPerfil;

        ApplicationDbContext role = new ApplicationDbContext();
        UserManager adminUsers = new UserManager();
        protected void Page_Init(object sender, EventArgs e)
        {
            // El código siguiente ayuda a proteger frente a ataques XSRF
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Utilizar el token Anti-XSRF de la cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generar un nuevo token Anti-XSRF y guardarlo en la cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Establecer token Anti-XSRF
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validar el token Anti-XSRF
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Error de validación del token Anti-XSRF.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            var usuario = Context.User.Identity.GetUserId();
            if (usuario == null)
            {
                Response.Redirect("~/Index");
            }
            SacarMiRole(usuario);
            CargarMenu(miPerfil);
        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
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
            if (prmRole == "Administrador")
            {
                this.topnavAdmin.Visible = true;
                this.topnavNI.Visible = false;
                this.topnavEquiv.Visible = false;
                this.topnav.Visible = false;
            }
            else
            {
                if (prmRole == "Equivalencias")
                {
                    this.topnavAdmin.Visible = false;
                    this.topnavNI.Visible = false;
                    this.topnavEquiv.Visible = true;
                    this.topnav.Visible = false;
                }
                else if(prmRole == "NuevoIngreso")
                {
                    this.topnavAdmin.Visible = false;
                    this.topnavNI.Visible = true;
                    this.topnavEquiv.Visible = false;
                    this.topnav.Visible = false;
                }
                else
                {
                    this.topnavAdmin.Visible = false;
                    this.topnavNI.Visible = false;
                    this.topnavEquiv.Visible = false;
                    this.topnav.Visible = false;
                }
            }
        }
    }

}