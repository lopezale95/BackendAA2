
package Interfaces;

import Modelo.ClaseProducto;
import java.util.List;

public interface CRUD {
    public List listarProducto();
    public ClaseProducto list(String cod);
    public boolean adicionar(ClaseProducto prod);
    public boolean editar (ClaseProducto prod);
    public boolean eliminar(String cod);       
}
