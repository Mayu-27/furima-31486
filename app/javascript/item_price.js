
window.addEventListener("load", () => {
const priceInput = document.getElementById("item-price");
   priceInput.addEventListener("input", () => {
      const inputValue = Math.floor(priceInput.value);
      const inputCommission = Math.floor(inputValue * 0.1)
      const inputProfit = Math.floor(inputValue - inputCommission)
      add_tax_price.innerHTML = inputCommission
      profit.innerHTML = inputProfit
   });
});


