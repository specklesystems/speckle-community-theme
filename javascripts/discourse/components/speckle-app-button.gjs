import Component from "@glimmer/component";

// Primary button linking to the web app, styled like the docs header's
// Sign up button. Narrow screens show the cube alone (sp-header.scss).
export default class SpeckleAppButton extends Component {
  get url() {
    return settings.app_url;
  }

  get label() {
    return settings.app_button_label;
  }

  <template>
    <li class="speckle-app-button-wrapper">
      <a
        href={{this.url}}
        class="btn btn-primary speckle-app-button"
        target="_blank"
        rel="noopener noreferrer"
      >
        <svg
          class="speckle-app-button__cube"
          viewBox="0 0 20 20"
          fill="none"
          aria-hidden="true"
        >
          <path
            d="M17.1646 0L0 0.91537V17.5418L2.83533 20L20 19.0846V2.45824L17.1646 0Z"
            fill="#136CFF"
          />
          <path
            d="M17.1647 0L0 0.91537L2.83535 3.37361L20 2.45824L17.1647 0Z"
            fill="#6FA3FF"
          />
          <path
            d="M2.83535 3.37342L0 0.915176V17.5416L2.83535 19.9998V3.37342Z"
            fill="#0357E1"
          />
        </svg>
        <span class="speckle-app-button__label">{{this.label}}</span>
        <svg
          class="speckle-app-button__chevron"
          viewBox="0 0 16 16"
          fill="none"
          aria-hidden="true"
        >
          <path
            d="M6 4l4 4-4 4"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
          />
        </svg>
      </a>
    </li>
  </template>
}
