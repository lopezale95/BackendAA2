<%@page import="Modelo.ClaseProducto"%>
<%@page import="ModeloDAO.ClaseProductoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <title>Editar Producto</title>
    </head>
    <body>
        <div>
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link active" href="ControladorProd?accion=listarProducto">Productos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Clientes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Facturacion</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" tabindex="-1" aria-disabled="true">Informes</a>
                </li>
            </ul>
        </div>
        <div class="container">
            <div class="col-lg-6">
                <br>
                <%
                    ClaseProductoDAO dao= new ClaseProductoDAO();
                    String codigo=(String)request.getAttribute("codprod");
                    ClaseProducto p=(ClaseProducto)dao.list(codigo);   
                %>
                <h2 align="center">Editar Producto</h2>
                <br>
                <form action="ControladorProd">
                    <table class="table table-bordered">
                      <tr>
                            <td><label>Codigo:</label></td>
                            <td><input class="form-control" type="text" name="txtCod" value="<%=p.getCodigo()%>" readonly="readonly"></td>
                        </tr>
                        <tr>
                            <td><label>Nombre:</label></td>
                            <td><input class="form-control" type="text" name="txtNom" value="<%=p.getNombre()%>"></td>
                        </tr>
                        <tr>
                            <td><label>Valor:</label></td>
                            <td><input class="form-control" type="text" name="txtVlr" value="<%=p.getValor()%>"></td>
                        </tr>
                        <tr>
                            <td><label>Stock:</label></td>
                            <td><input class="form-control" type="text" name="txtStock" value="<%=p.getStock() %>"></td>
                        </tr>
                        <tr>
                            <th colspan="2">
                                <input class="btn btn-primary" type="submit" name="accion" value="Actualizar">
                                <a class="btn btn-dark" href="ControladorProd?accion=listarProducto">Cancelar</a>
                            </th>
                        </tr>  
                    </table>
                </form>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
    </body>
</html>
