package Practica_5;

public class Subsidio {
    private double montoPedido;
    private String motivo;
    private boolean PedidoSiONo;
     
    public Subsidio(double unMonto, String unMotivo){
        setMontoPedido(unMonto);
        setMotivo(unMotivo);
        PedidoSiONo = false;
    }

    public double getMontoPedido() {
        return montoPedido;
    }

    public void setMontoPedido(double montoPedido) {
        this.montoPedido = montoPedido;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }
}
