package Practica_5;

public class EventoOcasional extends Recitales{
    private String motivo;
    private String nombreContratante;
    private String dia;
    
    public EventoOcasional(String unNombre, int unaCantTemas, String unMotivo, String unNombreContratante, String unDia){
        super(unNombre, unaCantTemas);
        setMotivo(unMotivo);
        setNombreContratante(unNombreContratante);
        setDia(unDia);
    }
    
    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getNombreContratante() {
        return nombreContratante;
    }

    public void setNombreContratante(String nombreContratante) {
        this.nombreContratante = nombreContratante;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public String actuar(){
        String aux= "Un feliz cumpleaños para "+ nombreContratante+"\n"+super.toString();
        if(motivo.equals("a beneficio")){
            aux = "Recuerden colaborar con "+nombreContratante+ "\n"+ super.toString();
            return aux;
        }
        else if(motivo.equals("show de TV")){
            aux = "Saludos amigos televidentes"+"\n"+super.toString();
            return aux;
        }
        return aux;
    }
    
    public double calcularCosto(){
        if(motivo.equals("a beneficio")){
            return 0;
        }
        else if(motivo.equals("show de TV")){
            return 50000;
        }
        return 150000;
    }
}