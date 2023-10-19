package Practica_5;

public class Investigador {
    private String nombre;
    private int categoria;
    private String especialidad;
    private Subsidio vector[];
    private int cantSubsidios;
    
    public Investigador(String unNombre, int unaCategoria, String unaEspecialidad){
        setNombre(unNombre);
        setCategoria(unaCategoria);
        setEspecialidad(unaEspecialidad);
        vector = new Subsidio[5];
        for(int i=0; i<5; i++)
            vector[i] = null;
        cantSubsidios = 0;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    
    public int getCantSubsidios(){
        return cantSubsidios;
    }
    
    public void agregarSubsidio(Subsidio unSubsidio){
        if(cantSubsidios < 5){
            vector[cantSubsidios] = unSubsidio;
            cantSubsidios++;
        }
        else
            System.out.println("No se pudo generar el subsidio");
    }
    
    public double montoTotal(){
        double cant=0;
        if(cantSubsidios > 0)
            for(int i=0; i<cantSubsidios; i++)
                cant= cant + vector[i].getMontoPedido();
        return cant;
    }
    
    public String toString(){
        String aux;
        aux = "nombre "+nombre+" categoria "+categoria+" especialidad "+especialidad+" dinero total otorgado "+montoTotal();
        return aux;
    }          
}

