package Practica_5;

public class Fecha {
    private String ciudad;
    private String dia;
    
    public Fecha(String unaCiudad, String unDia){
        setCiudad(unaCiudad);
        setDia(unDia);
    }
    
    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }
 }
