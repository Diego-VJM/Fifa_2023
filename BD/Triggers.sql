
DELIMITER $$
DROP TRIGGER IF EXISTS befInsTransferencias$$
CREATE TRIGGER befInsTransferencias BEFORE INSERT ON Transferencias
FOR EACH ROW
BEGIN
DECLARE Cantidad INT;
SELECT COUNT(*) INTO Cantidad
FROM Posesion
WHERE idJugador = NEW.idVendedor
AND idFutbolista = NEW.idFutbolista;


IF (Cantidad = 0) THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'El usuario no posee al futbolista';
END IF;
END $$

DELIMITER $$
DROP TRIGGER IF EXISTS befInsCompra $$
CREATE TRIGGER befInsCompra BEFORE INSERT ON Transferencias
FOR EACH ROW
BEGIN
DECLARE monedas_comprador INT;
DECLARE idJugador_existente INT;


SELECT Monedas INTO monedas_comprador
FROM Jugadores
WHERE idJugador = NEW.idComprador;


SELECT COUNT(*) INTO idJugador_existente
FROM Posesion
WHERE idJugador = NEW.idComprador
AND idFutbolista = NEW.idFutbolista;


IF (monedas_comprador < NEW.Precio) THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Monedas insuficientes';


ELSEIF (idJugador_existente > 0) THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Jugador en posesión';
END IF;
END $$
