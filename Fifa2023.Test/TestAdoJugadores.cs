using Fifa2023.Core;

namespace Fifa2023.Test;
public class TestAdoJugadores : TestAdo
{
    [Theory]
    [InlineData(2)]
    public void TraerJugadores(sbyte IdJugador)
    {
        var jugador = Ado.GetJugadores(IdJugador);

        Assert.NotNull(jugador);
    }

    [Fact]
    public void TraerJugador()
    {
        var jugador = Ado.GetJugadores();

        Assert.NotEmpty(jugador);
    }
    [Fact]
    public void AltaJugadores()
    {
        sbyte idJugador = 2;
        string usuario = "Raul";
        string nombre = "Jorge";
        string apellido = "Copa";
        string contrasena = "12345678";
        int monedas = 5000; 

        var jugadores = Ado.GetJugadores(idJugador);

        Assert.Null(jugadores);

        var nuevojugador = new Jugadores()
        {
            IdJugador = idJugador,
            Usuario = usuario,
            Nombre = nombre,
            Apellido = apellido,
            Contrasena = contrasena,
            Monedas = monedas
        };

        Ado.AltaJugadores(nuevojugador);        
    }
}
