document.addEventListener("DOMContentLoaded", () => {
    fetchDeals();
});

async function fetchDeals() {
    try {
        const response = await fetch("http://api.fastbuy.local/deals"); // Update the API URL if needed  gateway.fastbuy.local
        const deals = await response.json(); // Expecting an array of deals

        const dealsContainer = document.getElementById("deals");
        dealsContainer.innerHTML = ""; // Clear previous content

        // Check if the deals are returned properly
        if (Array.isArray(deals)) {
            deals.forEach(deal => {
                const dealCard = document.createElement("div");
                dealCard.classList.add("deal-card");

                // Add the HTML structure for each deal item
                dealCard.innerHTML = `
                    <img src="${deal.image_url}" alt="${deal.product_name}">
                    <div class="deal-info">
                        <h3>${deal.product_name}</h3>
                        <p>${deal.deal_description}</p>
                        <p><strong>Price:</strong> $${deal.price.toFixed(2)}</p>
                        <p><strong>Discount:</strong> ${deal.discount_percentage}% off</p>
                        <p><strong>Stock:</strong> ${deal.stock} left</p>
                        <p><strong>Rating:</strong> ⭐${deal.total_rating}</p>
                    </div>
                `;

                dealsContainer.appendChild(dealCard);
            });
        } else {
            console.error("The data returned is not an array:", deals);
        }
    } catch (error) {
        console.error("Error fetching deals:", error);
    }
}
