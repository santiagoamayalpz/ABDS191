
--TSQL

/*

--DECLARAR VARIABLE 

declare @idCliente int

--inicializar o asignar valor

set @idCliente = 8

--if

--IF @idCliente = 8
--select * from Clientes where id_cliente = @idCliente

declare @edad int 
set @idCliente = 9 

IF @idCliente = 9
begin
	set @edad = 25
	select * from Clientes where id_cliente = @idCliente
	print @edad

	IF EXISTS(select * from Clientes where id_cliente = 10)
	print 'SI EXISTE'

end
	else
		begin
		print 'Error:'
		print 'id no autorizado para la consulta'
	end

declare @contador int = 0

while @contador <= 10
begin
	print @contador
	set @contador = @contador + 1
end



--return

declare @contador int = 0

while @contador <= 10
begin
	print @contador
	set @contador = @contador + 1
	IF @contador = 3
		RETURN
	print('hola')
end
print('aqui continua el flujo')

*/

--break

declare @contador int = 0

while @contador <= 10
begin
	print @contador
	set @contador = @contador + 1
	IF @contador = 3
		BREAK
	print('hola')
end
print('aqui continua el flujo')
print('aqui tambien sigue')

BEGIN TRY
	set @contador = 'Santiago Amaya'
END TRY
BEGIN CATCH
print('la variable contador solo acepta enteros')
END CATCH

print('soy otra consulta')
print('yo tambien')