MAIN := 00-bsi-full
TESTING_DIR := testing
DIRS := 01-bsi-wednesday 02-bsi-thursday 03-bsi-friday 04-bsi-saturday 05-bsi-sunday $(TESTING_DIR)

UNAME := $(shell uname)
SED := sed

ifeq ($(UNAME), Darwin)
	SED := gsed
endif

# copies ***.txt questions from main to directory of day that has file with the same name
sync:
	mkdir -p $(TESTING_DIR)
	@for dir in $(DIRS); do \
		for file in $(MAIN)/*.txt; do \
			if [ -f $$dir/$$(basename $$file) ]; then \
				echo "Syncing $$file to $$dir/$$(basename $$file)"; \
				cp $$file $$dir/$$(basename $$file); \
			fi; \
		done; \
	done

images:
	@for dir in $(DIRS); do \
		mkdir -p $$dir/img; \
		cp $(MAIN)/img/* $$dir/img; \
	done

old:
	$(SED) -i 's/QQ/X/g' **/*.txt

new:
	$(SED) -i '1s/X/QQ/g' **/*.txt
