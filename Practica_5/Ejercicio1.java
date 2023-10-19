package Practica_5;

public class Ejercicio1 {

    public static void main(String[] args) {
        /*Escriba un programa que instancie un proyecto con tres investigadores. Agregue dos
        subsidios a cada investigador y otorgue los subsidios de uno de ellos. Luego imprima
        todos los datos del proyecto en pantalla.*/
        Proyecto P = new Proyecto("Tiemblen zurdos", 123132, "Javier Milei");
        Investigador I1 = new Investigador("Pepe", 2, "Ingeniero");
        Investigador I2 = new Investigador("Raul", 3, "Economista");
        Investigador I3 = new Investigador("Juan", 5, "Progamador");
        
        P.agregarInvestigador(I1);
        P.agregarInvestigador(I2);
        P.agregarInvestigador(I3);
        
        I1.agregarSubsidio(new Subsidio(500, "porque soy crack"));
        I1.agregarSubsidio(new Subsidio(1200, "porque soy crack x2"));
        
        I2.agregarSubsidio(new Subsidio(500, "porque soy crack"));
        I2.agregarSubsidio(new Subsidio(500, "porque soy crack x2"));
        
        I3.agregarSubsidio(new Subsidio(777, "porque soy crack"));
        I3.agregarSubsidio(new Subsidio(777, "porque soy crack x2"));
        
        System.out.println(P.toString());
        P.otorgarTodos("Pedro");
        System.out.println(I1.getCantSubsidios());
        System.out.println(I1.montoTotal());
        System.out.println(P.dineroTotalOtorgado());
    }
}
