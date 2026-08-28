document.addEventListener('DOMContentLoaded', cargarDashboard);

function cargarDashboard() {
  fetch('/api/dashboard')
    .then(response => {
      if (!response.ok) throw new Error('Error al obtener datos del dashboard');
      return response.json();
    })
    .then(data => {
      // Indicadores Generales
      document.getElementById('total-productos').textContent = data.totalProductos;
      document.getElementById('stock-total').textContent = data.stockTotal;
      document.getElementById('precio-promedio').textContent = `$${Number(data.precioPromedio).toFixed(2)}`;
      
      document.getElementById('prod-economico').textContent = `Min: ${data.productoMasEconomico.nombre} ($${data.productoMasEconomico.precio})`;
      document.getElementById('prod-costoso').textContent = `Max: ${data.productoMasCostoso.nombre} ($${data.productoMasCostoso.precio})`;

      // Top 3 Económicos
      const containerEconomicos = document.getElementById('top-economicos');
      containerEconomicos.innerHTML = '';
      data.tresMasEconomicos.forEach(p => {
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
      data.cincoMasVendidos.forEach(p => {
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