package Practica_5;

public class CoroSemicircular extends Coro{
    private Corista vector[];
    private int cantCoristas;
    private int indexToAdd;
    
    public CoroSemicircular(String unNombreCoro, Director unDirector, int unaCantCoristas){
        super(unNombreCoro, unDirector);
        this.cantCoristas = unaCantCoristas;
        vector = new Corista[unaCantCoristas];
        for(int i=0; i<unaCantCoristas; i++)
            vector[i]=null;
        indexToAdd=0;
    }

    public int getCantCoristas() {
        return cantCoristas;
    }

    public void setCantCoristas(int cantCoristas) {
        this.cantCoristas = cantCoristas;
    }

    public int getIndexToAdd() {
        return indexToAdd;
    }

    public void setIndexToAdd(int indexToAdd) {
        this.indexToAdd = indexToAdd;
    }
    
    public void agregarCorista(Corista unCorista){
        if(!estaLleno()){
            vector[indexToAdd]= unCorista;
            indexToAdd++;
        }
        else
            System.out.println("El coro esta lleno");
    }
    
    public boolean estaLleno(){
        return(indexToAdd == cantCoristas);
    }

    public boolean estaBienFormado(){
        int pos=0;
        boolean aux=true;
        if(estaLleno()){
            while(pos+1 < cantCoristas && aux==true)
                if(vector[pos].getTonoFundamental() > vector[pos+1].getTonoFundamental()){
                    pos++;
                    aux=true;
                }
                else
                    aux=false;
        }
        return aux;
    }
    
    public String toString(){
        String aux="";
        aux+= super.toString()+"\n";
        for(int i=0; i<cantCoristas; i++)
            aux+= "Datos del corista "+i+ " : "+vector[i].toString()+"\n";
        return aux;
    }
}

