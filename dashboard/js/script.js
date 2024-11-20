const ctx = document.getElementById('chartIngresos');

  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio','Julio', 'Agosto','Septiembre', 'Octubre','Noviembre', 'Diciembre'],
      datasets: [{
        label: 'Ganancias por mes',
        data: [12000, 19000, 30000, 50000, 20000, 30000, 12000, 20000, 15000, 100000, 12000, 10000],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
  const ctx2 = document.getElementById('chartCategorias');

  new Chart(ctx2, {
    type: 'pie',
    data: {
      labels: ['Comercial', 'Recreativo', 'Cultural', 'Educativo'],
      datasets: [{
        label: 'Proyectos por Categorias',
        data: [1000, 1000, 250, 250],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });