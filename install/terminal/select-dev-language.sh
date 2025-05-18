# Install default programming languages
if [[ -v OMAKUB_FIRST_RUN_LANGUAGES ]]; then
  languages=$OMAKUB_FIRST_RUN_LANGUAGES
else
  AVAILABLE_LANGUAGES=("Ruby on Rails" "Node.js" "Go" "PHP" "Python" "Elixir" "Rust" "Java")
  languages=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --height 10 --header "Select programming languages")
fi

if [[ -n "$languages" ]]; then
  for language in $languages; do
    case $language in
    Ruby)
      if command -v ruby >/dev/null && gem list -i rails >/dev/null; then
        echo "✅ Ruby on Rails is already installed"
      else
        mise use --global ruby@latest
        mise x ruby -- gem install rails --no-document
      fi
      ;;
    Node.js)
      if command -v node >/dev/null; then
        echo "✅ Node.js is already installed"
      else
        mise use --global node@lts
      fi
      ;;
    Go)
      if command -v go >/dev/null; then
        echo "✅ Go is already installed"
      else
        mise use --global go@latest
      fi
      ;;
    PHP)
      if command -v php >/dev/null; then
        echo "✅ PHP is already installed"
      else
        sudo add-apt-repository -y ppa:ondrej/php
        sudo apt -y install php8.4 php8.4-{curl,apcu,intl,mbstring,opcache,pgsql,mysql,sqlite3,redis,xml,zip}
        php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
        php composer-setup.php --quiet && sudo mv composer.phar /usr/local/bin/composer
        rm composer-setup.php
      fi
      ;;
    Python)
      if command -v python3 >/dev/null; then
        echo "✅ Python is already installed"
      else
        mise use --global python@latest
      fi
      ;;
    Elixir)
      if command -v elixir >/dev/null; then
        echo "✅ Elixir is already installed"
      else
        mise use --global erlang@latest
        mise use --global elixir@latest
        mise x elixir -- mix local.hex --force
      fi
      ;;
    Rust)
      if command -v rustc >/dev/null; then
        echo "✅ Rust is already installed"
      else
        bash -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)" -- -y
      fi
      ;;
    Java)
      if command -v java >/dev/null; then
        echo "✅ Java is already installed"
      else
        mise use --global java@latest
      fi
      ;;
    esac
  done
fi