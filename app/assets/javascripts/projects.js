
$(document).ready(function() {
  $('#search').typeahead( {
    source: function(query, process) {
      $.getJSON('projects/search', {query: query}, function(data) {
          return process(data);
      });
    }
  });
});