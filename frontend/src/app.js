document.getElementById("loadDeals").addEventListener("click", async () => {
    const response = await fetch("http://127.0.0.1:3000/deals");
    const deals = await response.json();
    document.getElementById("deals").innerHTML = deals.map(deal => `<p>${deal}</p>`).join("");
});
