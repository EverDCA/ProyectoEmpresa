document.addEventListener("DOMContentLoaded", function () {
    const planSelect = document.getElementById("plan_id");
    const totalInput = document.getElementById("total");
    planSelect.addEventListener("change", function () {
        const selectedOption = planSelect.options[planSelect.selectedIndex];
        const precio = selectedOption.getAttribute("data-precio");
        
        if (precio) {
            totalInput.value = precio;
        } else {
            totalInput.value = ""; // Si no hay plan seleccionado, limpiar el total
        }
    });
});
