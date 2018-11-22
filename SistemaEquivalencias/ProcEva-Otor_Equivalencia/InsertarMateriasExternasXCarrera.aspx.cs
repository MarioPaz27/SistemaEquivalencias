using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaEquivalencias.Sevices;

namespace SistemaEquivalencias.ProcEva_Otor_Equivalencia
{
    public partial class InsertarMateriasExternasXCarrera : System.Web.UI.Page
    {
        EmailServiceNotification correo = new EmailServiceNotification();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Btn_ProcesarValores_Click(object sender, EventArgs e)
        {
            //correo.enviarMensaje();
            //Label1.Text = correo.getMensaje();
            CrearTabla();
            Tbx_Anio_TextChanged();
        }

        protected void Tbx_Anio_TextChanged()
        {
            if (Tbx_Anio.MaxLength < 4 || Tbx_Anio.Text != null)
            {
                RequireTbxAnio.SetFocusOnError = true;
            }
            
        }

        public Table CrearTabla()
        {
            int rowCnt;
            // Current row count.
            int rowCtr;
            // Total number of cells per row (columns).
            int cellCtr;
            // Current cell counter
            int cellCnt;

            rowCnt = int.Parse(Ddl_CantidadMateria.SelectedValue);
            cellCnt = 5;
            Table table = (Table)Page.Form.FindControl("TableMateriasExternas");

            for (rowCtr = 1; rowCtr <= rowCnt; rowCtr++)
            {
                // Create new row and add it to the table.
                TableRow tRow = new TableRow();
                TableMateriasExternas.Rows.Add(tRow);
                for (cellCtr = 1; cellCtr <= cellCnt; cellCtr++)
                {
                    // Create a new cell and add it to the row.
                    TableCell tCell = new TableCell();
                    TextBox textBox = new TextBox();
                    textBox.ID = cellCtr + " " + rowCtr;
                    textBox.CssClass = "form-control";
                    textBox.Text = cellCtr+" "+rowCtr;
                    textBox.Attributes.Add("runat", "server");
                    tCell.ID= cellCtr + "_" + rowCtr;
                    tCell.Attributes.Add("runat", "server");
                    tCell.Controls.Add(textBox);
                    tRow.Cells.Add(tCell);
                }
            }

            return table;
        }
    }
}