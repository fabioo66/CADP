package Practica_5;

public class Corista extends Persona{
    private int tonoFundamental;
    
    public Corista(String unNombre, int unDni, int unaEdad, int unTono){
        super(unNombre, unDni, unaEdad);
        setTonoFundamental(unTono);
    }

    public int getTonoFundamental() {
        return tonoFundamental;
    }

    public void setTonoFundamental(int tonoFundamental) {
        this.tonoFundamental = tonoFundamental;
    }
    
    public String toString(){
        String aux;
        aux = super.toString()+"tono fundamental "+tonoFundamental;
        return aux;
    }
}