PLTCLI=bin/pltcli

all: docs/images/cos.png docs/images/inv_cos.png docs/images/inv_cos2.png docs/images/sin.png docs/images/sin_cos.png documents docs/images/cos_sin_from_one_file.png

documents: $(wildcard docs/*md)
	mkdocs build

docs/images/cos.png: $(PLTCLI) sample_data/cos.csv
	$(PLTCLI) sample_data/cos.csv -o $@
docs/images/inv_cos.png: $(PLTCLI) sample_data/cos.csv
	$(PLTCLI) sample_data/cos.csv[1:0] -o $@
docs/images/inv_cos2.png: $(PLTCLI) sample_data/cos.csv
	$(PLTCLI) sample_data/cos.csv[y:x] -o $@
docs/images/sin.png: $(PLTCLI) sample_data/sin.csv
	$(PLTCLI) sample_data/sin.csv -o $@
docs/images/cos_sin_from_one_file.png: $(PLTCLI) sample_data/cos_sin.csv
	$(PLTCLI) sample_data/cos_sin.csv[x:cos] sample_data/cos_sin.csv[x:sin] -o $@
docs/images/sin_cos.png: $(PLTCLI) sample_data/sin.csv sample_data/cos.csv
	$(PLTCLI) sample_data/sin.csv sample_data/cos.csv -o $@
