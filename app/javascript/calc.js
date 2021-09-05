window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price");
    priceInput.addEventListener('input', function(){
    console.log("Input action")
    console.log(this.value)
      const priceInputValue =  this.value
      const commission = document.getElementById("add-tax-price");
      commission.innerHTML = Math.round(priceInputValue * 0.1);
      const getProfit = document.getElementById("profit");
      getProfit.innerHTML = Math.round(priceInputValue - Math.round(priceInputValue * 0.1 ))
  })
});