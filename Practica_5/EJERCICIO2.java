/*d) Realice un programa que instancie un estacionamiento con 3 pisos y 3 plazas por piso.
Registre 6 autos en el estacionamiento en distintos lugares.
Muestre la representación String del estacionamiento en consola.
Muestre la cantidad de autos ubicados en la plaza 1.
Lea una patente por teclado e informe si dicho auto se encuentra en el
estacionamiento o no. En caso de encontrarse, la información a imprimir es el piso y
plaza que ocupa.*/
package Practica_5;

import PaqueteLectura.Lector;

public class EJERCICIO2 {

    public static void main(String[] args) {
        Estacionamiento E = new Estacionamiento("El garage de Tito", "8 y 44", 10, 22, 3, 3);
        for(int i= 0; i<6; i++){
            System.out.println("Ingrese el nombre de la persona");
            String nombre = Lector.leerString();
            System.out.println("Ingrese la patente del auto");
            String patente = Lector.leerString();
            System.out.println("Ingresar un numero de piso");
            int piso = Lector.leerInt();
            System.out.println("Ingresar un numero de plaza");
            int plaza = Lector.leerInt();
            Auto A = new Auto(nombre, patente);
            E.registrarAuto(A,piso,plaza);
        }
        System.out.println(E.toString());
        System.out.println(E.cantAutosXPlaza(1));
        
        System.out.println("Ingrese la patente de su auto para la busqueda");
        String patenteRandom = Lector.leerString();
        E.buscarAutoXPatente(patenteRandom);
    }
}

