.PHONY: start build clean

DIST := dist
PORT ?= 8000

node_modules: package.json
	npm install
	@touch node_modules

build: node_modules
	@rm -rf $(DIST)
	@mkdir -p $(DIST)
	cp index.html $(DIST)/
	cp -R assets vendor $(DIST)/
	npx @tailwindcss/cli -i src/style.css -o $(DIST)/style.css --minify
	@echo "Built $(DIST)/ - ready to deploy"

start: build
	@echo "Serving http://localhost:$(PORT) from $(DIST)/"
	@python3 -m http.server $(PORT) --directory $(DIST)

clean:
	rm -rf $(DIST) node_modules
