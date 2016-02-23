$(function() {
  $(document).on('click', '.feature-table .checkbox', function(e) {
    var $el = $(e.target);

    $.ajax({
      type: "POST",
      url: window.toggleFeaturePath,
      data: {
        "feature": $el.data('feature-name'),
        "state": $el.data('state-name'),
        "enable": $el.is(':checked')
      }
    });
  });
});
