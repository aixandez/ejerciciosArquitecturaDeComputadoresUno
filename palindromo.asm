JMP start
cad1: DB "MENEM"
DB 0


start:

	MOV A, cad1 ; Cargo en A el puntero a la cadena

.loop:	 ; Recorro la cadena y la apilo

	
	MOV B, [A] ; el contenido de la pos A lo guardo en el registro B
	MOV [232] , B ; me guardo en el registro b la pos del inicio de pila
	PUSH B ; apilo
	INC A ; inclemento A
	INC D ; cuenta la cantidad de carateres
	CMP B, 0 ; comparo por si fin de la cadena 0
	JNE .loop

	POP B ; Saco el 0 de la pila
	DEC D ; resto 1 del 0


	MOV A, cad1 ; Cargo en A el puntero a la cadena
	
.loop2: ; Desapilo y comparo con la cadena 
	CMP D, 0
	JE .iguales
	MOV C, [A]
	MOV [232] , C
	MOV [233] , '='
	POP B
	MOV [234] , B
	INC A
	DEC D
	CMP C,B
	JE .loop2



.iguales:
	MOV [232] , 'I'
	MOV [233] , 'g'
	MOV [234] , 'u'
	MOV [235] , 'a'
	MOV [236] , 'l'
	MOV [237] , 'e'
	MOV [238] , 's'

.fin:

RET
