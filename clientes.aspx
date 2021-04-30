<%@ Page Language="C#" AutoEventWireup="true" CodeFile="clientes.aspx.cs" Inherits="clientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    
    <link href="css/estilo.css" rel="stylesheet" />
    <link href="stiloReg.css" rel="stylesheet" />
    <link href="prueba.css" rel="stylesheet" />
    
    <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.9/css/dataTables.bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/responsive/1.0.7/css/responsive.bootstrap.min.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/1.0.7/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.4.2/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" src="//cdn.datatables.net/buttons/1.4.2/js/buttons.html5.min.js"></script>
    <script src="footable.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script type="text/javascript">
        function Span(id) {
            document.getElementById(id).style.visibility = "visible";
        }
    </script>
    <script type="text/javascript">
        function nada(id) {
            document.getElementById(id).style.visibility = "hidden";
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            var val = document.getElementById('<%=Hidden1.ClientID%>').value;
            if (val == "si") {
                $("#GridView1").DataTable({
                    pageLength: 6,
                    scrollY: "270px",
                    paging: false,
                    aaSorting: [[0, 'desc']],

                });
            }
            else {
                $("#GridView1").DataTable({
                    pageLength: 6,
                    aaSorting: [[0, 'desc']],

                });
            }
            $("#GridView1").on('page.dt', function () {
                $('[id*=GridView1]').footable();
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            var val = document.getElementById('<%=Hidden1.ClientID%>').value;
            if (val == "si") {
                $("#GridView2").DataTable({
                    pageLength: 6,
                    scrollY: "270px",
                    paging: false,
                    aaSorting: [[0, 'desc']],

                });
            }
            else {
                $("#GridView2").DataTable({
                    pageLength: 6,
                    aaSorting: [[0, 'desc']],

                });
            }
            $("#GridView2").on('page.dt', function () {
                $('[id*=GridView2]').footable();
            });
        });
    </script>
    
</head>
<body style="background-image: url(css/darkgrain.png)">
    <form id="form1" runat="server">
        <asp:HiddenField ID="Hidden1" runat="server" />
        <div class="margentop">
            <div class="col-xs-12  col-md-12 col-lg-10 col-lg-offset-1">
                 <hr class="hr2" />
                <div style="padding: 10px 20px 10px 20px; background-color: #f7f7f7; border: solid 1px #dedede; box-shadow: 0 10px 20px #929292;">
                    <span id="icon1" class="fa fa-info-circle" aria-hidden="true" style="font-size: 24px; color: #087eaa; visibility: hidden">
                    <asp:Label ID="lbaseseorias" runat="server"></asp:Label></span>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idcliente, RazonSocial, NombreComercial, RFC" CssClass="table table-striped table-bordered table-hover footable" BackColor="#ffffff" OnRowDataBound="GridView1_RowDataBound" HorizontalAlign="center">
                        <Columns>
                            <asp:BoundField DataField="idcliente" HeaderText="Id" />
                            <asp:BoundField DataField="RazonSocial" HeaderText="Razón Social" SortExpression="RazonSocial"  />
                            <asp:BoundField DataField="NombreComercial" HeaderText="Nombre Comercial" SortExpression="NombreComercial" />
                            <asp:BoundField DataField="RFC" HeaderText="RFC" SortExpression="RFC" ItemStyle-Width="5%" />
                            <asp:BoundField DataField="Curp" HeaderText="Curp" />
                            <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                            <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="consultar" runat="server" OnClick="consultar_Click" CssClass="btn btn-success btn-xs">Consultar</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Contactos</h4>
                    </div>
                    <div class="modal-body">
                        <asp:GridView ID="GridView2"  runat="server" AutoGenerateColumns="False" DataKeyNames="Nombre" CssClass="table table-striped table-bordered table-hover footable" BackColor="#ffffff" OnRowDataBound="GridView2_RowDataBound1" HorizontalAlign="center">
                            <Columns>
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                <asp:BoundField DataField="Apaterno" HeaderText="Apellido Paterno" />
                                <asp:BoundField DataField="Amaterno" HeaderText="Apellido Materno" />
                                <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                                <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                                <asp:BoundField DataField="email" HeaderText="Correo Electrónico" />
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <%--<script type="text/javascript">
            $(document).on("click", "[id*=consultar]", function () {
                $("#myModal").dialog({
                    title: "Contatos",
                    buttons: {
                        Ok: function () {
                            $(this).dialog('close');
                        }
                    },
                    modal: true;
                });
                return false;
            });
        </script>--%>
    </form>
</body>
</html>
