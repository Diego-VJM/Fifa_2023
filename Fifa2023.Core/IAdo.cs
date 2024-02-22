namespace Fifa2023.Core;
public interface IAdo
{
    
    void AltaFutbolistas(Futbolistas futbolistas);
    public Futbolistas? GetFutbolistas(sbyte idFutbolista);
    public List<Futbolistas> GetFutbolistas();
    
    void AltaHAbilidades(Habilidades habilidades);
    public Habilidades? GetHabilidades(sbyte IdHabilidad);
    public List<Habilidades> GetHabilidades();

    void AltaJugadores(Jugadores jugadores);
    public Jugadores? GetJugadores(sbyte idJugador);
    public List<Jugadores> GetJugadores();

    void AltaPosesion(Posesion posesion);
    public Posesion? GetPosesion(sbyte idJugador,sbyte idFutbolista);
    public List<Posesion> GetPosesion();
    void AltaPosesionHabilidad(PosesionHabilidad posesionHabilidad);
    public PosesionHabilidad? GetPosesionHabilidad(sbyte IdHabilidad,sbyte idFutbolista);
    public List<PosesionHabilidad> GetPosesionHabilidad();
    void AltaPosiciones(Posiciones posiciones);
    public Posiciones? GetPosiciones(sbyte idPosicion, string Posicion);
    public List<Posiciones> GetPosiciones();
    void AltaTransferencias(Transferencias transferencias);
    public Transferencias? GetTransferencias(sbyte idTransferencia);
    public List<Transferencias> GetTransferencias();
}
