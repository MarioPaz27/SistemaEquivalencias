<%@ Page Title="Lista de Usuarios" Language="C#" MasterPageFile="~/AdministradorSistema/SiteManager.Master" AutoEventWireup="true" CodeBehind="VerUsuarios.aspx.cs" Inherits="SistemaEquivalencias.AdministradorSistema.VerUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div id="container" class="clear"> 
        <!-- ####################################################################################################### -->

        <h1><%: Page.Title %></h1>
        <p>ADMINISTRADOR</p>
         <br />
         <asp:Panel ID="Pnl_ListaUsuarios" CssClass="panel panel-default" runat="server">
             <div class="panel-heading">
                 <div class="panel-title text-center"><b>Usuarios Disponibles</b></div>
             </div>
             <div class="panel-body">
                 <div class="table-responsive">
                      <asp:GridView ID="Gv_ListaUsuarios" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="ConsultaUsuarios" DataKeyNames="Id">
                     <Columns>
                         <asp:CommandField HeaderText="Opción" HeaderStyle-BackColor="Blue" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White" HeaderStyle-CssClass="text-center" ShowEditButton="True" />
                         <asp:BoundField DataField="Id" HeaderStyle-BackColor="Blue" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White" HeaderText="Id" SortExpression="Id" HtmlEncodeFormatString="true" ReadOnly="True" Visible="false"/>
                         <asp:BoundField DataField="UserName" HeaderStyle-BackColor="Blue" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White" HeaderText="Nombre Usuario" HeaderStyle-CssClass="text-center" SortExpression="UserName" />
                         <asp:BoundField DataField="Email" HeaderStyle-BackColor="Blue" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White" HeaderText="Email" HeaderStyle-CssClass="text-center" SortExpression="Email" />
                         <asp:BoundField DataField="Name" HeaderStyle-BackColor="Blue" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White" HeaderText="Rol" HeaderStyle-CssClass="text-center" SortExpression="Name" ReadOnly="true" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="ConsultaUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT AspNetUsers.Id, AspNetUsers.UserName, AspNetUsers.Email, AspNetRoles.Name FROM AspNetRoles INNER JOIN AspNetUserRoles ON AspNetRoles.Id = AspNetUserRoles.RoleId INNER JOIN AspNetUsers ON AspNetUserRoles.UserId = AspNetUsers.Id" UpdateCommand="UPDATE AspNetUsers SET UserName =@UserName, Email =@Email WHERE Id =@Id">
                     <UpdateParameters>
                         <asp:Parameter Name="UserName" />
                         <asp:Parameter Name="Email" />
                         <asp:Parameter Name="Id" />
                     </UpdateParameters>
                      </asp:SqlDataSource>
                 </div>
             </div>
         </asp:Panel>
    </div>
</asp:Content>
