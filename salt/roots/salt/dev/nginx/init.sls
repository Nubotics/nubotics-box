nginx_ppa:
  pkgrepo.managed:
    - ppa: nginx/stable

nginx:
  pkg.latest:
    - refresh: True
    - require:
      - pkgrepo: nginx_ppa
  service.running:
    - enable: True
    - restart: True
    - watch:
      - file: /etc/nginx/nginx.conf
      # - file: /etc/nginx/sites-enabled/tools
      - file: /etc/nginx/sites-enabled/application
      - pkg: nginx

/var/www/application/:
  file:
    - directory
    - user: vagrant
    - group: vagrant
    - mode: 775
    - makedirs: True

# /var/www/tools:
#   file:
#     - directory
#     - user: vagrant
#     - group: vagrant
#     - mode: 775
#     - makedirs: True

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://_files/nginx/conf/nginx.conf
    - template: jinja
    - group: root
    - user: root
    - mode: 644

# /etc/nginx/sites-enabled/:
#   cmd.run:
#     - name: sudo rm default

/etc/nginx/sites-available/application:
  file.managed:
    - source: salt://_files/nginx/vhosts/application
    - template: jinja
    - clean_file: true
    - group: root
    - user: root
    - mode: 644

/etc/nginx/sites-enabled/application:
  file.symlink:
    - target: /etc/nginx/sites-available/application

# /etc/nginx/sites-available/tools:
#   file.managed:
#     - source: salt://_files/nginx/vhosts/tools
#     - template: jinja
#     - clean_file: true
#     - group: root
#     - user: root
#     - mode: 644

# /etc/nginx/sites-enabled/tools:
#   file.symlink:
#     - target: /etc/nginx/sites-available/tools

nginx-remove-senabled-default:
  cmd.run:
    - name: sudo rm /etc/nginx/sites-enabled/default
    - cwd: /root/
    - require:
      - pkg: nginx