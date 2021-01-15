
const pay = () => {
  Payjp.setPublicKey("pk_test_41ff0408630995e917fd09ce");
  const form = document.getElementById("charge-form");
  
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order[card_number]"),
      cvc: formData.get("card_order[card_cvc]"),
      exp_month: formData.get("order[card_exp_month]"),
      exp_year: `20${formData.get("order[card_exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200){
        const token = response.id;
        console.log(token);
      }
    });
  });
};

window.addEventListener("load", pay);