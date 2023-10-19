package Practica_5;

public class Auto {
    private String nombre;
    private String patente;
    
    public Auto(String unNombre, String unaPatente){
        setNombre(unNombre);
        setPatente(unaPatente);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }
    
    public String toString(){
        String aux;
        aux = "El nombre del dueño del auto es "+nombre+" y la patente del auto es"+patente;
        return aux;
    }
}

