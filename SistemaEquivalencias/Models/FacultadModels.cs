using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SistemaEquivalencias.Models
{
    public class FacultadModels
    {
        private string nombre;

        public string GetNombre()
        {
            return nombre;
        }

        public void SetNombre(string nombre)
        {
            this.nombre = nombre;
        }
    }
}