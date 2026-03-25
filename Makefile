AMBER_DIR := amber
BASH_DIR := bash

AMBER_FILES := $(wildcard $(AMBER_DIR)/*.ab)
AMBER_FILES := $(filter-out $(AMBER_DIR)/const.ab, $(AMBER_FILES))

BASH_FILES := $(patsubst $(AMBER_DIR)/%.ab,$(BASH_DIR)/%,$(AMBER_FILES))

all: $(BASH_FILES)

$(BASH_DIR)/%: $(AMBER_DIR)/%.ab
	@mkdir -p $(BASH_DIR)
	amber build $< $@
	chmod +x $@

clean:
	rm -f $(BASH_DIR)/*

.PHONY: all clean
