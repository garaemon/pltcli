PLTCLI=bin/pltcli

all: images/cos.png

images/cos.png: $(PLTCLI) sample_data/cos.csv
	$(PLTCLI) sample_data/cos.csv -o $@
