using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net.NetworkInformation;

namespace SistemaEquivalencias.Sevices
{
    public class EmailServiceNotification
    {
        private String mensaje;
        static string sendTo = "mariodejessp5@gmail.com", usuario = "", contra = "";

        public void changeToStatic(string _sendTo, string _usuario, string _pass )
        {
            sendTo = _sendTo;
            usuario = _usuario;
            contra = _pass;

        }

        SmtpClient client = new SmtpClient();
        public static MailAddress _sendTo = new MailAddress(sendTo);
        
        public static MailAddress _from = new MailAddress("2713162015@mail.utec.edu.sv");
        MailMessage message = new MailMessage(_from, _sendTo);

        public void enviarMensaje()
        {
            message.IsBodyHtml = true;
            message.Subject = "Saludo Prueba";
            message.Body = "Esto es una prueba de correo electronico";

            System.Net.NetworkCredential isAuthentication = new System.Net.NetworkCredential(usuario,contra);

            client.Host = "smtp.gmail.com";
            client.UseDefaultCredentials = false;
            client.Credentials = isAuthentication;
            client.EnableSsl = true;

            try
            {
                client.Send(message);
                mensaje = "El mensaje ha sido enviado exitosamente!";

            }catch(Exception e)
            {
                e.GetBaseException();
                mensaje = "Error: " + e.GetBaseException();
            }

        }

        public String getMensaje()
        {
            return mensaje;
        }

        public void setMensaje(String mensaje)
        {
            this.mensaje = mensaje;
        }

    }
}