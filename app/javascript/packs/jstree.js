import '../../../node_modules/jstree/dist/themes/default/style.min.css';
import $ from 'jquery';
import 'jstree'

document.addEventListener('DOMContentLoaded', () => {
  $(document).on('turbolinks:load', function() {
    $('#jstree').jstree({
      "plugins": ["types", "wholerow"]
    });
  });
});
