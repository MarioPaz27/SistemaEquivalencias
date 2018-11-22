<%@ Page Title="" Language="C#" MasterPageFile="~/ProSolicEs_NuevoIngreso/Site-ProcSolicEs.Master" AutoEventWireup="true" CodeBehind="FormularioAlumnoInterno.aspx.cs" Inherits="SistemaEquivalencias.ProSolicEs_NuevoIngreso.FormularioAlumnoInterno" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Formulario de Datos Personales de alumno interno -->
    <div id="container" class="clear">
        <h2><%: Title %>.</h2>
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
        <asp:Panel runat="server" ID="Pnl_FormAlumnoInterno" CssClass="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title text-center"><b>Formulario de Alumnos Internos</b></div>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">
                    <h4>Registro de alumnos internos</h4>
                    <hr />
                    <asp:ValidationSummary runat="server" CssClass="text-danger" />
                    <div class="form-group">
                        <asp:Label runat="server" CssClass="control-label col-md-3" Text="Alumno Externo" AssociatedControlID="Cb_AlumnoInt" Font-Bold="true" />
                        <div class="col-md-1">
                            <asp:CheckBox runat="server" ID="Cb_AlumnoInt" CssClass=" checkbox-inline" AutoPostBack="true" OnCheckedChanged="Cb_AlumnoInt_CheckedChanged" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lbl_Nombres" runat="server" Text="Nombres" Font-Bold="true" CssClass="control-label col-md-3" />
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_Nombres" runat="server" CssClass="form-control" placeholder="Nombres de alumno" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_Nombres" CssClass="text-danger" ErrorMessage="El campo es obligatorio" SetFocusOnError="true" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lbl_Apellidos" runat="server" Text="Apellidos" Font-Bold="true" CssClass="control-label col-md-3" />
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_Apellidos" runat="server" CssClass="form-control" placeholder="Apellidos de alumno" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_Apellidos" CssClass="text-danger" ErrorMessage="El campo es obligatorio" SetFocusOnError="true" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lbl_Sexo" runat="server" Text="Sexo " CssClass="control-label col-md-3" Font-Bold="true" AssociatedControlID="rb_Sexo"></asp:Label>
                        <div class="col-md-4">
                            <asp:RadioButtonList ID="rb_Sexo" runat="server" CssClass="radio-outline col-md-4" RepeatDirection="Horizontal" CellSpacing="50" BorderColor="White" BackColor="White" BorderStyle="None" BorderWidth="0px" CellPadding="0">
                                <asp:ListItem Text="Mujer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" Value="Femenino" Enabled="true"></asp:ListItem>
                                <asp:ListItem Text="Hombre" Value="Masculino" Enabled="true"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="rb_Sexo" CssClass="text-danger" ErrorMessage="Seleccione Género" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lbl_Carnet" runat="server" Text="Carnet" Font-Bold="true" CssClass="control-label col-md-3" />
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_Carnet" runat="server" CssClass="form-control" placeholder="23-2345-2018" />
                            <%--<ajaxToolkit:MaskedEditExtender  ID="Mask_Carnet" runat="server" Mask="99-9999-9999" MaskType="None" TargetControlID="txt_Carnet" BehaviorID="Mask_Carnet" ClearTextOnInvalid="true" />--%>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_Carnet" CssClass="text-danger" ErrorMessage="El campo es obligatorio" SetFocusOnError="true" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lbl_Email" runat="server" Text="Email" Font-Bold="true" CssClass="control-label col-md-3" />
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_Email" runat="server" CssClass="form-control" TextMode="Email" placeholder="Ejemplo: alumno@gmail.com" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_Email" CssClass="text-danger" ErrorMessage="El campo Email es obligatorio" SetFocusOnError="true" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lbl_Telefono" runat="server" Text="Teléfono" CssClass="control-label col-md-3" Font-Bold="true" AssociatedControlID="txt_Telefono" />
                        <div class="col-md-4">
                            <asp:TextBox runat="server" ID="txt_Telefono" Text="+503" CssClass="form-control" placeholder="+503 7256-4589" />
                            <%--<ajaxToolkit:MaskedEditExtender ID="Mask_Telefono" runat="server" Mask="+999-9999-9999" MaskType="None" TargetControlID="txt_Telefono" BehaviorID="Mask_Telefono" ClearTextOnInvalid="true"  />--%>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_Telefono" CssClass="text-danger" ErrorMessage="El campo Teléfono es obligatorio" SetFocusOnError="true" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lbl_EstadoCivil" AssociatedControlID="lbl_EstadoCivil" runat="server" Font-Bold="true" CssClass="control-label col-md-3">Estado Civil</asp:Label>
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
                        <asp:Label ID="lbl_FechaNacimiento" runat="server" CssClass="control-label col-md-3" Text="Nacimiento" Font-Bold="true" AssociatedControlID="txt_FechaNacimiento" />
                        <div class="col-md-4">
                            <div class="input-group">
                                <asp:TextBox runat="server" ID="txt_FechaNacimiento" CssClass="form-control datepicker" placeholder="Día /Mes /Año" data-date-format="dd/mm/yyyy" />
                                <span class="input-group-addon">
                                    <i class="fa fa-calendar"></i></span>
                            </div>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_FechaNacimiento" CssClass="text-danger" ErrorMessage="La fecha de Nacimiento es obligatorio" SetFocusOnError="true" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lbl_Carrera" runat="server" Text="Carrera de procedencia" CssClass="control-label col-md-3" Font-Bold="true" AssociatedControlID="ddl_CarrerasInternas" />
                        <div class="col-md-4">
                            <asp:DropDownList runat="server" AppendDataBoundItems="True" ID="ddl_CarrerasInternas" CssClass="form-control" DataSourceID="DataSourceCarreraInterna" DataTextField="NombreCarreraInterna" DataValueField="Id">
                                <asp:ListItem Value=""> Seleccione una Carrera </asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ddl_CarrerasInternas" CssClass="text-danger" ErrorMessage="La carrera es obligatoria" SetFocusOnError="true" />
                            <asp:SqlDataSource ID="DataSourceCarreraInterna" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [IdCarrera], [NombreCarrera] FROM [Equiv_CarrerasInternas]"></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lbl_Comentario" runat="server" CssClass="control-label col-md-3" Font-Bold="true" Text="Comentario" AssociatedControlID="txt_Comentario" />
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_Comentario" runat="server" MaxLength="200" ToolTip="Máximo de caracteres 200" placeholder="Escriba algún comentario" CssClass="form-control" TextMode="MultiLine" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-4 col-md-4">
                            <asp:Button ID="btn_Guardar" runat="server" CssClass="btn btn-default" Text="Guardar" OnClick="btn_Guardar_Click"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <center>
        <%--Panel de confirmación de registro de alumno interno--%>
        <asp:Panel ID="Pnl_ConfirmAlumnoInt" runat="server" CssClass="panel panel-success" Width="350" Height="150" Visible="false">  
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
