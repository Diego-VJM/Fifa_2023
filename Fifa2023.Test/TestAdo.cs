using Fifa2023.Core;
using Fifa2023.Dapper;

namespace Fifa2023.Test;
public class TestAdo
{
    protected readonly IAdo Ado;
    private const string _cadena = "Server=localhost;Database=5to_FIFA;Uid=5to_agbd;pwd=Trigg3rs!;Allow User Variables=True";
    public TestAdo() => Ado = new AdoDapper(_cadena);
    public TestAdo(string cadena) => Ado = new AdoDapper(cadena);
}
