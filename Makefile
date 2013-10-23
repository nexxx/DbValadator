SRCFOLDER = src
DISTFOLDER = dist
RESFOLDER = res
MAINPROG = DbValadator

PKGS = --pkg gtk+-3.0
#--pkg gee-0.8 --pkg gio-2.0 --pkg gtk+-3.0

all: 
	valac $(PKGS) $(SRCFOLDER)/*.vala -o $(DISTFOLDER)/$(MAINPROG)
	cp -r $(RESFOLDER) $(DISTFOLDER)/

clean:	
	rm -rf $(DISTFOLDER)/*
	
run:
	$(DISTFOLDER)/$(MAINPROG)

