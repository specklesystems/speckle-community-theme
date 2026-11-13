import { apiInitializer } from "discourse/lib/api";
import SpeckleAppButton from "../components/speckle-app-button";
import SpeckleHeaderLinks from "../components/speckle-header-links";

export default apiInitializer((api) => {
  if (settings.full_bleed_layout) {
    document.body.classList.add("speckle-full-bleed");
  }

  // Keep the full logo in the header when scrolled into a topic, like the
  // frontend-3 workspace switcher, instead of core swapping in logo_small.
  // On desktop the logo area is reserved at sidebar width, so the topic
  // title still fits beside it.
  api.registerValueTransformer("home-logo-minimized", ({ value }) =>
    api.container.lookup("service:site")?.desktopView ? false : value
  );

  // The docked sidebar has no toggle (desktop.scss), so a reader who
  // collapsed it before would be stuck without it. Reopen it on wide screens.
  const site = api.container.lookup("service:site");
  const application = api.container.lookup("controller:application");
  if (
    site?.desktopView &&
    !site.narrowDesktopView &&
    application?.sidebarEnabled &&
    !application.showSidebar
  ) {
    application.toggleSidebar();
  }

  // Same order as the docs header: search, text links, primary button
  if (settings.show_header_links) {
    api.headerIcons.add("speckle-links", SpeckleHeaderLinks, {
      after: "search",
      before: "user-menu",
    });
  }
  if (settings.show_app_button && settings.app_url) {
    api.headerIcons.add("speckle-app", SpeckleAppButton, {
      after: settings.show_header_links ? "speckle-links" : "search",
      before: "user-menu",
    });
  }
});
