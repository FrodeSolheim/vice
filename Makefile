uname := $(shell uname -a)
ifneq ($(findstring Msys,$(uname)),)
exe = .exe
else
exe =
endif

srcdir = fsbuild/_build/vice-src

all: build data x64sc${exe}

build:
	make -C ${srcdir}

data:
	cp -a ${srcdir}/data .
	find data -name "Makefile*" -delete

x64sc${exe}: ${srcdir}/src/x64sc${exe}
	cp ${srcdir}/src/x64sc${exe} x64sc${exe}

clean:
	if [ -d ${srcdir} ]; then \
		make -C ${srcdir} clean; fi
	rm -f x64sc${exe}
	rm -Rf data
