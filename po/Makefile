###########################################################
NAME=knxm-mkusbmath-debian
SRCDIR=../bin/
###########################################################
PO=$(wildcard *.po)
MO=$(PO:.po=.mo)
all: ${MO}

.PHONY : all clean

${NAME}.pot: ${SRCDIR}${NAME}
	xgettext -o ${NAME}.pot ${SRCDIR}${NAME} --language=Shell

%.pox: ${NAME}.pot
	bash updatepox.sh ${NAME} $*

%.po: %.pox
	cp $*.pox $*.po

%.mo: %.po
	msgfmt -o $*.mo $*.po

install: all
	cp ja.mo ja/LC_MESSAGES/${NAME}.mo

clean: 
	@rm *.mo 
