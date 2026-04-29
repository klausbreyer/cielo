# CIELO

Single-page interactive CIELO TEK guide with auto-scaling calculator.

## Build

The repo holds **sources only**. `make build` produces a self-contained, deployable `dist/` (gitignored): `index.html`, minified `style.css`, `assets/`, `vendor/`.

- `make build` - rebuild `dist/`. First run installs `node_modules` automatically.
- `make start` - rebuild and serve `dist/` at http://localhost:8000
- `make clean` - drop `dist/` and `node_modules/`

CSS source is `src/style.css` (Tailwind v4 + cactus `@theme` + custom rules). Edit utility classes directly in `index.html`; Tailwind picks them up via `@source` on the next build. Static assets live in `assets/`, fonts in `vendor/fonts.css` + `vendor/fonts/`.

To deploy: run `make build`, upload the contents of `dist/`.

## Versioning

This project uses [Semantic Versioning](https://semver.org/). The current version is displayed in the footer of `index.html`.

**After every change, update the version in the footer (`<p class="text-gray-400 mt-2">vX.Y.Z</p>` in the `<footer>` section of `index.html`):**

- **MAJOR** (X) - breaking changes: restructured layout, removed features, changed URL/hosting setup
- **MINOR** (Y) - new features or sections added (e.g. new calculator option, new phase, new callout box)
- **PATCH** (Z) - bug fixes, text edits, style tweaks, small corrections

## Style Rules

- **No mdashes or ndashes anywhere** - never use `&mdash;`, `—`, `&ndash;`, or `–`. Applies to HTML, JS strings, comments, commit messages, and this CLAUDE.md itself. Always use a plain hyphen `-` with spaces around it.
