package Practica_5;

public class CoroHileras extends Coro{
    private Corista matriz[][];
    private int df;
    private int cantCoristas;
    private int indiceF;
    private int indiceC;
    
    public CoroHileras(String unNombre, Director unDirector, int unaDf){
        super(unNombre, unDirector);
        this.df = unaDf;
        matriz = new Corista[df][df];
        for(int i=0; i<df; i++)
            for(int j=0; j<df; j++)
                matriz[i][j]=null;
        indiceF=0;
        indiceC=0;
        cantCoristas=0;
    }

    public int getCantCoristas() {
        return cantCoristas;
    }

    public int getDf() {
        return df;
    }

    public void setDf(int df) {
        this.df = df;
    }

    public int getIndiceF() {
        return indiceF;
    }

    public int getIndiceC() {
        return indiceC;
    }

    public boolean estaLleno(){
        return(cantCoristas == df*df);
    }
    
    public void agregarCorista(Corista unCorista){
        if(!estaLleno()){
            if(indiceC < df){
                matriz[indiceF][indiceC]=unCorista;
                indiceC++;
                cantCoristas++;
            }
            else if(indiceF < df){
                indiceC=0;
                indiceF++;
                matriz[indiceF][indiceC]=unCorista;
                indiceC++;
                cantCoristas++;
            }    
        }
    }
    
    public boolean estaBienFormado(){
        int posi=0,posj=0;
        boolean aux=true;
        if(estaLleno())
            while(posi+1 < df && aux == true)
                if(matriz[posi][posj].getTonoFundamental() >= matriz[posi+1][posj].getTonoFundamental()){
                    posj=0;
                    while(posj+1 < df && aux == true)
                        if(matriz[posi][posj].getTonoFundamental() == matriz[posi][posj+1].getTonoFundamental()){
                            posj++;
                            aux = true;
                        }
                        else
                            aux = false;
                    posi++;            
        }
        return aux;
    }
            
            
    public String toString(){
        String aux;
        aux= super.toString()+"\n";
        for(int i=0; i<indiceF; i++)
            for(int j=0; j<indiceC; j++)
                aux+= "Datos del corista en la hilera: "+i+","+j+" "+matriz[i][j].toString()+"\n";
        return aux;
    }
}

