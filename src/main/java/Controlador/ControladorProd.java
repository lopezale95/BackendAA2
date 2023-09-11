
package Controlador;
import Modelo.ClaseProducto;
import ModeloDAO.ClaseProductoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class ControladorProd extends HttpServlet {

    String listar="Vistas/ListarProducto.jsp";
    String adicionar="Vistas/NuevoProducto.jsp";
    String editar="Vistas/EditarProducto.jsp";
    ClaseProducto p=new ClaseProducto();
    ClaseProductoDAO pDAO=new ClaseProductoDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorProd</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorProd at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso="";
        String action=request.getParameter("accion");
        if(action.equalsIgnoreCase("listarProducto")){
            acceso=listar;
        }else if(action.equalsIgnoreCase("nuevo")){
            acceso=adicionar;
        }else if(action.equalsIgnoreCase("Agregar")){
            String cod=request.getParameter("txtCod");
            String nom=request.getParameter("txtNom");
            Double vlr=Double.parseDouble(request.getParameter("txtVlr"));
            int stock=Integer.parseInt(request.getParameter("txtStock"));
            p.setCodigo(cod);
            p.setNombre(nom);
            p.setValor(vlr);
            p.setStock(stock);
            pDAO.adicionar(p);
            acceso=listar;
        }else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("codprod",request.getParameter("cod"));
            acceso=editar;
        }else if(action.equalsIgnoreCase("Actualizar")){
            String cod=request.getParameter("txtCod");
            String nom=request.getParameter("txtNom");
            Double vlr=Double.parseDouble(request.getParameter("txtVlr"));
            int stock=Integer.parseInt(request.getParameter("txtStock"));
            p.setCodigo(cod);
            p.setNombre(nom);
            p.setValor(vlr);
            p.setStock(stock);
            pDAO.editar(p);
            acceso=listar;
        }else if(action.equalsIgnoreCase("Eliminar")){
            String cod=request.getParameter("cod");
            p.setCodigo(cod);
            pDAO.eliminar(cod);
            acceso=listar;
        }
        RequestDispatcher vista=request.getRequestDispatcher(acceso);
        vista.forward( request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response); 
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
