using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using SistemaEquivalencias.Models;

namespace SistemaEquivalencias.Account
{
    public partial class Login : Page
    {
        private String roleParameter;
        private String menu;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["parameter"] == "nuevoIngreso")
            {
                roleParameter = "nuevoIngreso";
                lbl_Test.Text = "Este Inicio de Sesión es únicamente para Nuevo Ingreso";
                menu = "~/ProSolicEs_NuevoIngreso/";
            }

            if (Request.QueryString["parameter"] == "equivalencias")
            {
                roleParameter = "equivalencias";
                lbl_Test.Text = "Este Inicio de Sesión es únicamente para Equivalencias";
                menu = "~/ProcEva-Otor_Equivalencias/";
            }

            if (Request.QueryString["parameter"] == "managerRole")
            {
                roleParameter = "managerRole";
                lbl_Test.Text = "Este Inicio de Sesión es únicamente para el Administrador";
            }

            
            //RegisterHyperLink.NavigateUrl = "Register";
            //// Habilite esta opción una vez tenga la confirmación de la cuenta habilitada para la funcionalidad de restablecimiento de contraseña
            ////ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            //OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            //var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            //if (!String.IsNullOrEmpty(returnUrl))
            //{
            //    RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            //}
        }

        protected void LogIn(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Validar la contraseña del usuario
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

                // Esto no cuenta los errores de inicio de sesión hacia el bloqueo de cuenta
                // Para habilitar los errores de contraseña para desencadenar el bloqueo, cambie a shouldLockout: true
                var result = signinManager.PasswordSignIn(Email.Text, Password.Text, RememberMe.Checked, shouldLockout: false);

                switch (result)
                {
                    case SignInStatus.Success:
                        Response.Redirect(menu);
                        break;
                    case SignInStatus.LockedOut:
                        Response.Redirect("/Account/Lockout");
                        break;
                    case SignInStatus.RequiresVerification:
                        Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}", 
                                                        Request.QueryString["ReturnUrl"],
                                                        RememberMe.Checked), true);
                        break;
                    case SignInStatus.Failure:
                    default:
                        FailureText.Text = "Intento de inicio de sesión no válido";
                        ErrorMessage.Visible = true;
                        break;
                }
            }
        }
    }
}