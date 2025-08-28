(function(){
  let token = localStorage.getItem('token') || '';

  function setAuthHeader(xhr){ if(token) xhr.setRequestHeader('Authorization','Bearer '+token); }
  function toast(msg, type='info'){
    const d=$('<div class="alert alert-'+type+' position-fixed top-0 end-0 m-3">'+msg+'</div>');
    $('body').append(d); setTimeout(()=>d.fadeOut(300,()=>d.remove()),2500);
  }
  function authGet(url){ return $.ajax({url, method:'GET', beforeSend:setAuthHeader}); }
  function authPost(url,data){ return $.ajax({url,method:'POST',data:JSON.stringify(data),contentType:'application/json',beforeSend:setAuthHeader}); }
  function authPut(url,data){ return $.ajax({url,method:'PUT',data:JSON.stringify(data),contentType:'application/json',beforeSend:setAuthHeader}); }
  function authDelete(url){ return $.ajax({url,method:'DELETE',beforeSend:setAuthHeader}); }

  // Listeleme
  function loadUsers(){
    authGet('/api/users').done(data=>{
      const tb=$('#tblUsers tbody').empty();
      data.forEach(u=>{
        tb.append('<tr><td>'+u.id+'</td><td>'+u.username+'</td><td>'+u.roles+'</td><td>'+ (u.createdAt||'') +'</td>' +
          '<td class="text-end"><button class="btn btn-sm btn-outline-primary me-1 edit" data-id="'+u.id+'">Düzenle</button>'+
          '<button class="btn btn-sm btn-outline-danger del" data-id="'+u.id+'">Sil</button></td></tr>');
      });
    }).fail(()=> $('#tblUsers tbody').html('<tr><td colspan="5">Erişim yok</td></tr>'));
  }

  // Silme & düzenleme
  $('#tblUsers').on('click','.del',function(){
    const id=$(this).data('id');
    if(!confirm('Silmek istediğinize emin misiniz?')) return;
    authDelete('/api/users/'+id).done(()=>{loadUsers();toast('Silindi','success');});
  }).on('click','.edit',function(){
    const id=$(this).data('id');
    authGet('/api/users').done(list=>{
      const u=list.find(x=>x.id==id);
      if(!u) return;
      $('#userId').val(u.id);
      $('#userName').val(u.username);
      $('#userRoles').val(u.roles||'');
      $('#userIsAdmin').prop('checked',(u.roles||'').includes('ROLE_ADMIN'));
      $('#userPass').val('');
    });
  });

  // Form submit
  $('#userForm').on('submit',function(e){
    e.preventDefault();
    const id=$('#userId').val();
    const isAdmin=$('#userIsAdmin').is(':checked');
    if(!id){
      const payload={username:$('#userName').val(),password:$('#userPass').val(),admin:isAdmin};
      authPost('/api/users',payload).done(()=>{this.reset();$('#userId').val('');loadUsers();toast('Oluşturuldu','success');});
    } else {
      let roles=$('#userRoles').val().trim() || (isAdmin? 'ROLE_ADMIN,ROLE_USER':'ROLE_USER');
      const payload={roles:roles,password:$('#userPass').val()||null};
      authPut('/api/users/'+id,payload).done(()=>{this.reset();$('#userId').val('');loadUsers();toast('Güncellendi','success');});
    }
  });

  // İlk yükleme
  if(token) loadUsers();
})();
