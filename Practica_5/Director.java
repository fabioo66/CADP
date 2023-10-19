package Practica_5;

public class Director extends Persona{
    private int antiguedad;
    
    public Director(String unNombre, int unDni, int unaEdad, int unaAntiguedad){
        super(unNombre, unDni, unaEdad);
        setAntiguedad(unaAntiguedad);
    }    
    
    public int getAntiguedad(){
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    public String toString(){
        String aux;
        aux= super.toString()+" años de antiguedad "+antiguedad;
        return aux;
    }
}
