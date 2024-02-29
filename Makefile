# library name
lib.name = \
	pdUtils

PATH_PD_OBJS = pd_objs

datafiles = \
	README.md \
	$(wildcard $(PATH_PD_OBJS)/*.pd $(PATH_PD_OBJS)/*/*.pd) \
	$(wildcard $(PATH_PD_OBJS)/*.script $(PATH_PD_OBJS)/*/*.script)

# include pd-lib-builder
PDLIBBUILDER_DIR=dependencies/pd-lib-builder
include $(PDLIBBUILDER_DIR)/Makefile.pdlibbuilder
