# speckle-community-theme

Discourse theme for speckle.community. **Intent: the forum is frontend-3.** Every surface should read as if it shipped from `speckle-server-internal/packages/frontend-3` (Nuxt UI v4, neutral zinc, primary blue, Inter). When forum and app disagree, the app wins: read its source (`assets/css/main.css`, `app.config.ts`, `layouts/default.vue`, Nuxt UI runtime defaults) rather than matching by eye.

Live configuration, theme IDs, deploy steps, rollback and branding images: `README.md`.

## Design rules

- **Tokens.** Every colour is a `--sp-*` token from `common/color_definitions.scss`, resolved per colour scheme with `dark-light-choose`. A new colour is a new token with light and dark values taken from frontend-3. Light and dark are equivalent: each change lands in both.
- **Surfaces.** Page and main header `--sp-surface-0`; sidebar, and the header strip above it, `--sp-surface-1`; cards `--sp-surface-2`; card and table header rows `--sp-surface-1`. One 1px `--sp-border` hairline per edge.
- **Scale.** Copy (post body, topic titles, excerpts, descriptions, sidebar links, notifications, search results) is in rem on Discourse's own text-size scale, so the reader's Text size preference reaches it; at Normal it reads ~10% larger than frontend-3. UI chrome (buttons, inputs, tabs, tags, counts, metadata) is in px at frontend-3 sizes: controls 32px tall with 13px text. Radii: sm 4, md 6, lg 8.
- **Controls** mirror Nuxt UI variants: solid primary, outline neutral (`.btn-default`), ghost (`.btn-flat`). `.nav-pills` is a segmented control at its natural width.
- **One centre line.** Every row of controls (list controls, post controls, topic map, profile stats strip) centres all its children on one line at one height.
- **Shared column.** Cards inside a post (topic map, post notices, code blocks, oneboxes) take the post text column's edges.
- **Steady header.** The sidebar seam runs unbroken through the header; the full logo stays when scrolled; the scrolled-topic title starts 24px right of the seam.
- **Speckle brand.** Customer branding (Enterprise categories) is an accent strip only; controls, links and tabs keep Speckle blue.

## Working on the theme

- **Specificity.** Core and plugin CSS often outrank a plain selector. Measure computed styles in the browser before and after each change; when a rule does not apply, find the winning core selector and outrank it by one step, keeping `!important` for genuine last resorts.
- **Partials** keep the `sp-` prefix (README explains the core `@import` collision).
- **Desktop geometry** (anything using `--topic-body-width` or `--d-sidebar-width`) lives in `desktop/desktop.scss` beside its `max-width: 767px` guard: phones can be served desktop view (iOS "Request Desktop Website").
- **Plugins** (reactions, solved, assign) render their own markup inside core areas; check changes on a real post that has likes and a solution.
- **Verify** every change in light and dark, in desktop view, mobile view, and desktop view at ~390px, across a topic list, a topic, a personal message, a profile and an admin page. Preview unreleased work as a non-default theme with `?preview_theme_id=<id>`.
- **Deploy** is push to `main`, then Check for updates in the admin (README).
- `screenshots/` is local reference only and stays out of git: it shows private Enterprise categories and admin data.

## Open work

- **Mobile banner.** The notifications prompt's close × overlaps its text; the search-banner hero takes half the first screen on phones. Compact both in `mobile/mobile.scss`.
- **Narrow desktop composer** (commit `badd501`): Reply/Close moved under the "replying to" line at ≤767px. Confirm on a device with the composer open and the keyboard up.
- **Enterprise customer header** (agreed direction, not built). For categories whose parent is Enterprise (parent slug held in a theme setting), replace the search banner with: a 48px logo tile with wordmarks contained, customer name and description, a "Private · <Customer> and Speckle" badge, category-scoped search, and the category colour as a 3px top strip. When the category colour is the default `0088CC`, white or black, the strip falls back to a neutral hairline. All 33 Enterprise categories have logos (30 square, 3 wide wordmarks).
- **Category colours** (forum data, not theme): Enterprise categories still on the default `0088CC` need real brand colours.
