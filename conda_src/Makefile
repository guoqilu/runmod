# FIXME
RELEASE_DIR := /u/wstucker/w/mosaic/EDA/conda_release

PACKAGE_DIRS := $(sort $(dir $(wildcard */meta.yaml)))
FAKE_DEPS := $(addsuffix .d,$(PACKAGE_DIRS))

ALL : $(FAKE_DEPS)

%.d : %meta.yaml %env.sh
	conda build $* --output-folder $(RELEASE_DIR)
	touch $@

clean:
	rm $(FAKE_DEPS)
