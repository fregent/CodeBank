import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.element.addEventListener("mouseenter", () => {
      this.element.classList.add("fa-bounce");
    });
    this.element.addEventListener("mouseleave", () => {
      this.element.classList.remove("fa-bounce");
    });
  }
}
