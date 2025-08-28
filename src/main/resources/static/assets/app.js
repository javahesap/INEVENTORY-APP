(function(){
  const API = '';
  let token = localStorage.getItem('token') || '';

  function setAuthHeader(xhr) {
    if (token) xhr.setRequestHeader('Authorization', 'Bearer ' + token);
  }

  function toast(msg, type='info') {
    const d = $('<div class="alert alert-'+type+' position-fixed top-0 end-0 m-3" role="alert">'+msg+'</div>');
    $('body').append(d);
    setTimeout(()=> d.fadeOut(300, ()=> d.remove()), 2500);
  }

  // Login
  $('#loginForm').on('submit', function(e){
    e.preventDefault();
    $.ajax({
      url: API + '/auth/login', method: 'POST', contentType: 'application/json',
      data: JSON.stringify({username: $('#loginUser').val(), password: $('#loginPass').val()})
    }).done(res => {
      token = res.token; localStorage.setItem('token', token);
      toast('Giriş başarılı', 'success');
      const modal = bootstrap.Modal.getInstance(document.getElementById('loginModal'));
      modal.hide();
      loadAll();
    }).fail(xhr => toast('Giriş başarısız', 'danger'));
  });

  // Helpers
  function authGet(url){ return $.ajax({url, method:'GET', beforeSend:setAuthHeader}); }
  function authPost(url, data){ return $.ajax({url, method:'POST', data: JSON.stringify(data), contentType:'application/json', beforeSend:setAuthHeader}); }
  function authPut(url, data){ return $.ajax({url, method:'PUT', data: JSON.stringify(data), contentType:'application/json', beforeSend:setAuthHeader}); }
  function authDelete(url){ return $.ajax({url, method:'DELETE', beforeSend:setAuthHeader}); }

  // Categories UI
  function refreshCategoriesSelect(){
    authGet('/api/categories').done(list => {
      const sel = $('#productCategory').empty();
      const sel2 = $('#movementProduct').empty();
      list.forEach(c => sel.append('<option value="'+c.id+'">'+c.name+'</option>'));
      // products for movement loaded separately
    });
  }
  function loadCategories(){
    authGet('/api/categories').done(data => {
      const tb = $('#tblCategories tbody').empty();
      data.forEach(c => {
        tb.append('<tr><td>'+c.id+'</td><td>'+c.name+'</td><td>'+ (c.description||'') +'</td>' +
          '<td class="text-end"><button class="btn btn-sm btn-outline-primary me-1 edit" data-id="'+c.id+'">Düzenle</button>' +
          '<button class="btn btn-sm btn-outline-danger del" data-id="'+c.id+'">Sil</button></td></tr>');
      });
    });
  }
  $('#categoryForm').on('submit', function(e){
    e.preventDefault();
    const id = $('#categoryId').val();
    const payload = {name: $('#categoryName').val(), description: $('#categoryDesc').val()};
    (id ? authPut('/api/categories/'+id, payload) : authPost('/api/categories', payload))
      .done(()=>{ loadCategories(); refreshCategoriesSelect(); this.reset(); $('#categoryId').val(''); toast('Kaydedildi','success'); })
      .fail(x=> toast(x.responseJSON?.error || 'Hata','danger'));
  });
  $('#tblCategories').on('click', '.del', function(){
    const id=$(this).data('id'); authDelete('/api/categories/'+id).done(()=>{loadCategories(); refreshCategoriesSelect(); toast('Silindi','success')});
  }).on('click','.edit', function(){
    const tr=$(this).closest('tr'); $('#categoryId').val($(this).data('id'));
    $('#categoryName').val(tr.children().eq(1).text()); $('#categoryDesc').val(tr.children().eq(2).text());
  });

  // Products UI
  function loadProducts(){
    authGet('/api/products').done(data => {
      const tb = $('#tblProducts tbody').empty();
      const selMove = $('#movementProduct').empty();
      data.forEach(p => {
        tb.append('<tr><td>'+p.id+'</td><td>'+p.productCode+'</td><td>'+p.name+'</td><td>'+(p.category? p.category.name:'')+'</td><td>'+(p.unit||'')+'</td>' +
          '<td class="text-end"><button class="btn btn-sm btn-outline-primary me-1 edit" data-id="'+p.id+'">Düzenle</button>' +
          '<button class="btn btn-sm btn-outline-danger del" data-id="'+p.id+'">Sil</button></td></tr>');
        selMove.append('<option value="'+p.id+'">'+p.name+'</option>');
      });
    });
  }
  $('#productForm').on('submit', function(e){
    e.preventDefault();
    const id = $('#productId').val();
    const payload = {
      productCode: $('#productCode').val(),
      name: $('#productName').val(),
      description: $('#productDesc').val(),
      category: { id: parseInt($('#productCategory').val() || '0') },
      unit: $('#productUnit').val()
    };
    (id ? authPut('/api/products/'+id, payload) : authPost('/api/products', payload))
      .done(()=>{ loadProducts(); this.reset(); $('#productId').val(''); toast('Kaydedildi','success'); })
      .fail(x=> toast(x.responseJSON?.error || 'Hata','danger'));
  });
  $('#tblProducts').on('click', '.del', function(){
    const id=$(this).data('id'); authDelete('/api/products/'+id).done(()=>{loadProducts(); toast('Silindi','success')});
  }).on('click','.edit', function(){
    const id=$(this).data('id');
    // For simplicity, fetch all then find:
    authGet('/api/products').done(list => {
      const p=list.find(x=>x.id==id);
      $('#productId').val(p.id); $('#productCode').val(p.productCode); $('#productName').val(p.name);
      $('#productDesc').val(p.description||''); $('#productCategory').val(p.category? p.category.id:'');
      $('#productUnit').val(p.unit||'');
    });
  });
  $('#btnAddProduct').on('click', ()=> { $('#productForm')[0].reset(); $('#productId').val(''); });

  // Warehouses UI
  function loadWarehouses(){
    authGet('/api/warehouses').done(data => {
      const tb = $('#tblWarehouses tbody').empty();
      const sel = $('#movementWarehouse').empty();
      data.forEach(w => {
        tb.append('<tr><td>'+w.id+'</td><td>'+w.name+'</td><td>'+(w.location||'')+'</td>' +
          '<td class="text-end"><button class="btn btn-sm btn-outline-primary me-1 edit" data-id="'+w.id+'">Düzenle</button>' +
          '<button class="btn btn-sm btn-outline-danger del" data-id="'+w.id+'">Sil</button></td></tr>');
        sel.append('<option value="'+w.id+'">'+w.name+'</option>');
      });
    });
  }
  $('#warehouseForm').on('submit', function(e){
    e.preventDefault();
    const id=$('#warehouseId').val();
    const payload={name: $('#warehouseName').val(), location: $('#warehouseLoc').val()};
    (id? authPut('/api/warehouses/'+id,payload): authPost('/api/warehouses',payload))
      .done(()=>{ loadWarehouses(); this.reset(); $('#warehouseId').val(''); toast('Kaydedildi','success'); });
  });
  $('#tblWarehouses').on('click','.del', function(){
    const id=$(this).data('id'); authDelete('/api/warehouses/'+id).done(()=>{loadWarehouses(); toast('Silindi','success')});
  }).on('click','.edit', function(){
    const tr=$(this).closest('tr'); $('#warehouseId').val($(this).data('id'));
    $('#warehouseName').val(tr.children().eq(1).text()); $('#warehouseLoc').val(tr.children().eq(2).text());
  });

  // Stocks UI
  function loadStocks(){
    authGet('/api/stocks').done(data => {
      const tb = $('#tblStocks tbody').empty();
      data.forEach(s => tb.append('<tr><td>'+s.id+'</td><td>'+ (s.product? s.product.name:'') +'</td><td>'+ (s.warehouse? s.warehouse.name:'') +'</td><td>'+s.quantity+'</td></tr>'));
    });
  }

  // Movements UI
  $('#movementForm').on('submit', function(e){
    e.preventDefault();
    const payload={
      movementType: $('#movementType').val(),
      product: { id: parseInt($('#movementProduct').val()) },
      warehouse: { id: parseInt($('#movementWarehouse').val()) },
      quantity: parseFloat($('#movementQty').val() || '0'),
      unitPrice: parseFloat($('#movementPrice').val() || '0'),
      note: $('#movementNote').val() || ''
    };
    authPost('/api/movements', payload).done(()=>{
      loadMovements(); loadStocks(); this.reset(); toast('Hareket kaydedildi','success');
    }).fail(xhr => toast(xhr.responseJSON?.error || 'Hata','danger'));
  });
  function loadMovements(){
    authGet('/api/movements').done(list => {
      const tb = $('#tblMovements tbody').empty();
      list.forEach(m => {
        const date = (m.movementDate || '').toString().replace('T',' ');
        tb.append('<tr><td>'+m.id+'</td><td>'+date+'</td><td>'+m.movementType+'</td><td>'+(m.product?m.product.name:'')+'</td><td>'+(m.warehouse?m.warehouse.name:'')+'</td><td>'+m.quantity+'</td><td>'+m.unitPrice+'</td><td>'+(m.user?m.user.username:'')+'</td><td>'+(m.note||'')+'</td></tr>');
      });
    });
  }

  function loadAll(){
    refreshCategoriesSelect();
    loadCategories();
    loadProducts();
    loadWarehouses();
    loadStocks();
    loadMovements();
    // Suppliers & Customers
    loadSuppliers();
    loadCustomers();
  }

  // Suppliers UI
  function loadSuppliers(){
    authGet('/api/suppliers').done(data => {
      const tb=$('#tblSuppliers tbody').empty();
      data.forEach(s => tb.append('<tr><td>'+s.id+'</td><td>'+s.name+'</td><td>'+(s.phone||'')+'</td><td>'+(s.email||'')+'</td><td>'+(s.address||'')+'</td>' +
        '<td class="text-end"><button class="btn btn-sm btn-outline-primary me-1 edit" data-id="'+s.id+'">Düzenle</button>' +
        '<button class="btn btn-sm btn-outline-danger del" data-id="'+s.id+'">Sil</button></td></tr>'));
    });
  }
  $('#supplierForm').on('submit', function(e){
    e.preventDefault();
    const id=$('#supplierId').val();
    const payload={name:$('#supplierName').val(),phone:$('#supplierPhone').val(),email:$('#supplierEmail').val(),address:$('#supplierAddress').val()};
    (id? authPut('/api/suppliers/'+id,payload): authPost('/api/suppliers',payload))
      .done(()=>{ loadSuppliers(); this.reset(); $('#supplierId').val(''); toast('Kaydedildi','success'); });
  });
  $('#tblSuppliers').on('click','.del', function(){
    const id=$(this).data('id'); authDelete('/api/suppliers/'+id).done(()=>{loadSuppliers(); toast('Silindi','success')});
  }).on('click','.edit', function(){
    const tr=$(this).closest('tr'); $('#supplierId').val($(this).data('id'));
    $('#supplierName').val(tr.children().eq(1).text()); $('#supplierPhone').val(tr.children().eq(2).text());
    $('#supplierEmail').val(tr.children().eq(3).text()); $('#supplierAddress').val(tr.children().eq(4).text());
  });

  // Customers UI
  function loadCustomers(){
    authGet('/api/customers').done(data => {
      const tb=$('#tblCustomers tbody').empty();
      data.forEach(c => tb.append('<tr><td>'+c.id+'</td><td>'+c.name+'</td><td>'+(c.phone||'')+'</td><td>'+(c.email||'')+'</td><td>'+(c.address||'')+'</td>' +
        '<td class="text-end"><button class="btn btn-sm btn-outline-primary me-1 edit" data-id="'+c.id+'">Düzenle</button>' +
        '<button class="btn btn-sm btn-outline-danger del" data-id="'+c.id+'">Sil</button></td></tr>'));
    });
  }
  $('#customerForm').on('submit', function(e){
    e.preventDefault();
    const id=$('#customerId').val();
    const payload={name:$('#customerName').val(),phone:$('#customerPhone').val(),email:$('#customerEmail').val(),address:$('#customerAddress').val()};
    (id? authPut('/api/customers/'+id,payload): authPost('/api/customers',payload))
      .done(()=>{ loadCustomers(); this.reset(); $('#customerId').val(''); toast('Kaydedildi','success'); });
  });
  $('#tblCustomers').on('click','.del', function(){
    const id=$(this).data('id'); authDelete('/api/customers/'+id).done(()=>{loadCustomers(); toast('Silindi','success')});
  }).on('click','.edit', function(){
    const tr=$(this).closest('tr'); $('#customerId').val($(this).data('id'));
    $('#customerName').val(tr.children().eq(1).text()); $('#customerPhone').val(tr.children().eq(2).text());
    $('#customerEmail').val(tr.children().eq(3).text()); $('#customerAddress').val(tr.children().eq(4).text());
  });

  // Auto-load after token present
  if (token) loadAll();
})();
