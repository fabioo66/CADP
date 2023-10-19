package Practica_5;

public class Gira extends Recitales{
    private String nombre;
    private Fecha vector[];
    private int cantFechas;
    private int indice;
    private int proxFecha;
    
    public Gira(String unNombre, int unaCantTemas, String unNombreGira, int unaCantFechas){
        super(unNombre, unaCantTemas);
        setNombre(unNombreGira);
        this.cantFechas = unaCantFechas;
        vector = new Fecha[unaCantFechas];
        for(int i=0; i<cantFechas; i++)
            vector[i]=null;
        indice=0;
        proxFecha = 0;
    }

    public String getNombre() {
        return nombre;
    }
    
    public int getCantFechas(){
        return cantFechas;
    }
    
    public int getProxFecha(){
        return proxFecha;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public void agregarFecha(Fecha unaFecha){
        if(indice < cantFechas){
            vector[indice] = unaFecha;
            indice++;
        }
    }

    public String actuar(){
        String result = "no esta disponible esa fecha";
        if (vector[proxFecha] != null){
            result = "Buenas noches …" + vector[getProxFecha()].getCiudad()+ "\n"+super.toString();;
            proxFecha++;
        }
        return result;
    }
    public double calcularCosto(){
        return 30000*cantFechas;
    }
}
