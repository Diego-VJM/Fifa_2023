using Fifa2023.Core;

namespace Fifa2023.Test;
public class TestAdoHabilidades : TestAdo
{
    [Theory]
    [InlineData(1)]
    public void TraerHabilidades(sbyte IdHabilidad)
    {
        var habilidad = Ado.GetHabilidades(IdHabilidad);

        Assert.NotNull(habilidad);
    }

    [Fact]
    public void TraerHabilidad()
    {
        var habilidad = Ado.GetHabilidades();

        Assert.NotEmpty(habilidad);
    }
    [Fact]
    public void AltaHAbilidades()
    {
        sbyte idHabilidad = 2;
        string Nombre = "Calidad";
        string Descripcion = "Le pega godeitor";

        var habilidades = Ado.GetHabilidades(idHabilidad);

        Assert.Null(habilidades);

        var nuevohabilidad = new Habilidades()
        {
            
        };

        Ado.AltaHAbilidades(nuevohabilidad);        
    }
}
