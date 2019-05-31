{% macro render(post, is_index, post_extra_class) %}

  {% set headlessPost = Array.prototype.indexOf.call(['quote', 'picture'], post.type) > -1 %}

  {% set post_class = 'post post-type-' + post.type | default('normal') %}
  {% if post_extra_class > 0 %}
    {% set post_class = post_class + ' ' + post_extra_class | default('') %}
  {% endif %}
  {% if post.sticky > 0 %}
    {% set post_class = post_class + ' ' + 'post-sticky' %}
  {% endif %}

  <div class="mdl-card shopping mdl-cell mdl-cell--12-col">
    <div class="mdl-card__media mdl-color-text--grey-50">
      <h3><a href="{{ url_for(post.path) }}">{{ post.title | default(__('post.untitled'))}}</a></h3>
    </div>
    <div class="mdl-card__supporting-text mdl-color-text--grey-600">
      {{ post.content }}
    </div>
    <div class="mdl-card__supporting-text meta mdl-color-text--grey-600">
      <div class="minilogo"></div>
      <div>
        <strong>
        {% for cat in post.categories %}
          <span itemprop="about" itemscope itemtype="http://schema.org/Thing">
            <a href="{{ url_for(cat.path) }}" itemprop="url" rel="index">
              <span itemprop="name">{{ cat.name }}</span>
            </a>
          </span>

          {% set cat_length = post.categories.length %}
          {% if cat_length > 1 and loop.index !== cat_length %}
            {{ __('symbol.comma') }}
          {% endif %}
        {% endfor %}
        </strong>
        <span>{{ date(post.date, config.date_format) }}</span>
      </div>
    </div>
  </div>

{% endmacro %}
