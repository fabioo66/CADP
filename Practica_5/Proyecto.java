package Practica_5;

public class Proyecto {
    private String nombreProyecto;
    private int codigo;
    private String nombreDirector;
    private Investigador vector[];
    private int cantInvestigadores;
    
    public Proyecto(String unNombre, int unCodigo, String unNombreDirector){
        setNombreProyecto(unNombre);
        setCodigo(unCodigo);
        setNombreDirector(unNombreDirector);
        vector = new Investigador[50];
        for(int i=0; i<50; i++)
            vector[i] = null;
        cantInvestigadores = 0;
    }

    public String getNombreProyecto() {
        return nombreProyecto;
    }

    public void setNombreProyecto(String nombreProyecto) {
        this.nombreProyecto = nombreProyecto;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }
    
    public int getCantInvestigadores(){
        return cantInvestigadores;
    }
    
    public void agregarInvestigador(Investigador unInvestigador){
        if(cantInvestigadores < 50){
            vector[cantInvestigadores] = unInvestigador;
            cantInvestigadores++;
        }
        else
            System.out.println("No quedan cupos para agregar otro investigador");
    }
    
    public double dineroTotalOtorgado(){
        double total=0;
        for(int i=0; i<cantInvestigadores; i++)
            total = total + vector[i].montoTotal();
        return total;
    }
    
    public void otorgarTodos(String nombre_completo){
        int pos=0;
        while(pos < cantInvestigadores && !vector[pos].getNombre().equals(nombre_completo))
            pos++;
        if(pos < cantInvestigadores){
            int faltantes = 5 - vector[pos].getCantSubsidios();
            for(int i=0; i<faltantes; i++)
                vector[pos].agregarSubsidio(new Subsidio(500, "Porque quiero"));
        }
        else
            System.out.println("No se encontro el investigador con el nombre "+nombre_completo);
    }

    public String toString() {
    String aux="";
    aux += "Nombre del proyecto "+nombreProyecto+" codigo "+codigo+" nombre del director "+nombreDirector+" el total de dinero otorgado es "+this.dineroTotalOtorgado()+"\n";
    for(int i=0; i<cantInvestigadores; i++)
        aux+= vector[i].toString()+"\n";
    return aux;
    }
}
