
{% if page.posts.length > 0 %}
  
  <div id="recent-posts">
    <div class="demo-card-wide mdl-card mdl-shadow--2dp">
      <div class="mdl-card__title">
        <h2 class="mdl-card__title-text">Welcome</h2>
      </div>
      <div class="mdl-card__supporting-text">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
        Mauris sagittis pellentesque lacus eleifend lacinia...
      </div>
      <div class="mdl-card__actions mdl-card--border">
        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
          Get Started
        </a>
      </div>
      <div class="mdl-card__menu">
        <button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect">
          <i class="material-icons">share</i>
        </button>
      </div>
    </div>
    <h1>All Posts</h1>
    {% for postItem in page.posts.toArray() %}
      <div class="recent-post-item">
        <a href="{{ config.root }}{{ postItem.path }}">{{ postItem.title }}</a>
        {% if postItem.date %}
          <time datetime="{{ postItem.date.toJSON() }}">
            {{ date(postItem.date) }}
          </time>
        {% endif %}
      </div>
    {% endfor %}
  </div>
{% endif %}
