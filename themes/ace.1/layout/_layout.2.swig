<!DOCTYPE html>

{% set html_class = 'theme-next ' + theme.scheme %}
{% if theme.motion.enable %}
  {% set html_class = html_class + ' use-motion' %}
{% endif %}

<html class="{{ html_class | lower }}" lang="{{ config.language }}">
<head>
  {% include '_partials/head.swig' %}
  <title>{% block title %}{% endblock %}</title>
  {% include '_third-party/analytics/index.swig' %}
</head>

<body itemscope itemtype="http://schema.org/WebPage" lang="{{ page.lang || page.language || config.language }}">

  {% set container_class = "container " %}
  <div class="demo-blog mdl-layout mdl-js-layout has-drawer is-upgraded">
    <main class="mdl-layout__content">
      <div class="demo-blog__posts mdl-grid">
        <div class="mdl-card coffee-pic mdl-cell mdl-cell--8-col">
          <div class="mdl-card__media mdl-color-text--grey-50">
            <h3><a href="entry.html">Coffee Pic</a></h3>
          </div>
          <div class="mdl-card__supporting-text meta mdl-color-text--grey-600">
            <div class="minilogo"></div>
            <div>
              <strong>The Newist</strong>
              <span>2 days ago</span>
            </div>
          </div>
        </div>
        <div class="mdl-card something-else mdl-cell mdl-cell--8-col mdl-cell--4-col-desktop">
          <button class="mdl-button mdl-js-ripple-effect mdl-js-button mdl-button--fab mdl-color--accent">
            <i class="material-icons mdl-color-text--white" role="presentation">add</i>
            <span class="visuallyhidden">add</span>
          </button>
          <div class="mdl-card__media mdl-color--white mdl-color-text--grey-600">
            <img src="https://getmdl.io/templates/blog/images/logo.png">
            +1,337
          </div>
          <div class="mdl-card__supporting-text meta meta--fill mdl-color-text--grey-600">
            <div>
              <strong>The Newist</strong>
            </div>
            <ul class="mdl-menu mdl-js-menu mdl-menu--bottom-right mdl-js-ripple-effect" for="menubtn">
              <li class="mdl-menu__item">About</li>
              <li class="mdl-menu__item">Message</li>
              <li class="mdl-menu__item">Favorite</li>
              <li class="mdl-menu__item">Search</li>
            </ul>
            <button id="menubtn" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
              <i class="material-icons" role="presentation">more_vert</i>
              <span class="visuallyhidden">show menu</span>
            </button>
          </div>
        </div>
        <div class="mdl-card shopping mdl-cell mdl-cell--12-col">
          <div class="mdl-card__media mdl-color-text--grey-50">
            <h3><a href="entry.html">Shopping</a></h3>
          </div>
          <div class="mdl-card__supporting-text mdl-color-text--grey-600">
            Enim labore aliqua consequat ut quis ad occaecat aliquip incididunt. Sunt nulla eu enim irure enim nostrud aliqua consectetur ad consectetur sunt ullamco officia. Ex officia laborum et consequat duis.
          </div>
          <div class="mdl-card__supporting-text meta mdl-color-text--grey-600">
            <div class="minilogo"></div>
            <div>
              <strong>The Newist</strong>
              <span>2 days ago</span>
            </div>
          </div>
        </div>
        <nav class="demo-nav mdl-cell mdl-cell--12-col">
          <div class="section-spacer"></div>
          <a href="entry.html" class="demo-nav__button" title="show more">
            More
            <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
              <i class="material-icons" role="presentation">arrow_forward</i>
            </button>
          </a>
        </nav>
      </div>
      <footer class="mdl-mini-footer">
        <div class="mdl-mini-footer--left-section">
          <button class="mdl-mini-footer--social-btn social-btn social-btn__twitter">
            <span class="visuallyhidden">Twitter</span>
          </button>
          <button class="mdl-mini-footer--social-btn social-btn social-btn__blogger">
            <span class="visuallyhidden">Facebook</span>
          </button>
          <button class="mdl-mini-footer--social-btn social-btn social-btn__gplus">
            <span class="visuallyhidden">Google Plus</span>
          </button>
        </div>
        <div class="mdl-mini-footer--right-section">
          <button class="mdl-mini-footer--social-btn social-btn__share">
            <i class="material-icons" role="presentation">share</i>
            <span class="visuallyhidden">share</span>
          </button>
        </div>
      </footer>
    </main>
    <div class="mdl-layout__obfuscator"></div>
  </div>

{% if theme.sidebar.display !== 'remove' %}
  {% block sidebar %}{% endblock %}
{% endif %}
{% if not theme.sidebar.b2t %}
  <div class="back-to-top">
    <i class="fa fa-arrow-up"></i>
    {% if theme.sidebar.scrollpercent %}
      <span id="scrollpercent"><span>0</span>%</span>
    {% endif %}
  </div>
{% endif %}


  {% include '_scripts/vendors.swig' %}
  {% include '_scripts/commons.swig' %}

  {% set scheme_script = '_scripts/schemes/' + theme.scheme | lower + '.swig' %}
  {% include scheme_script %}

  {% block script_extra %}{% endblock %}

  {% include '_scripts/boostrap.swig' %}

  {% include '_third-party/comments/index.swig' %}
  {% include '_third-party/search/index.swig' %}
  {% include '_third-party/analytics/lean-analytics.swig' %}
  {% include '_third-party/seo/baidu-push.swig' %}
  {% include '_third-party/rating.swig' %}
  {% include '_third-party/mathjax.swig' %}
  {% include '_third-party/scroll-cookie.swig' %}
  {% include '_third-party/exturl.swig' %}
</body>
</html>
