# Speckle Community theme

Discourse theme for speckle.community that matches frontend-3 (speckle-server-internal/packages/frontend-3):
Inter, Nuxt UI tokens (neutral: zinc, primary: blue), flat dashboard chrome.

Installed on the forum as theme **#11 "Speckle"** — site default since 10 Nov 2026 (previously Air, #3).

## Layout

| Path | What |
| --- | --- |
| `common/color_definitions.scss` | `--sp-*` tokens, light/dark via `dark-light-choose` (per colour scheme) |
| `about.json` | Speckle Light / Speckle Dark colour schemes |
| `scss/` | One `sp-`prefixed partial per surface: base, controls, header, sidebar, layout, topic-list, categories, topic, cooked, composer, overlays, user, admin |
| `javascripts/` | Header "Open Speckle" button, `speckle-full-bleed` body class |
| `settings.yml` | App button label/URL, full-bleed layout toggle |

Partials must keep the `sp-` prefix: Discourse resolves theme `@import`s against core stylesheets too, so `@import "admin"` silently pulled in core's admin CSS (~1,200 duplicate rules) instead of ours.

Sizes are px, not rem: frontend-3 is rem at a 16px root, Discourse's root follows the reader's text-size preference.
Chrome is 13–14px like frontend-3; post bodies and the composer textarea are 16px for long-form reading.

Light and dark are the same rules: every colour is a `--sp-*` token resolved per scheme in `color_definitions.scss`, mirroring frontend-3's light/dark values (zinc-900 page, darker sidebar, blue-400 primary with dark text in dark).
The search-banner component shows on discovery pages only.

## Update the live theme

1. `./build.sh` → `.dist/speckle-theme.zip`
2. Admin → Customize → Themes → Speckle → … → update from the zip, or POST it to `/admin/themes/import.json` with `bundle` + `theme_id=11`.

## Live configuration (10 Nov 2026)

- Default theme: Speckle (#11). Air (#3) is still installed; rollback = Admin → Themes → Air → set as default.
- Site setting `default_dark_mode_color_scheme_id` = Speckle Dark (#6), previously core "Dark" (#2).
- Light scheme: Speckle Light (#5), set on the theme.
- Components on the theme: Clickable Topic, search banner, speckle-banner, speckle-stylings. Modern Category + Group Boxes is not attached (fights the card styling).

## Branding images (10 Nov 2026)

`branding/` holds the cube images now set in site settings, replacing the old mascot face:

| Setting | New | Previous (rollback) |
| --- | --- | --- |
| `logo_small` | `branding/logo_small.png` | `/uploads/default/original/2X/9/90e3846c51fda196732719e194c78ab6da41ad80.png` |
| `favicon` | `branding/favicon.png` (from frontend-3 `public/favicon.ico`) | `/uploads/default/original/2X/6/6c171f79cd9c3a081a985fbf56a151a1e83ab7cd.png` |
| `apple_touch_icon` | `branding/apple_touch_icon.png` | `/uploads/default/original/2X/6/6c171f79cd9c3a081a985fbf56a151a1e83ab7cd.png` |

The theme also keeps the full logo in the desktop header when scrolled (`home-logo-minimized` transformer), so `logo_small` mostly matters on mobile.
