<%@ Page Title="" Language="C#" MasterPageFile="~/ProcEva-Otor_Equivalencia/Site-ProcEva-Otor.Master" AutoEventWireup="true" CodeBehind="InsertarMateriasExternasXCarrera.aspx.cs" Inherits="SistemaEquivalencias.ProcEva_Otor_Equivalencia.InsertarMateriasExternasXCarrera" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="container">

        <br />

        <asp:Panel ID="Pnl_HeaderFormulario" CssClass="panel panel-default" runat="server">
            <div class="panel-heading">
                <div class="panel-title text-center"><b>ENCABEZADO DE FORMULARIO</b></div>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">
                    <div class="form-group">                        
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Lbl_Unviersidad" CssClass="col-md-4 control-label" Font-Bold="true" runat="server" Text="Universidad:" ForeColor="Black"></asp:Label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="Ddl_Universidad" CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Lbl_Carrera" CssClass="col-md-4 control-label" Font-Bold="true" ForeColor="Black" runat="server" Text="Carrera:"></asp:Label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="Ddl_Carrera" CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Lbl_CantidadMateria" Font-Bold="true" CssClass="col-md-4 control-label" ForeColor="Black" runat="server" Text="Cantidad:"></asp:Label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="Ddl_CantidadMateria" CssClass="form-control" runat="server">
                                             <asp:listitem text="-- Seleccione Cantidad --" value="0"></asp:listitem>
                                             <asp:listitem text="01" value="1"></asp:listitem>
                                             <asp:listitem text="02" value="2"></asp:listitem>
                                             <asp:listitem text="03" value="3"></asp:listitem>
                                             <asp:listitem text="04" value="4"></asp:listitem>
                                             <asp:listitem text="05" value="5"></asp:listitem>
                                             <asp:listitem text="06" value="6"></asp:listitem>
                                             <asp:listitem text="07" value="7"></asp:listitem>
                                             <asp:listitem text="08" value="8"></asp:listitem>
                                             <asp:listitem text="09" value="9"></asp:listitem>
                                             <asp:listitem text="10" value="10"></asp:listitem>
                                             <asp:listitem text="11" value="11"></asp:listitem>
                                             <asp:listitem text="12" value="12"></asp:listitem>
                                             <asp:listitem text="13" value="13"></asp:listitem>
                                             <asp:listitem text="14" value="14"></asp:listitem>
                                             <asp:listitem text="15" value="15"></asp:listitem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Lbl_AnioPensum" CssClass="col-md-4 control-label" Font-Bold="true" ForeColor="Black" runat="server" Text="Año:"></asp:Label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="Tbx_Anio" CssClass="form-control" runat="server" MaxLength="4" placeholder="2000"></asp:TextBox>
                                    <ajaxToolkit:MaskedEditExtender ID="Tbx_Anio_MaskedEditExtender" runat="server" BehaviorID="Tbx_Anio_MaskedEditExtender" Mask="9999" Century="2000" MaskType="None" ClearTextOnInvalid="true" TargetControlID="Tbx_Anio" />
                                    <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ID="RequireTbxAnio" ErrorMessage="El campo está vacío" SetFocusOnError="true" ControlToValidate="Tbx_Anio"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Lbl_TipoInsercion" CssClass="col-md-4 control-label" Font-Bold="true" ForeColor="Black" runat="server" Text="Tipo:"></asp:Label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="Ddl_TipoInsercion" CssClass="form-control" runat="server">
                                        <asp:listitem text="Internas" value="1"></asp:listitem>
                                        <asp:listitem text="Externas" value="2"></asp:listitem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12 text-center">
                            <asp:Button ID="Btn_ProcesarValores" CssClass="btn" BackColor="#006666" ForeColor="White" OnClick="Btn_ProcesarValores_Click" runat="server" Text="Procesar" />
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:Panel ID="Pnl_TablaMateriasExternas" CssClass="panel panel-primary" runat="server">
            <div class="panel-heading">
                <div class="panel-title text-center"><b>Tabla de Insercion de Materias Externas</b></div>
            </div>
            <div class="panel-body">
                <div class="table-responsive">
                    <asp:Table ID="TableMateriasExternas" CssClass="table table-hover" runat="server">
                        <asp:TableRow>
                            <asp:TableCell>Nombre Materia</asp:TableCell><asp:TableCell>N° Correlativo</asp:TableCell><asp:TableCell>Código</asp:TableCell><asp:TableCell>Pre-Requisito</asp:TableCell><asp:TableCell>Unidades V</asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
