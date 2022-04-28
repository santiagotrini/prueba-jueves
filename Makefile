identidad: identidad.c
	@gcc -o identidad identidad.c

factorial: factorial.c
	@gcc -o factorial factorial.c

area: area.c
	@gcc -o area area.c

clean:
	@rm factorial area identidad a.out

test: factorial area identidad
	@bash tests.sh
