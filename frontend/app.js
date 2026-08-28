document.addEventListener('DOMContentLoaded', cargarProductos);

function cargarProductos() {
  // Petición al Proxy Reverso
  fetch('/api/productos')
    .then(response => {
      if (!response.ok) throw new Error('Error al obtener productos');
      return response.json();
    })
    .then(data => {
      renderTabla(data);
      renderCards(data.slice(0, 4)); // Muestra las primeras 4 cards como destacados
    })
    .catch(error => console.error('Error:', error));
}

function renderTabla(productos) {
  const tbody = document.getElementById('tabla-productos');
  tbody.innerHTML = '';
  productos.forEach(p => {
    tbody.innerHTML += `
      <tr>
        <td>${p.id}</td>
        <td class="fw-bold">${p.nombre}</td>
        <td><span class="badge bg-secondary">${p.categoria}</span></td>
        <td>$${Number(p.precio).toFixed(2)}</td>
        <td>${p.stock}</td>
        <td>${p.unidades_vendidas || p.unidadesVendidas}</td>
      </tr>
    `;
  });
}

function renderCards(productos) {
  const container = document.getElementById('cards-container');
  container.innerHTML = '';
  productos.forEach(p => {
    container.innerHTML += `
      <div class="col-md-3 mb-3">
        <div class="card h-100 shadow-sm">
          <div class="card-body">
            <span class="badge bg-info mb-2">${p.categoria}</span>
            <h5 class="card-title">${p.nombre}</h5>
            <p class="card-text text-muted">Stock: ${p.stock} unidades</p>
            <h6 class="text-primary fw-bold">$${Number(p.precio).toFixed(2)}</h6>
          </div>
        </div>
      </div>
    `;
  });
}