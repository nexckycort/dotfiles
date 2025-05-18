AVAILABLE_LANGUAGES=("Ruby on Rails" "Node.js" "Go" "PHP" "Python" "Elixir" "Rust" "Java")
SELECTED_LANGUAGES=()

for lang in "${AVAILABLE_LANGUAGES[@]}"; do
  case $lang in
    "Ruby on Rails")
      command -v ruby >/dev/null && gem list -i rails >/dev/null && SELECTED_LANGUAGES+=("$lang")
      ;;
    "Node.js")
      command -v node >/dev/null && SELECTED_LANGUAGES+=("$lang")
      ;;
    "Go")
      command -v go >/dev/null && SELECTED_LANGUAGES+=("$lang")
      ;;
    "PHP")
      command -v php >/dev/null && SELECTED_LANGUAGES+=("$lang")
      ;;
    "Python")
      command -v python3 >/dev/null && SELECTED_LANGUAGES+=("$lang")
      ;;
    "Elixir")
      command -v elixir >/dev/null && SELECTED_LANGUAGES+=("$lang")
      ;;
    "Rust")
      command -v rustc >/dev/null && SELECTED_LANGUAGES+=("$lang")
      ;;
    "Java")
      command -v java >/dev/null && SELECTED_LANGUAGES+=("$lang")
      ;;
  esac
done

export OMAKUB_FIRST_RUN_LANGUAGES=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --selected "$SELECTED_LANGUAGES" --height 10 --header "Select programming languages")

AVAILABLE_DBS=("MySQL" "Redis" "PostgreSQL")
SELECTED_DBS="PostgreSQL"
export OMAKUB_FIRST_RUN_DBS=$(gum choose "${AVAILABLE_DBS[@]}" --no-limit --selected "$SELECTED_DBS" --height 5 --header "Select databases (runs in Docker)")