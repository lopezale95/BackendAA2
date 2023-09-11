
package ModeloDAO;

import Config.ClaseConexion;
import Interfaces.CRUD;
import Modelo.ClaseProducto;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClaseProductoDAO implements CRUD {
    ClaseConexion cn=new ClaseConexion();
    Connection con= null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    ClaseProducto p=new ClaseProducto();
    @Override
    public List listarProducto(){
        ArrayList<ClaseProducto>list=new ArrayList();
        String sql="select * from tbl_producto";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
               ClaseProducto prod=new ClaseProducto();
               prod.setCodigo(rs.getString("codigo"));
               prod.setNombre(rs.getString("nombre"));
               prod.setValor(rs.getDouble("valor"));
               prod.setStock(rs.getInt("stock"));
               list.add(prod);
            }
        } catch (Exception e) {
            System.err.println("Error. "+e);
        }
        return list;
    }
    
    @Override
    public ClaseProducto list(String cod){
        String sql="select * from tbl_producto where codigo="+cod;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
               p.setCodigo(rs.getString("codigo"));
               p.setNombre(rs.getString("nombre"));
               p.setValor(rs.getDouble("valor"));
               p.setStock(rs.getInt("stock"));
            }
        } catch (Exception e) {
            System.err.println("Error. "+e);
        }
        return p;
    }
    
    @Override
    public boolean adicionar(ClaseProducto prod){
        String sql="INSERT INTO tbl_producto(codigo,nombre,valor,stock)VALUES('"+prod.getCodigo()+"','" 
                +prod.getNombre()+"',"+prod.getValor()+","+prod.getStock()+ ")";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println("Error. "+e);
        }
        return false;
    }
    
    @Override
    public boolean editar(ClaseProducto prod){
        String sql="UPDATE tbl_producto SET nombre='"+prod.getNombre()+"',valor="+
                prod.getValor()+",stock="+prod.getStock()+ "WHERE codigo='"+prod.getCodigo()+"'";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println("Error. "+e);
        }
        return false;
    }
    
    @Override
    public boolean eliminar(String cod ){
        String sql="DELETE FROM tbl_producto WHERE codigo='"+cod+"'";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println("Error. "+e);
        }
        return false;
    }
}
