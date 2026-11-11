# Speckle Community theme

Discourse theme for speckle.community that matches frontend-3 (speckle-server-internal/packages/frontend-3):
Inter, Nuxt UI tokens (neutral: zinc, primary: blue), flat dashboard chrome.

Installed on the forum as theme **#12 "Speckle"**, from this repo (`main`). Site default since 10 Nov 2026.

## Layout

| Path | What |
| --- | --- |
| `common/color_definitions.scss` | `--sp-*` tokens, light/dark via `dark-light-choose` (per colour scheme) |
| `about.json` | Speckle Light / Speckle Dark colour schemes |
| `scss/` | One `sp-`prefixed partial per surface: base, controls, header, sidebar, layout, topic-list, categories, topic, cooked, composer, overlays, user, admin, responsive |
| `javascripts/` | Header "Open Speckle" button, `speckle-full-bleed` body class |
| `settings.yml` | App button label/URL, full-bleed layout toggle |

Partials must keep the `sp-` prefix: Discourse resolves theme `@import`s against core stylesheets too, so `@import "admin"` silently pulled in core's admin CSS (~1,200 duplicate rules) instead of ours.

Two size systems: UI chrome is px at frontend-3 sizes, so it holds steady whatever the reader's text-size preference; copy is rem on Discourse's own text-size scale (Normal = 16px root), so readers can enlarge it. At Normal, copy reads ~10% larger than frontend-3 (forum feedback, Nov 2026): topic titles 16px, excerpts and descriptions 14px, post body 16px.

Light and dark are the same rules: every colour is a `--sp-*` token resolved per scheme in `color_definitions.scss`, mirroring frontend-3's light/dark values (zinc-900 page, darker sidebar, blue-400 primary with dark text in dark).
The search-banner component shows on discovery pages only.

Phones are handled responsively rather than by Discourse's mobile/desktop view, because that view comes from the user agent and iPads or "Request Desktop Website" get desktop view on a phone-sized screen. `sp-responsive.scss` keys layout on width (≤767px) and touch sizing on `pointer: coarse` (44px post controls, 16px fields so iOS doesn't zoom); at narrow widths desktop view restacks the topic list the way mobile view does.

## Update the live theme

1. Commit and push to `main`.
2. Admin → Customize → Themes → Speckle → **Check for updates** → **Update**.

Discourse checks for updates periodically but never applies them on its own, so step 2 is the deploy.
`./build.sh` still produces `.dist/speckle-theme.zip` for an emergency manual upload.

## Live configuration (10 Nov 2026)

- Default theme: **Speckle (#12)**, installed from this repo. Components: Clickable Topic, search banner, speckle-banner, speckle-stylings.
- Colour schemes from `about.json`: Speckle Light (#7) on the theme; Speckle Dark (#8) via site setting `default_dark_mode_color_scheme_id`.
- Rollback options: **Speckle (zip build, rollback) (#11)**, the pre-git copy with schemes #5/#6; or **Air (#3)**, the original theme (dark scheme was core "Dark", #2).
- Modern Category + Group Boxes is not attached (fights the card styling).

## Branding images (10 Nov 2026)

`branding/` holds the cube images now set in site settings, replacing the old mascot face:

| Setting | New | Previous (rollback) |
| --- | --- | --- |
| `logo_small` | `branding/logo_small.png` | `/uploads/default/original/2X/9/90e3846c51fda196732719e194c78ab6da41ad80.png` |
| `favicon` | `branding/favicon.png` (from frontend-3 `public/favicon.ico`) | `/uploads/default/original/2X/6/6c171f79cd9c3a081a985fbf56a151a1e83ab7cd.png` |
| `apple_touch_icon` | `branding/apple_touch_icon.png` | `/uploads/default/original/2X/6/6c171f79cd9c3a081a985fbf56a151a1e83ab7cd.png` |

The theme also keeps the full logo in the desktop header when scrolled (`home-logo-minimized` transformer), so `logo_small` mostly matters on mobile.
