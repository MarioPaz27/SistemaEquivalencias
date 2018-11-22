<%@ Page Title="Facultades" Language="C#" MasterPageFile="~/AdministradorSistema/SiteManager.Master" AutoEventWireup="true" CodeBehind="FacultadForm.aspx.cs" Inherits="SistemaEquivalencias.AdministradorSistema.FacultadForm" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div id="container" class="clear"> 
        <!-- ####################################################################################################### -->

        <h1><%: Page.Title %></h1>
        <p>FORMULARIO DE FACULTAD</p>
         <div class="form-horizontal">
             <div class="form-group">
                 <div class="col-md-6">
                     <asp:Panel ID="Pnl_FormularioFacultad" CssClass="panel panel-primary" runat="server">
                         <div class="panel-heading">
                             <div class="panel-title text-center">Formulario de Facultad</div>
                         </div>
                         <div class="panel-body">
                             <asp:Label ID="LblMensaje" runat="server" Font-Bold="true"></asp:Label>
                             <br />
                             <br />
                             <div class="form-group">
                                 <asp:Label ID="LblNOmbre" CssClass="col-md-4 control-label" runat="server" Text="Nombre de facultad" Font-Size="Smaller" ForeColor="Black" Font-Bold="true" ></asp:Label>
                                 <div class="col-md-7">
                                     <asp:TextBox ID="TbxNombre" CssClass="form-control" MaxLength="80" placeholder="Escribir Facultad..." runat="server"></asp:TextBox>
                                 </div>
                             </div>
                             <div class="form-group">
                                 <div class="col-md-offset-4 col-md-7">
                                     <asp:Button ID="BtnGuardar" CssClass="btn btn-default" runat="server" OnClick="BtnGuardar_Click" Text="Guardar" ToolTip="Presiona para guardar nueva Facultad" />
                                 </div>
                             </div>
                         </div>
                     </asp:Panel>
                 </div>
                 <div class="col-md-6">
                     <asp:Panel ID="Pnl_ListadoFacultad" CssClass="panel panel-primary" ScrollBars="Vertical" Height="210" runat="server" HorizontalAlign="Justify">
                         <div class="panel-heading">
                             <div class="panel-title text-center">Listado de Facultad&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:LinkButton ID="BtnUpdate" OnClick="BtnUpdate_Click" runat="server"><i class="icon-spin3"></i></asp:LinkButton></div>
                         </div>
                         <div class="panel-body">
                             <div class="table-responsive">
                                 <asp:GridView ID="Gv_ListadoFacultad" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="ConsultaFacultad" DataKeyNames="IdFacultad">
                                     <Columns>
                                         <asp:CommandField ShowEditButton="True"  HeaderStyle-CssClass="text-center" HeaderStyle-BackColor="Black" HeaderText="Opción" HeaderStyle-ForeColor="White" />
                                         <asp:BoundField DataField="IdFacultad" HeaderText="IdFacultad" SortExpression="IdFacultad" ReadOnly="true" Visible="false" />
                                         <asp:BoundField DataField="NombreFacultad" HeaderText="NombreFacultad"  HeaderStyle-CssClass="text-center" HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White" SortExpression="NombreFacultad" />
                                     </Columns>
                                 </asp:GridView>
                                 <asp:SqlDataSource ID="ConsultaFacultad" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT IdFacultad, NombreFacultad FROM Equiv_Facultad" UpdateCommand="UPDATE Equiv_Facultad SET NombreFacultad =@NombreFacultad, FechaModificacion = getdate() WHERE IdFacultad=@IdFacultad">
                                     <UpdateParameters>
                                         <asp:Parameter Name="NombreFacultad" />
                                         <asp:Parameter Name="IdFacultad" />
                                     </UpdateParameters>
                                 </asp:SqlDataSource>
                             </div>
                         </div>
                     </asp:Panel>
                 </div>
             </div>
         </div>
    </div>
</asp:Content>
