MAIN := 00-bsi-full
DIRS := 01-bsi-wednesday 02-bsi-thursday 03-bsi-friday 04-bsi-saturday 05-bsi-sunday testing

# copies ***.txt questions from main to directory of day that has file with the same name
sync:
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
