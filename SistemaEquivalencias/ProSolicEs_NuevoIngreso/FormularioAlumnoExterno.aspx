<%@ Page Title="" Language="C#" MasterPageFile="~/ProSolicEs_NuevoIngreso/Site-ProcSolicEs.Master" AutoEventWireup="true" CodeBehind="FormularioAlumnoExterno.aspx.cs" Inherits="SistemaEquivalencias.ProSolicEs_NuevoIngreso.FormularioAlumnoExterno" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Formulario de Datos Personales de alumno externo -->
    <div id="container" class="clear">
        <h2><%: Title %>.</h2>
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
        <asp:Panel runat="server" ID="Pnl_FormAlumnoExterno" CssClass="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title text-center"><b>Formulario de Alumnos Externos</b></div>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">
                    <h4>Registro de alumnos externos</h4>
                    <hr />
                    <asp:ValidationSummary runat="server" CssClass="text-danger" />
                    <div class="form-group">
                        <asp:Label runat="server" Text="Alumno Interno" CssClass="control-label col-md-3" Font-Bold="true" />
                        <div class="col-md-1">
                            <asp:CheckBox runat="server" ID="Cb_AlumnoInterno" AutoPostBack="true" OnCheckedChanged="Cb_AlumnoInterno_CheckedChanged" CssClass="checkbox-outline" />
                        </div>
                    </div>
                    <div class="form-group">           
                         <asp:Label ID="lbl_Nombres" runat="server" AssociatedControlID="txt_Nombres" CssClass="col-md-3 control-label">Nombres</asp:Label>
                        <div class="col-md-4">
                           <asp:TextBox ID="txt_Nombres" runat="server" CssClass="form-control" placeholder="Nombres de alumno"></asp:TextBox>                       
                           <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_Nombres" CssClass="text-danger" ErrorMessage="El campo Nombres es obligatorio"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">                      
                        <asp:Label ID="lbl_Apellidos" runat="server" AssociatedControlID="txt_Apellidos" CssClass="col-md-3 control-label">Apellidos</asp:Label>
                           <div class="col-md-4">
                            <asp:TextBox ID="txt_Apellidos" runat="server" CssClass="form-control" placeholder="Apellidos de alumno"></asp:TextBox>                  
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_Apellidos" CssClass="text-danger" ErrorMessage="El campo Apellidos es obligatorio"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">              
                       <asp:Label ID="lbl_Sexo" runat="server" Text="Sexo " CssClass="col-md-3 control-label" AssociatedControlID="rb_Sexo"></asp:Label>
                         <div class="col-md-4">
                                <asp:RadioButtonList ID="rb_Sexo" runat="server" CssClass="radio-outline col-md-4" RepeatDirection="Horizontal" CellSpacing="50" BorderStyle="None" RepeatLayout="Table">
                                <asp:ListItem Text="Mujer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" Value="Femenino" Enabled="true"></asp:ListItem>
                                <asp:ListItem Text="Hombre" Value="Masculino" Enabled="true"></asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="rb_Sexo" CssClass="text-danger" ErrorMessage="Seleccione Género" />
                        </div>
                    </div>
                    <div class="form-group">         
                            <asp:Label ID="lbl_TipoDocumento" runat="server" AssociatedControlID="ddl_TipoDocumento" CssClass="col-md-3 control-label">Documento</asp:Label>
                            <div class="col-md-4">
                            <asp:DropDownList ID="ddl_TipoDocumento" runat="server" CssClass="form-control tooltips" AutoPostBack="true" OnSelectedIndexChanged="ddl_TipoDocumento_SelectedIndexChanged" ToolTip="Seleccione un Tipo de Documento" data-toggle="tooltip" data-placement="right">
                                <asp:ListItem Value="" Text="Seleccione Documento"></asp:ListItem>
                                <asp:ListItem Value="DUI" Text="DUI"></asp:ListItem>
                                <asp:ListItem Value="NIT" Text="NIT"></asp:ListItem>
                                <asp:ListItem Value="CMinoridad" Text="C. Minoridad"></asp:ListItem>
                                <asp:ListItem Value="Pasaporte" Text="Pasaporte"></asp:ListItem>
                            </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddl_TipoDocumento" CssClass="text-danger" ErrorMessage="Seleccione un tipo de documento" />
                            </div>
                            <div class="col-md-4" runat="server" id="div_Dui" visible="false">
                                <asp:TextBox ID="txt_Dui" runat="server" onKeyPress="return soloNumeros(event)" MaxLength="9" MinLegth="9" CssClass="form-control" placeholder="# DUI sin guión" ValidationGroup="MKE" />
                                <ajaxToolkit:MaskedEditExtender ID="Mask_Dui" runat="server" BehaviorID="Mask_Dui" Mask="99999999-9" TargetControlID="txt_Dui" ClearTextOnInvalid="true" MaskType="None" />                                 
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_Dui" CssClass="text-danger" ErrorMessage="El campo DUI es Obligatorio" SetFocusOnError="true" />
                            </div>                   
                            <div class="col-md-4" runat="server" id="div_Nit" visible="false">
                                <asp:TextBox ID="txt_Nit" runat="server" onKeyPress="return soloNumeros(event)" MaxLength="14" MinLegth="14" CssClass="form-control" placeholder="# NIT sin guión" />
                                <%--<ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" Mask="9999-999999-999-9" MaskType="None" TargetControlID="txt_Nit" BehaviorID="Mask_Nit" ClearTextOnInvalid="true"/>--%>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_Nit" CssClass="text-danger" ErrorMessage="El campo NIT es Obligatorio" />
                            </div>
                            <div class="col-md-4" runat="server" id="div_Cminoridad" visible="false">
                                <asp:TextBox ID="txt_cMinoridad" runat="server" onKeyPress="return soloNumeros(event)" MaxLength="4" MinLegth="4" CssClass="form-control" placeholder="# Carnet sin guión" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_cMinoridad" CssClass="text-danger" ErrorMessage="El campo C. Minoridad es Obligatorio" />
                            </div>
                            <div class="col-md-4" runat="server" id="div_Pasaporte" visible="false">
                                <asp:TextBox ID="txt_Pasaporte" runat="server" MaxLength="9" MinLegth="9" CssClass="form-control" placeholder="Ej. Axxxxxxxx" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_Pasaporte" CssClass="text-danger" ErrorMessage="El campo Pasaporte es Obligatorio" />
                            </div>
                            <div class="col-md-4" runat="server" id="div_Carnet" visible="false">
                                <asp:TextBox ID="txt_Carnet" runat="server" MaxLength="9" MinLegth="9" CssClass="form-control" placeholder="27-0203-2018" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_Carnet" CssClass="text-danger" ErrorMessage="El campo Carnet es Obligatorio" />
                            </div>
                        </div>
                    <div class="form-group">                      
                            <asp:Label ID="lbl_UnivProcedencia" runat="server" AssociatedControlID="lbl_UnivProcedencia" CssClass="col-md-3 control-label">Universidad</asp:Label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddl_UnivProcedencia" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="NombreUniversidad" DataValueField="Id" AutoPostBack="true" AppendDataBoundItems="true">
                                <asp:ListItem Value="" Selected="False">Seleccione Universidad</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [IdUniversidad], [NombreUniversidad] FROM [Equiv_Universidades] ORDER BY [IdUniversidad]"></asp:SqlDataSource>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ddl_UnivProcedencia" CssClass="text-danger" ErrorMessage="Seleccione una Universidad" />
                       </div>
                    </div>
                    <div class="form-group">                     
                            <asp:Label ID="lbl_Carrera" runat="server" AssociatedControlID="lbl_Carrera" CssClass="col-md-3 control-label">Carrera</asp:Label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddl_Carrera" runat="server" CssClass="form-control" DataSourceID="CarreraDataContext" DataTextField="NombreCarrera" DataValueField="Id">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="CarreraDataContext" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Id], [NombreCarrera] FROM [Equiv_CarrerasExternas] WHERE ([IdUniversidad] = @IdUniversidad) ORDER BY [NombreCarrera]">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddl_UnivProcedencia" Name="IdUniversidad" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <br />
                    <div class="form-group">                      
                            <asp:Label ID="lbl_Email" runat="server" Text="Email" CssClass="col-md-3 control-label" Font-Bold="true"/>
                          <div class="col-md-4">
                             <asp:TextBox runat="server" ID="txt_Email" CssClass="form-control" TextMode="Email" placeholder="Ejemplo: alumno@gmail.com"  />                       
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_Email" CssClass="text-danger" ErrorMessage="El campo Email es obligatorio" SetFocusOnError="true" />
                       </div>
                    </div>
                    <div class="form-group">                       
                            <asp:Label ID="lbl_Telefono" runat="server" CssClass="col-md-3 control-label" Font-Bold="true" Text="Teléfono Móvil"></asp:Label>
                         <div class="col-md-4">
                            <asp:TextBox ID="txt_Telefono" runat="server" CssClass="form-control" onKeyPress="return soloNumeros(event)" MaxLength="20" Text="+503"  />
                              <%--<ajaxToolkit:MaskedEditExtender  ID="Mask_Tel" runat="server" Mask="+999-9999-9999" MaskType="None" TargetControlID="txt_Telefono" BehaviorID="Mask_Tel" ClearTextOnInvalid="true" />--%>
                        </div>                     
                    </div>
                    <br />
                    <div class="form-group">                       
                           <asp:Label ID="lbl_FechaNacimiento" AssociatedControlID="lbl_FechaNacimiento" runat="server" Font-Bold="true" CssClass="col-md-3 control-label">Nacimiento</asp:Label>
                          <div class="col-md-4">                              
                            <div class="input-group">
                                <asp:TextBox ID="txt_FechaNacimiento" runat="server" CssClass="form-control datepicker" placeholder="Día /Mes /Año" data-date-format="dd/mm/yyyy" />
                                <span class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </span>
                            </div>                        
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_FechaNacimiento" CssClass="text-danger" ErrorMessage="La fecha de Nacimiento es obligatorio" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lbl_EstadoCivil" AssociatedControlID="lbl_EstadoCivil" runat="server" Font-Bold="true" CssClass="col-md-3 control-label">Estado Civil</asp:Label>
                          <div class="col-md-4">
                           <asp:DropDownList ID="ddl_EstadoCivil" runat="server" CssClass="form-control">
                                <asp:ListItem Value="" Text="Seleccione Estado"></asp:ListItem>
                                <asp:ListItem Value="Soltero/a" Text="Soltero/a"></asp:ListItem>
                                <asp:ListItem Value="Casado/a" Text="Casado/a"></asp:ListItem>
                                <asp:ListItem Value="Divorciado/a" Text="Divorciado/a"></asp:ListItem>
                                <asp:ListItem Value="Viudo/a" Text="Viudo/a"></asp:ListItem>
                            </asp:DropDownList>                       
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddl_EstadoCivil" CssClass="text-danger" ErrorMessage="El Estado Civil es obligatorio" />
                        </div>
                    </div>
                    <div class="form-group">                      
                       <asp:Label ID="lbl_Comentario" runat="server" CssClass="col-md-3 control-label" Font-Bold="true" Text="Comentario" />
                        <div class="col-md-4">   
                           <asp:TextBox ID="txt_Comentario" runat="server" CssClass="form-control" TextMode="MultiLine"  />
                        </div>
                    </div>
                </div>
                <br />
                <div class="form-group">
                    <div class="col-md-offset-4 col-md-4"">
                        <asp:Button ID="btn_Guardar" runat="server" CssClass="btn btn-default" OnClick="btnGuardar_Click" Text="Guardar"></asp:Button>
                    </div>
                </div>
            </div>
        </asp:Panel>
         <center>
        <%--Panel de confirmación de registro de alumno externo--%>
        <asp:Panel ID="Pnl_ConfirmAlumnoExt" runat="server" CssClass="panel panel-success" Width="350" Height="150" Visible="false">  
            <div class="panel-heading">
                <div class="panel-title text-center"><b>EXITO!!</b></div>
            </div>
            <div class="panel-body text-center">
                <span class="icon-ok-circled"></span> <asp:Label ID="lbl_Success" CssClass="" runat="server" Text="Este registro se ha agregado con Éxito!" ForeColor="Green"></asp:Label>
                <br/>
                <br/>
                <asp:Button runat="server" ID="btn_Exito" CssClass="btn btn-success" Text="OK" Tooltip="Confirmación" OnClick="btn_Exito_Click"/>
            </div>
        </asp:Panel>
        </center>
    </div>
</asp:Content>
