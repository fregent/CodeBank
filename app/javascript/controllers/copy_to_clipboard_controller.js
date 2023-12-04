// Stimulus controller (copy_to_clipboard_controller.js)
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "action", "checked"];

  static values = {
    buttonText: String
  };

  copy() {

    console.log(this.inputTarget)
    this.actionTarget.classList.add("d-none");
    this.checkedTarget.classList.remove("d-none");
    // const audio = new Audio("/sound.mp3");
    // audio.play();
    const data = this.inputTarget.value;
    navigator.clipboard.writeText(data);

    // Changer l'icône pendant 2 secondes

    setTimeout(() => {
      this.checkedTarget.classList.add("d-none");
      this.actionTarget.classList.remove("d-none");
      // Rétablir l'icône d'origine après 2 secondes
      // this.actionTarget.classList.remove("fa-solid", "fa-clipboard-check");
      // this.actionTarget.classList.add("fa-regular", "fa-clipboard", "fa-fade");
    }, 3000);
  }
}
