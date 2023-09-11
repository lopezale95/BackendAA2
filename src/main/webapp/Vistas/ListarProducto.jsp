<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.ClaseProducto"%>
<%@page import="ModeloDAO.ClaseProductoDAO"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <title>Lista Productos</title>
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
            <h2>Listado de Productos</h2>
            <a class="btn btn-success" href="ControladorProd?accion=nuevo">Agregar Nuevo</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">Codigo</th>
                        <th class="text-center">Nombre</th>
                        <th class="text-center">Valor</th>
                        <th class="text-center">Stock</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <%
                    ClaseProductoDAO dao=new ClaseProductoDAO();
                    List<ClaseProducto>list=dao.listarProducto();
                    Iterator<ClaseProducto>iter=list.iterator();
                    ClaseProducto prod=null;
                    while(iter.hasNext()){
                        prod=iter.next();
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%=prod.getCodigo()%></td>
                        <td class="text-center"><%=prod.getNombre()%></td>
                        <td class="text-center"><%=prod.getValor()%></td>
                        <td class="text-center"><%=prod.getStock()%></td>
                        <td>
                            <a class="btn btn-warning" href="ControladorProd?accion=editar&cod=<%=prod.getCodigo()%>"Editar</a>
                            <a class="btn btn-danger" href="ControladorProd?accion=eliminar&cod=<%=prod.getCodigo()%>"Eliminar</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>            
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
    </body>
</html>
