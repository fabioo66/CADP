package Practica_5;

public abstract class Recitales {
    private String nombreBanda;
    private String vector[];
    private int cantTemas;
    private int indice;
    
    public Recitales(String unNombre, int unaCantTemas){
        setNombreBanda(unNombre);
        this.cantTemas = unaCantTemas;
        vector = new String[unaCantTemas];
        for (int i=0; i<unaCantTemas; i++)
            vector[i]=null;
        indice = 0;
    }

    public int getCantTemas() {
        return cantTemas;
    }

    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }
    
    public void agregarTema(String unTema){
        if(indice < cantTemas){
            vector[indice] = unTema;
            indice++;
        }
    }
    
    public String getTema(int pos){
        return vector[pos];
    }
    
    public String toString(){
        String aux="";
        for(int i=0; i<cantTemas; i++)
            aux+= "Y ahora tocaremos "+getTema(i)+"\n";
        return aux;
    }
    
    public abstract String actuar();
    public abstract double calcularCosto();
}
