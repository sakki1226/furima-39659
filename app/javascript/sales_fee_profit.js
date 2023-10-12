window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const fee = Math.floor(inputValue * 0.10); 
    addTaxDom.innerHTML = fee; 

    const saleProfit = document.getElementById("profit");
    const profit = Math.floor(inputValue - fee); 
    saleProfit.innerHTML = profit;
  });
});
