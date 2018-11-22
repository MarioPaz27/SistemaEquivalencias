using SistemaEquivalencias.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SistemaEquivalencias.AdministradorSistema.Servicios
{
    public class FacultadService
    {
        FacultadModels facultad = new FacultadModels();
        EquivalenciasDataContext conn = new EquivalenciasDataContext();
         
        private string mensaje;

        public string GetMensaje()
        {
            return mensaje;
        }

        public Boolean InsertarDatosFacultad(string nombre)
        {
            Boolean result = false;
            if (!ValidarNombre(nombre))
            {
                GetMensaje();
            }
            else
            {
                try
                {
                    var consulta = (from f in conn.Equiv_Facultad
                                    where f.NombreFacultad.Equals(nombre) select f);
                    if(consulta == null)
                    {
                        conn.sp_InsertarFacultad(nombre);
                        mensaje = "La " + nombre + " ha sido guardada con éxito!!";
                        result = true;
                    }
                    else
                    {
                        mensaje = "La " + nombre + " ya existe en la base de Datos.";
                        result = false;
                    }
                    
                }
                catch (EntryPointNotFoundException ex)
                {
                    result = false;
                    mensaje = "ERROR : " + ex;
                }
            }
            

            return result;
        }

        public Boolean ValidarNombre(string nombre)
        {
            bool result = false; if (nombre == "")
            {
                mensaje = "Por favor verificar el campo. Campo vacío";
            }
            else if (nombre.Length < 15)
            {
                mensaje = "Nombre de facultad es muy corto. No permitido";
            }
            else if (nombre != null)
            {
                result = true;
            }
            return result;
        }
    }
}