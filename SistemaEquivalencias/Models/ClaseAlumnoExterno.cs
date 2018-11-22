using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Data.SqlClient;

namespace SistemaEquivalencias.ProSolicEs_NuevoIngreso
{
    class ClaseAlumnoExterno
    {
        String variable = "";
        public String msRetorno = "";
        public Boolean blRetorno = false;
        public DataSet dsRetorno = new DataSet();
        EquivalenciasDataContext miBD = new EquivalenciasDataContext();

        public String InsertarEstudianteExterno(String prmNombres, String prmApellidos, String prmTipoDocumento, String prmNumeroDocu,
            String prmTelefono, String prmEstadoCivil, DateTime prmFNacimiento, String prmSexo, int prmIdUniProcedencia, int prmIdCarreraProce,
            String prmEmail, String prmComentario, Boolean prmEstado)
        {
            try
            {
                //Equi_AlumnosExternos objAlumExt = new Equi_AlumnosExternos();
                //objAlumExt.Nombres = prmNombres;
                //objAlumExt.Apellidos = prmApellidos;
                //objAlumExt.TipoDocumento = prmTipoDocumento;
                //objAlumExt.NumeroDocumento = prmNumeroDocu;
                //objAlumExt.Telefono = prmTelefono;
                //objAlumExt.EstadoCivil = prmEstadoCivil;
                //objAlumExt.FechaNacimiento = prmFNacimiento;
                //objAlumExt.Sexo = prmSexo;
                //objAlumExt.IdUniversidadProcedencia = prmIdUniProcedencia;
                //objAlumExt.IdCarreraProcedencia = prmIdCarreraProce;
                //objAlumExt.Email = prmEmail;
                //objAlumExt.Comentario = prmComentario;
                //objAlumExt.Estado = prmEstado;

                //miBD.Equi_AlumnosExternos.InsertOnSubmit(objAlumExt);
                miBD.SubmitChanges();
                msRetorno = "Estudiante Insertado con éxito";
            }
            catch (Exception ex)
            {
                msRetorno = ex.Message.ToString();
            }
            return msRetorno;
        }
        //public DataTable ListaEstudiantesExternos()
        //{
        //    //Código para listar los estudiantes externos
        //    var Datos = from v in miBD.Equi_AlumnosExternos select v;
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
