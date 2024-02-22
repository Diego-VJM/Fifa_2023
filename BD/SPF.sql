delimiter $$
drop procedure if exists AltaJugadores $$
create procedure AltaJugadores (unidJugador mediumint unsigned, unUsuario varchar(45), 
								unNombre varchar(45), unApellido varchar(45), 
                                unaContraseña varchar(64), Monedas mediumint unsigned)
begin

insert into Jugadores (idJugador, Usuario, Nombre, Apellido, Contraseña, Monedas)
	values		(unidJugador, unUsuario, unNombre, unApellido, unaContraseña, Monedas);
		
End $$

delimiter $$
drop procedure if exists AltaHabilidades $$
create procedure AltaHabilidades (unidHabilidad tinyint, Nombre varchar(45), Descripcion varchar(45) )
begin

insert into Habilidades (idHabilidad, Nombre, Descripcion)
values (unidHabilidad, Nombre, Descripcion);

End $$

delimiter $$
drop procedure if exists AltaPosiciones $$
create procedure AltaPosiciones  (unidPosicion tinyint,unaPosicion varchar(45))
begin

insert into Posiciones (idPosicion,Posicion)
   	 values    (unidPosicion,unaPosicion);
End $$

delimiter $$
drop procedure if exists AltaPosesion$$
create procedure AltaPosesion (unIdFutbolista smallint,unIdJugador mediumint)
begin

insert into Posesion (IdFutbolista,IdJugador)
   	 values    (unIdFutbolista,unIdJugador);
End $$

delimiter $$
drop procedure if exists AltaPosesionHabilidad $$
create procedure AltaPosesionHabilidad (unIdFutbolista smallint,unIdHabilidad tinyint)
begin

insert into PosesionHabilidad (IdFutbolista,IdHabilidad)
   	 values    (unIdFutbolista,unIdHabilidad);
End $$

delimiter $$
drop procedure if exists AltaFutbolista $$
create procedure AltaFutbolista( unidFutbolista smallint, unNombre varchar(45), unApellido varchar(45), unNacimiento date, unVelocidad tinyint , unRemate tinyint , unPase tinyint , unDefensa tinyint , unidPosicion tinyint , unidHabilidad tinyint )
begin
	
insert into Futbolistas (idFutbolista, Nombre, Apellido, Nacimiento, Velocidad, Remate, Pase, Defensa, idPosicion, idHabilidad)
values (unidFutbolista, unNombre, unApellido , unNacimiento , unVelocidad , unRemate, unPase, unDefensa, unidPosicion, unidHabilidad);
End $$


delimiter $$

drop procedure if exists Publicar $$
create procedure Publicar (unidJugador mediumint unsigned, unidFutbolista smallint, Precio mediumint unsigned)
begin

insert into Transferencias (idTransferencia, Fecha, Precio, idVendedor, idComprador, idFutbolista, Transferencia_exitosa)
values(idTransferencia, NULL, Precio, idVendedor, NULL, idFutbolista, NULL);

end $$

delimiter $$

drop procedure if exists Comprar $$
create procedure Comprar (idTransferencia int, idComprador mediumint, Transferencia_exitosa bool )
begin

insert into Transferencias (idTransferencia, Fecha, Precio, idVendedor, idComprador, idFutbolista, Transferencia_exitosa)
values(idTransferencia, NULL, NULL, NULL, idComprador, NULL, Transferencia_exitosa);

end $$


delimiter $$
drop procedure if exists transferenciasActivas $$
create procedure transferenciasActivas (UnIdFutbolista smallint)

begin

select COUNT(Transferencia_exitosa) 'TransferenciaActiva'
from Transferencias
where Transferencia_exitosa = false
order by fecha asc; 

end $$

delimiter $$

drop function if exists GananciaEntre $$
create function GananciaEntre (UnIdJugador mediumint, Fecha1 datetime, Fecha2 datetime)
RETURNS INT READS SQL DATA 
begin 
declare Suma mediumint unsigned;
SELECT SUM(monedas) into Suma
FROM Jugadores
WHERE Fecha between Fecha1 AND Fecha2 
AND Transferencia_exitosa = True;

return Suma;

end $$
