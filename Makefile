PLTCLI=bin/pltcli

all: docs/images/cos.png docs/images/sin.png docs/images/sin_cos.png documents

documents: $(wildcard docs/*md)
	mkdocs build

docs/images/cos.png: $(PLTCLI) sample_data/cos.csv
	$(PLTCLI) sample_data/cos.csv -o $@
docs/images/sin.png: $(PLTCLI) sample_data/sin.csv
	$(PLTCLI) sample_data/sin.csv -o $@
docs/images/sin_cos.png: $(PLTCLI) sample_data/sin.csv sample_data/cos.csv
	$(PLTCLI) sample_data/sin.csv sample_data/cos.csv -o $@
