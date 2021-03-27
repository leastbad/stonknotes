import { Controller } from "stimulus"
// import { Turbo } from "@hotwired/turbo-rails"
import { turboReady } from "../utils/turbo_utils"

export default class extends Controller {
  static targets = ['cursor', 'loadMoreButton'];

  infiniteScroll() {
    let scrollTriggerPosition = document.body.clientHeight - window.innerHeight - 500;
    if(window.scrollY >= scrollTriggerPosition && turboReady()) {
      // console.log('Triggering infinite scroll event');
      // console.log(`Turbo.status ${Turbo.navigator?.formSubmission?.state}`);
      // console.log(`Turbo ready? ${turboReady()}`);
      this.loadMoreButtonTarget.click();
    }
  }

  updateCursor() {
    let stonknoteElements = document.querySelectorAll('.stonknote-show');
    let lastId = stonknoteElements[stonknoteElements.length - 1].dataset.stonknoteId;
    this.cursorTarget.value = lastId;
  }
}
