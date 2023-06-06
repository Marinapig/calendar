LIBS = -lbsd
SRC = calendar.c day.c io.c ostern.c paskha.c pesach.c
COMMON_BUILD = $(CC) ${CFLAGS} 
INTER = de_DE.UTF-8 hr_HR.UTF-8 ru_RU.UTF-8 fr_FR.UTF-8

calendar: ${SRC}
	${COMMON_BUILD} ${SRC} ${LIBS} -o calendar
.PHONY: clean
.PHONY: install

install:
	install -d ${DESTDIR}/${PREFIX}/bin/
	install -o root -g root -m 755 ./calendar ${DESTDIR}/usr/bin/calendar
	#install -d -o root -g root -m 755 ${DESTDIR}/usr/share/calendar
	install -d ${DESTDIR}/usr/share/calendar
	install -o root -g root -m 444 \
		./calendars/calendar.* ${DESTDIR}/usr/share/calendar
	for lang in ${INTER}; do \
		install -d -o root -g root ${DESTDIR}/usr/share/calendar/$${lang}; \
		install -D -o root -g root -m 444 ./calendars/$${lang}/calendar.* ${DESTDIR}/usr/share/calendar/$${lang};  \
	done

clean:
	rm -f calendar
