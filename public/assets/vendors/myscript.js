// const swal = $('.swalalert').data('swal');

//         if(swal){
//             Swal.fire(
//                 {
//                     position: 'center',
//                     type: 'success',
//                     title: 'Data Berhasil',
//                     showConfirmButton: true,
//                     icon :'success',
//                     text : swal,
//                     timer: 1800
//                 }
//             )
//         }
$(document).ready(function () {
  $('.DeleteJemaat').click(function (e) {
    e.prevenDefault();
    var id = $($his).val();
    Swal.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire(
          'Deleted!',
          'Your file has been deleted.',
          'success'
        )
      }
    })

  })
});