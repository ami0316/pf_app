function jpostal() {
  $('#zipcode').jpostal({
    postcode : ['#zipcode'],
    address : {
      '#hotel_address': '%3%4%5'
    }
  });
}
$(document).ready(jpostal);