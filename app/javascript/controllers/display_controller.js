// display_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "showing"]

  connect() {
    console.log("bitch better have my money")
  }

  showing() {
    const selectedSnippetTitle = this.inputTarget.options[this.inputTarget.selectedIndex]?.text;
    if (selectedSnippetTitle) {
      this.showingTarget.innerHTML = `<p>Selected snippet: ${Snippet.find_by(titleselectedSnippetTitle)}</p>`;
    } else {
      this.showingTarget.innerHTML = `<p>No snippet selected</p>`;
    }
  }
}
