document.addEventListener('DOMContentLoaded', cargarDashboard);

function cargarDashboard() {
  fetch('/api/dashboard')
    .then(response => {
      if (!response.ok) throw new Error('Error al obtener datos del dashboard');
      return response.json();
    })
    .then(data => {
      // Indicadores Generales
      document.getElementById('total-productos').textContent = data.total_productos;
      document.getElementById('stock-total').textContent = data.stock_total;
      document.getElementById('precio-promedio').textContent = `$${Number(data.precio_promedio).toFixed(2)}`;
      
      document.getElementById('prod-economico').textContent = `Min: ${data.producto_mas_economico.nombre} ($${data.producto_mas_economico.precio})`;
      document.getElementById('prod-costoso').textContent = `Max: ${data.producto_mas_costoso.nombre} ($${data.producto_mas_costoso.precio})`;

      // Top 3 Económicos
      const containerEconomicos = document.getElementById('top-economicos');
      containerEconomicos.innerHTML = '';
      data.tres_mas_economicos.forEach(p => {
        containerEconomicos.innerHTML += `
          <li class="list-group-item d-flex justify-content-between align-items-center">
            ${p.nombre}
            <span class="badge bg-success rounded-pill">$${p.precio}</span>
          </li>
        `;
      });

      // Top 5 Más Vendidos
      const containerVendidos = document.getElementById('top-vendidos');
      containerVendidos.innerHTML = '';
      data.cinco_mas_vendidos.forEach(p => {
        containerVendidos.innerHTML += `
          <li class="list-group-item d-flex justify-content-between align-items-center">
            ${p.nombre}
            <span class="badge bg-primary rounded-pill">${p.unidades_vendidas || p.unidadesVendidas} vendidos</span>
          </li>
        `;
      });
    })
    .catch(error => console.error('Error:', error));
}