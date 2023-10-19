package Practica_5;

public abstract class Coro {
    private String nombreCoro;
    private Director director;
    
    public Coro(String unNombreCoro, Director unDirector){
        setNombreCoro(unNombreCoro);
        setDirector(unDirector);
    }

    public String getNombreCoro() {
        return nombreCoro;
    }

    public void setNombreCoro(String nombreCoro) {
        this.nombreCoro = nombreCoro;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }
    
    public String toString(){
        String aux;
        aux = "Nombre del coro "+nombreCoro+ "datos del director: "+director.toString();
        return aux;
    }

    public abstract void agregarCorista(Corista unCorista);
    public abstract boolean estaLleno();
    public abstract boolean estaBienFormado();
}