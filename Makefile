LIBS = -lbsd
SRC = calendar.c day.c io.c ostern.c paskha.c pesach.c
COMMON_BUILD = $(CC) ${CFLAGS} 

calendar: ${SRC}
	${COMMON_BUILD} ${SRC} ${LIBS} -o calendar
.PHONY: clean

clean:
	rm -f calendar
