/*Escriba un programa que instancie un coro de cada tipo. Lea o bien la cantidad de
coristas (en el caso del coro semicircular) o la cantidad de hileras e integrantes por
hilera (en el caso del coro por hileras). Luego cree la cantidad de coristas necesarios,
leyendo sus datos, y almacenándolos en el coro. Finalmente imprima toda la
información de los coros indicando si están bien formados o no.*/

package Practica_5;

import PaqueteLectura.Lector;

public class EJERCICIO4{

    public static void main(String[] args) {
        Director D1 = new Director("Fabio",45579759,33,5);
        CoroSemicircular CS = new CoroSemicircular("El coro de fabito ",D1, 3);
        Director D2 = new Director("Cape",4565312, 20,1);
        CoroHileras CH = new CoroHileras("El coro del keip", D2, 3);
        int i,j;

        for(i=0; i<3; i++){
            System.out.println("Ingrese el nombre del corista para el coro semicircular");
            String nombre = Lector.leerString();
            System.out.println("Ingrese el DNI del corista para el coro semicircular");
            int DNI = Lector.leerInt();
            System.out.println("Ingrese la edad del corista para el coro semicircular");
            int edad = Lector.leerInt();
            System.out.println("Ingrese el tono fundamental del corista para el coro semicircular");
            int tonoFundamental = Lector.leerInt();
            Corista coristaS = new Corista(nombre, DNI, edad, tonoFundamental);
            CS.agregarCorista(coristaS);
        }        
        
        for(i=0; i<3; i++)
            for(j=0; j<3; j++){
                System.out.println("Ingrese el nombre del corista para el coro por hileras");
                String nombre2 = Lector.leerString();
                System.out.println("Ingrese el DNI del corista para el coro por hileras");
                int DNI2 = Lector.leerInt();
                System.out.println("Ingrese la edad del corista para el coro por hileras");
                int edad2 = Lector.leerInt();
                System.out.println("Ingrese el tono fundamental del corista para el coro por hileras");
                int tonoFundamental2 = Lector.leerInt();
                Corista coristaH = new Corista(nombre2, DNI2, edad2, tonoFundamental2);
                CH.agregarCorista(coristaH);
            }
        System.out.println(CH.toString());
        System.out.println(CH.estaBienFormado());
    }
}

