using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SistemaEquivalencias.App_Code
{
    public class ValidacionPensum
    {
        private int anioPensum;
        private int ciclo;
        private string facultad;

        EquivalenciasDataContext equivalencia = new EquivalenciasDataContext();

        //metodos getters and setters
        public int getAnioPensum()
        {
            return anioPensum;
        }

        public void setAnioPensum(int anioPensum)
        {
            this.anioPensum = anioPensum;
        }

        public int getCiclo()
        {
            return ciclo;
        }

        public void setCiclo(int ciclo)
        {
            this.ciclo = ciclo;
        }

        public string getFacultad()
        {
            return facultad;
        }

        public void setFacultad(string facultad)
        {
            this.facultad = facultad;
        }

        //metodos de validaciones pensum
        public Boolean Pensum(int anioPensum, int ciclo, string facultad)
        {
            Boolean result = false;

           if(anioPensum >= 1986 && ciclo >= 0 && facultad != null)
            {
                result = true;
            }

            return result;
        }

    }
}