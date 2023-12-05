import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller-like"
export default class extends Controller {

  static targets = ["heart"];

  like() {
  //   if (this.isLiked()) {
  //     // Logique pour enlever le like (vider le cœur)
  //     this.heartTarget.classList.remove("filled");
  //     // Ajoutez ici la logique pour enlever le like côté serveur si nécessaire
  //   } else {
  //     // Logique pour liker (remplir le cœur)
  //     this.heartTarget.classList.add("filled");
  //     // Ajoutez ici la logique pour ajouter le like côté serveur si nécessaire
  //   }
  // }

  if (this.isLiked) {
    this.heartTarget.classList.remove("fas");
    this.heartTarget.classList.add("far");
    // Ajoutez ici la logique pour supprimer le like côté serveur si nécessaire
  } else {
    this.heartTarget.classList.remove("far");
    this.heartTarget.classList.add("fas");
    // Ajoutez ici la logique pour ajouter le like côté serveur si nécessaire
  }
  this.isLiked = !this.isLiked;
}

  // isLiked() {
  //   return this.heartTarget.classList.contains("filled");
  // }
}
