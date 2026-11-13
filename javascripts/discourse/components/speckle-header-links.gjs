import Component from "@glimmer/component";

// Text links beside the app button, matching the docs header
// (Website, Community there; Website, Documentation here).
export default class SpeckleHeaderLinks extends Component {
  get links() {
    return [
      { label: settings.website_label, url: settings.website_url },
      { label: settings.docs_label, url: settings.docs_url },
    ].filter((link) => link.label && link.url);
  }

  <template>
    <li class="speckle-header-links">
      {{#each this.links as |link|}}
        <a href={{link.url}} class="speckle-header-link">{{link.label}}</a>
      {{/each}}
    </li>
  </template>
}
