package Practica_5;

import PaqueteLectura.Lector;

public class EJERCICIO3 {

    public static void main(String[] args) {
        EventoOcasional E = new EventoOcasional("Movistar Arena",3,"show privado","Santiago Gonzalez","6/10/2023");
        Gira G = new Gira("YSY A", 3, "YSYSMO",4);
        Fecha F;
        int i;
        for(i=0; i<3; i++){
            System.out.println("Ingrese un tema para el evento ocasional");
            String tema = Lector.leerString();
            E.agregarTema(tema);
            System.out.println("Ingrese un tema para la gira");
            String temaGira = Lector.leerString();
            G.agregarTema(temaGira);
        }
        
        for(i=0; i<4; i++){
            System.out.println("Ingrese la ciudad");
            String ciudad = Lector.leerString();
            System.out.println("Ingrese el dia");
            String dia = Lector.leerString();
            G.agregarFecha(F = new Fecha(ciudad, dia));
        }    
            
        System.out.println("El costo de este evento ocasional es "+E.calcularCosto());
        System.out.println(E.actuar());
        
        
        System.out.println("El costo de esta gira es "+G.calcularCosto());
        for(i=0; i<4; i++)
            System.out.println(G.actuar());
    }  
}
