import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "action"];

  static values = {
    buttonText: String
  };

  copy() {
    this.actionTarget.innerText = this.buttonTextValue;
    // const audio = new Audio("sound.mp3");
    // audio.play();
    this.actionTarget.setAttribute("disabled", "");
    const data = this.inputTarget.value;
    navigator.clipboard.writeText(data);
  }
}
