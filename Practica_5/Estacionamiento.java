package Practica_5;

public class Estacionamiento {
    private String nombre;
    private String direccion;
    private int horaApertura;
    private int horaCierre;
    private Auto matriz[][];
    private int cantPisos;
    private int cantPlazas;
    
    public Estacionamiento(String unNombre, String unaDireccion){
        setNombre(unNombre);
        setDireccion(unaDireccion);
        setHoraApertura(8);
        setHoraCierre(21);
        matriz = new Auto[5][10];
        for(int i=0; i<5; i++)
            for(int j=0; j<10; j++)
                matriz[i][j] = null;
    }
    
    public Estacionamiento(String unNombre, String unaDireccion, int unaHoraApertura, int unaHoraCierre, int N, int M){
        setNombre(unNombre);
        setDireccion(unaDireccion);
        setHoraApertura(unaHoraApertura);
        setHoraCierre(unaHoraCierre);
        this.cantPisos = N;
        this.cantPlazas = M;
        matriz = new Auto[N][M];
        for(int i=0; i<N; i++)
            for(int j=0; j<M; j++)
                matriz[i][j] = null;
    }
    
    public int getCantPisos(){
        return cantPisos;
    }

    public int getCantPlazas(){
        return cantPlazas;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getHoraApertura() {
        return horaApertura;
    }

    public void setHoraApertura(int horaApertura) {
        this.horaApertura = horaApertura;
    }

    public int getHoraCierre() {
        return horaCierre;
    }

    public void setHoraCierre(int horaCierre) {
        this.horaCierre = horaCierre;
    }
    
    public void registrarAuto(Auto autoA, int numeroPisoX, int numeroPlazaY){
        matriz[numeroPisoX][numeroPlazaY] = autoA;
    }
    
    public String buscarAutoXPatente(String unaPatente){
        String aux = "No se encontro la patente "+unaPatente;
        int posi = 0, posj;
        boolean encontre = false;
        while(posi < cantPisos && encontre == false){
            posj=0;
            while(posj < cantPlazas && encontre == false){
                if(matriz[posi][posj] != null && matriz[posi][posj].getPatente().equals(unaPatente)){
                    encontre = true;
                    aux = "El auto de la patente " + unaPatente + " se encuentra en el piso " + posi + " y en la plaza " + posj;
                }    
                posj++;
            }    
            posi++;
        }
        return aux;
    }
    
    public String toString(){
        String aux= "";
        int i,j;
        for(i=0; i<cantPisos; i++)
            for(j=0; j<cantPlazas; j++){
                if(matriz[i][j] == null)
                    aux +="Piso "+i+" Plaza"+j+" Libre"+"\n";
                else
                    aux+= "Piso "+i+" Plaza"+j+matriz[i][j].toString()+"\n"; 
            }
        return aux;
    }
    
    public int cantAutosXPlaza(int unaPlaza){
        int cant=0;
        for(int i=0; i<cantPisos; i++)
            if(matriz[i][unaPlaza] != null)
                cant= cant++;
        return cant;
    }
}

