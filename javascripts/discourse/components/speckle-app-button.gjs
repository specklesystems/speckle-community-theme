import Component from "@glimmer/component";

// Outline/neutral UButton with the Speckle cube, linking to the web app.
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
        class="btn btn-default speckle-app-button"
        target="_blank"
        rel="noopener noreferrer"
      >
        <svg viewBox="0 0 20 20" fill="none" aria-hidden="true">
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
        <span>{{this.label}}</span>
      </a>
    </li>
  </template>
}
