EXTENSION    = brin4postgis
EXTVERSION   = $(shell grep default_version $(EXTENSION).control | sed -e "s/default_version[[:space:]]*=[[:space:]]*'\([^']*\)'/\1/")
REGRESS      = brin4postgis
DOCS         = README.md

PG_CONFIG = pg_config

all:

release-zip: all
	git archive --format zip --prefix=brin4postgis-${EXTVERSION}/ --output ./brin4postgis-${EXTVERSION}.zip HEAD
	unzip ./brin4postgis-$(EXTVERSION).zip
	rm -f ./brin4postgis-$(EXTVERSION).zip
	rm -f ./brin4postgis-$(EXTVERSION)/.gitignore
	sed -i -e "s/__VERSION__/$(EXTVERSION)/g"  ./brin4postgis-$(EXTVERSION)/META.json
	zip -r ./brin4postgis-$(EXTVERSION).zip ./brin4postgis-$(EXTVERSION)/
	rm ./brin4postgis-$(EXTVERSION) -rf

DATA = $(wildcard *--*.sql)
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
