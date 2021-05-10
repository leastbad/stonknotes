import { Controller } from "stimulus"
// import { Turbo } from "@hotwired/turbo-rails"
import { turboReady } from "../utils/turbo_utils"

export default class extends Controller {
  static targets = ['cursor', 'loadMoreButton'];

  infiniteScroll() {
    let scrollTriggerPosition = document.body.clientHeight - window.innerHeight - 500;
    if(window.scrollY >= scrollTriggerPosition && turboReady()) {
      // console.log('Triggering infinite scroll event');
      // console.log('Cursor position: ' + document.querySelector('input[data-stonknotes-target="cursor"]').value);
      // console.log(`Turbo.status ${Turbo.navigator?.formSubmission?.state} / Turbo ready? ${turboReady()}`);
      this.loadMoreButtonTarget.click();

      // Disable button so form doesn't accidentally get submitted multiple times
      this.loadMoreButtonTarget.setAttribute('disabled', true);
    }
  }
}
