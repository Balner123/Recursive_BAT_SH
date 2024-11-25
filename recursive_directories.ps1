# Funkce pro vytvoření stromu složek
function Create-Folders {
    param (
        [int]$Depth,
        [int]$Width,
        [string]$Prefix
    )

    # Konec rekurze, pokud je hloubka <= 0
    if ($Depth -le 0) {
        return
    }

    # Smyčka pro vytváření složek
    for ($i = 1; $i -le $Width; $i++) {
        $Folder = "$Prefix\A$i"
        New-Item -ItemType Directory -Path $Folder -Force | Out-Null
        Write-Host "CREATED: $Folder"

        # Rekurzivní volání pro další vrstvu
        Create-Folders -Depth ($Depth - 1) -Width $Width -Prefix $Folder
    }
}

# Uživatelský vstup
$layers = Read-Host "Zadejte pocet vrstev"
$foldersPerLayer = Read-Host "Zadejte pocet slozek v jedné vrstve"

# Vytvoření stromu složek
Create-Folders -Depth $layers -Width $foldersPerLayer -Prefix "root"

Write-Host "Vsechny slozky byly vytvoreny."
