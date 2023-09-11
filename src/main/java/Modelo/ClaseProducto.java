
package Modelo;


public class ClaseProducto {
    private String codigo;
    private String nombre;
    private Double valor;
    private int stock;
    
    public ClaseProducto(){
    }
    
    public ClaseProducto(String codigo,String nombre, Double valor,int stock){
        this.codigo = codigo;
        this.nombre = nombre;
        this.valor = valor;
        this.stock = stock;
    }
    
    public String getCodigo(){
        return codigo;
    }
    public void setCodigo(String codigo){
        this.codigo = codigo;
    }
    public String getNombre(){
        return nombre;    
    }
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    public Double getValor(){
        return valor;
    }
    public void setValor(Double valor){
        this.valor = valor;
    }
    public int getStock(){
        return stock;
    }
     public void setStock(int stock){
        this.stock = stock;
    }
}
