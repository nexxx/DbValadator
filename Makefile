#src Folder
SRC = src
#dist Folder
DIST = dist
#res Folder
RES = res
#Name of Main Program
MAINPROG = DbValadator
#List of src Folders
FOLDERS = Gui
#List of src Folders with added $(SRC) Prefix
FL = $(SRC) $(addprefix $(SRC)/,$(FOLDERS))
#List of all Vala Files realtive to Makefile
FILES = $(addsuffix /*.vala,$(FL))

#Definitions of Packages to use
PKGS = --pkg gtk+-3.0
#--pkg gee-0.8 --pkg gio-2.0 --pkg gtk+-3.0

all: 
	valac $(PKGS) $(FILES) -o $(DIST)/$(MAINPROG)
	cp -r $(RES) $(DIST)/

clean:	
	rm -rf $(DIST)/*
	
run:
	$(DIST)/$(MAINPROG)

