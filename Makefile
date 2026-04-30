.PHONY: start build clean

DIST := dist
PORT ?= 8000
VERSION := $(shell grep -oE 'v[0-9]+\.[0-9]+\.[0-9]+' src/index.html | head -1)
ZIP := cielo-$(VERSION).zip

node_modules: package.json
	npm install
	@touch node_modules

build: node_modules
	@rm -rf $(DIST)
	@mkdir -p $(DIST)
	cp -R src/. $(DIST)/
	npx @tailwindcss/cli -i src/assets/style.css -o $(DIST)/assets/style.css --minify
	@rm -f cielo-v*.zip
	@cd $(DIST) && zip -qr ../$(ZIP) .
	@echo "Built $(DIST)/ + $(ZIP) - ready to deploy"

start: build
	@echo "Serving http://localhost:$(PORT) from $(DIST)/"
	@python3 -m http.server $(PORT) --directory $(DIST)

clean:
	rm -rf $(DIST) node_modules cielo-v*.zip
