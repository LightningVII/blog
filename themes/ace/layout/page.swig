{% extends 'includes/layout.swig' %}

{% block body %}
  <article id="page">
    <h1>{{ page.title }}</h1>
    {% autoescape false %}{{page.content }}{% endautoescape %}
  </article>

  {% if page.prev or page.next %}
  <nav class="pagination">
    {{
      paginator({
        prev_text: '<i class="fa fa-angle-left"></i>',
        next_text: '<i class="fa fa-angle-right"></i>',
        mid_size: 1
      })
    }}
  </nav>
  {% endif %}
{% endblock %}
