# Copyright (c) 2021-2025, Marek Gagolewski <https://www.gagolewski.com>


.PHONY:  r check build clean purge sphinx test

PKGNAME="ExampleRcppStringi"

all: r

r:
	R CMD INSTALL . --html

reload: r
	# https://github.com/gagolews/home_bin
	if [ `whoami` = "gagolews" ]; then \
		jupyter-qtconsole-sender --silent "reload('${PKGNAME}')"; \
	fi

testthat:
	cd tests && Rscript -e 'source("testthat.R")'

test: r testthat

stop-on-utf8:
	# Stop if some files are not in ASCII:
	[ -z "`file -i DESCRIPTION configure configure.win \
	        NAMESPACE cleanup R/* src/* man/* inst/* tools/* | \
	    grep 'text/' | grep -v 'us-ascii' | tee /dev/stderr`" ]

build:
	cd .. && R CMD build ${PKGNAME}

check: stop-on-utf8 build
	cd .. && R CMD check `ls -t ${PKGNAME}*.tar.gz | head -1` --no-manual

check-cran: stop-on-utf8 build
	cd .. && R_DEFAULT_INTERNET_TIMEOUT=240 \
	    _R_CHECK_CRAN_INCOMING_REMOTE_=FALSE \
	    R CMD check `ls -t ${PKGNAME}*.tar.gz | head -1` --as-cran


################################################################################

clean:
	rm -rf revdep/

purge: clean
# 	rm -f man/*.Rd
# 	rm -rf docs/
