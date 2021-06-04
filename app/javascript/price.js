function price (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const priceCharge = Math.floor(itemPrice.value * 0.1);
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = priceCharge;
    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(itemPrice.value - priceCharge);
  });
};

window.addEventListener('load',price);