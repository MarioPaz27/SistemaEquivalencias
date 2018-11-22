using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Reflection;
using System.Data.SqlClient;
using System.Data;

namespace SistemaEquivalencias.ProSolicEs_NuevoIngreso
{
    public class ClaseAlumnoInterno
    {
        String variable = "";
        public String msRetorno = "";
        public Boolean blRetorno = false;
        public DataSet dsRetorno = new DataSet();
        EquivalenciasDataContext miBD = new EquivalenciasDataContext();

        public String InsertarEstudianteInterno(String prmNombres, String prmApellidos, String prmNumeroDocu, String prmTelefono,
            String prmEstadoCivil, DateTime prmFNacimiento, String prmFile, int prmIdCarreraInt, String prmEmail, String prmComentario,
            Boolean prmEstado, String prmSexo)
        {
            try
            {
                //Equi_AlumnosInternos objAlumInt = new Equi_AlumnosInternos();
                //objAlumInt.Nombres = prmNombres;
                //objAlumInt.Apellidos = prmApellidos;
                //objAlumInt.NumeroDocumento = prmNumeroDocu;
                //objAlumInt.Telefono = prmTelefono;
                //objAlumInt.EstadoCivil = prmEstadoCivil;
                //objAlumInt.FechaNacimiento = prmFNacimiento;
                //objAlumInt.FileName = prmFile;
                //objAlumInt.IdCarreraInterna = prmIdCarreraInt;
                //objAlumInt.Email = prmEmail;
                //objAlumInt.Comentario = prmComentario;
                //objAlumInt.Estado = prmEstado;
                //objAlumInt.Sexo = prmSexo;

                //miBD.Equi_AlumnosInternos.InsertOnSubmit(objAlumInt);
                miBD.SubmitChanges();
                msRetorno = "Estudiante Insertado con éxito";
            }
            catch (Exception ex)
            {
                msRetorno = ex.Message.ToString();
            }
            return msRetorno;
        }
        //public DataTable ListaEstudiantesInternos()
        //{
        //    //Código para listar los estudiantes internos
        //    var Datos = from v in miBD.Equi_AlumnosInternos select v;
        //    DataTable dt = LINQToDataTable(Datos);
        //    return dt;
        //}
        public DataTable LINQToDataTable<T>(IEnumerable<T> varlist)
        {
            DataTable dtReturn = new DataTable();

            //Nombres de columnas
            PropertyInfo[] oProps = null;

            if (varlist == null) return dtReturn;

            foreach (T rec in varlist)
            {
                // Use reflection to get property names, to create table, Only first time, others will follow
                if (oProps == null)
                {
                    oProps = ((Type)rec.GetType()).GetProperties();
                    foreach (PropertyInfo pi in oProps)
                    {
                        Type colType = pi.PropertyType;

                        if ((colType.IsGenericType) && (colType.GetGenericTypeDefinition() == typeof(Nullable<>)))
                        {
                            colType = colType.GetGenericArguments()[0];
                        }

                        dtReturn.Columns.Add(new DataColumn(pi.Name, colType));
                    }
                }
                DataRow dr = dtReturn.NewRow();

                foreach (PropertyInfo pi in oProps)
                {
                    dr[pi.Name] = pi.GetValue(rec, null) == null ? DBNull.Value : pi.GetValue(rec, null);
                }

                dtReturn.Rows.Add(dr);
            }
            return dtReturn;
        }
    }
}