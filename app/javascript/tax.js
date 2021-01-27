window.addEventListener('load', () => {
  const itemPrice = document.getElementById("item-price")
itemPrice.addEventListener('input', () => {
  const itemValue = itemPrice.value
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  addTaxPrice.innerHTML = itemValue * 0.1
  profit.innerHTML = itemValue * 0.9
})
})