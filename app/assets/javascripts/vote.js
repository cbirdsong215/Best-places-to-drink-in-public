$(document).ready(function() {
  $(".thumbup").on("click",(function(event) {
    vote(true);
  }))
  $(".thumbdown").on("click",(function(event) {
    vote(false);
  }))
});

function vote(vote) {

  event.preventDefault();
  reviewId = this.document.activeElement.id

  var request = $.ajax({
    method: "POST",
    url: '../api/v1/reviews/' + reviewId + '/votes',
    data: { vote: vote }
  });

  request.done(function(data) {
    document.getElementById("total_" + reviewId).innerHTML = "Total: " + data.total
  });
}
