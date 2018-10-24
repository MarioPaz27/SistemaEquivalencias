<%@ Page Title="Roles de Usuario" Language="C#" MasterPageFile="~/AdministradorSistema/SiteManager.Master" AutoEventWireup="true" CodeBehind="RolesUsuarios.aspx.cs" Inherits="SistemaEquivalencias.AdministradorSistema.RolesUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div id="container" class="clear"> 
        <%--===================================================================================================================================--%>

        <h1><%: Page.Title %></h1>
        <p>ADMINISTRAR ROLES DE USUARIOS</p>

         
         <%--panel de administracion de roles para cada usuario--%>
         <div class="form-horizontal">
             <div class="form-group">
                <div class="col-md-6">
                    <asp:Panel ID="Pnl_AdministrarRoles" CssClass="panel panel-primary" runat="server">
                        <div class="panel-heading">
                            <div class="panel-title text-center"><b>Cambio de Roles</b></div>
                        </div>
                        <div class="panel-body">
                            <asp:Label runat="server" ID="Msg" Text="" ForeColor="Red" Font-Bold="true" />
                            <asp:Label runat="server" ID="Lbl_Mensaje1" Text="" ForeColor="Green" Font-Bold="true" /><br />    
                                    <asp:ListBox ID="ListBoxRoles" runat="server" AutoPostBack="true"></asp:ListBox>&nbsp;&nbsp;&nbsp; <asp:ListBox ID="ListBoxUser" runat="server"></asp:ListBox>
                                    <br /><br />
                                    <asp:Button ID="Btn_Cambiar" runat="server" ToolTip="Presione para asginar o cambiar un rol al usuario" CssClass="btn btn-default" Text="Asignar Rol" OnClick="Btn_Cambiar_OnClick" />
                                    <br /><br />
                                    <asp:GridView runat="server" CssClass="table table-hover" CellPadding="4" ID="UsersInRoleGridview" AutoGenerateColumns="false"
                                        GridLines="None" OnRowCommand="UsersInRoleGridView_RemoveFromRole">
                                        <HeaderStyle BackColor="navy" ForeColor="white" />
                                        <Columns>
                                            <asp:BoundField DataField="UserName" HeaderText="Nombre Usuario" />
                                          <asp:ButtonField Text="Borrar del Nivel" ButtonType="Link" />
                                        </Columns>
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                    </div>
                 <%--===================================================================================================================================--%>
                 <%--panel de eliminacion de roles de usuarios--%>
                    <div class="col-md-6">
                        <asp:Panel ID="Pnl_EliminarRoles" CssClass="panel panel-primary" runat="server">
                           <div class="panel-heading">
                                <div class="panel-title text-center"><b>Agregar Nuevo Rol</b></div>
                           </div>
                           <div class="panel-body">
                               <asp:Label ID="Lbl_Mensaje2" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                               <asp:Label runat="server" ID="Lbl_Mensaje3" Text="" ForeColor="Green" Font-Bold="true" /><br />
                            <div class="form-group">
                                <asp:Label runat="server" Text="Digite Nuevo Rol:" CssClass="col-md-4 control-label"></asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" ID="NewRol" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                               <div class="form-group">
                                   <div class="col-md-offset-4 col-md-4">
                                       <asp:Button runat="server" ID="AgregarRol" CssClass="btn btn-default" Text="Agregar Rol" OnClick="Agregar_Click"/>
                                   </div>
                               </div>                            
                            <br />
                                <asp:GridView runat="server" CellPadding="2" id="RolesGrid" 
                                        Gridlines="Both" CellSpacing="2" AutoGenerateColumns="false" AutoPostBack="true">
                                <HeaderStyle BackColor="navy" ForeColor="white" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Roles" >
                                    <ItemTemplate>
                                        <%# Container.DataItem.ToString() %>
                                    </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                </asp:GridView>
                        </div>
                    </asp:Panel>
                </div>
             </div>
         </div>
    
    </div>
</asp:Content>

