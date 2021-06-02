function price (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const priceCharge = (itemPrice.value) * 0.1;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = priceCharge;
    const profit = document.getElementById("profit");
    profit.innerHTML = itemPrice.value - priceCharge
  });
};

window.addEventListener('load',price);