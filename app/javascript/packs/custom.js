document.addEventListener("turbolinks:load", () => {

  const buttonToCities = () => {
    const button = document.querySelector("#btn-to-cities")
    const allCities = document.querySelector("#card-all-cities");
    button.addEventListener('click', () =>{
      allCities.scrollIntoView({alignTo: true, behavior: "smooth"});
    })
  }

  buttonToCities();
  
});
