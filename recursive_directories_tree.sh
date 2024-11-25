#!/bin/bash

# Funkce pro vytvoření stromu složek
create_folders() {
  local depth=$1
  local width=$2
  local prefix=$3

  if [ $depth -le 0 ]; then
    return
  fi

  for i in $(seq 1 $width); do
    local folder="${prefix}/A$i"
    mkdir -p "$folder"
    echo "Vytvořena složka: $folder"
    create_folders $((depth - 1)) $width "$folder"
  done
}

# Uživatelský vstup
read -p "Zadejte počet vrstev: " layers
read -p "Zadejte počet složek v jedné vrstvě: " folders_per_layer

# Vytvoření stromu složek
create_folders $layers $folders_per_layer "root"

echo "Všechny složky byly úspěšně vytvořeny."
