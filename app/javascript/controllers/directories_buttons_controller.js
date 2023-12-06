import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['buttonsAction'];

  connect() {
    this.element.addEventListener('mouseenter', () => this.buttonsActionTarget.classList.remove('d-none'));
    this.element.addEventListener('mouseleave', () => this.buttonsActionTarget.classList.add('d-none'));
  }
}
