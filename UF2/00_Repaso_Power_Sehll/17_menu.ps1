# Bucle principal del menú
while ($true) {
    Clear-Host
    Write-Host "==== Menú Interactiu ====" -ForegroundColor Cyan
    Write-Host "1. Mostrar ingredients de la Tortilla"
    Write-Host "2. Mostrar ingredients de la Pizza"
    Write-Host "3. Mostrar ingredients de la Paella"
    Write-Host "4. Sortir"

    $opcio = Read-Host "Escull una opció (1-4)"
    
    switch ($opcio) {
        "1" {
            Write-Host "Ingredients de la Tortilla: ous, patates, oli, sal." -ForegroundColor Green
            Write-Host "Prem qualsevol tecla per tornar al menú principal..." -ForegroundColor Cyan
            Read-Host
        }
        "2" {
            Write-Host "Ingredients de la Pizza: farina, tomàquet, formatge, oli, llevat, ingredients al gust (pernil, xampinyons, etc.)." -ForegroundColor Green
            Write-Host "Prem qualsevol tecla per tornar al menú principal..." -ForegroundColor Cyan
            Read-Host
        }
        "3" {
            Write-Host "Ingredients de la Paella: arròs, pollastre o marisc, safrà, verdures, oli, sal, brou." -ForegroundColor Green
            Write-Host "Prem qualsevol tecla per tornar al menú principal..." -ForegroundColor Cyan
            Read-Host
        }
        "4" {
            Write-Host "Sortint del menú. Fins aviat!" -ForegroundColor Green
            break
        }
        default {
            Write-Host "Opció no vàlida. Intenta-ho de nou." -ForegroundColor Yellow
            Write-Host "Prem qualsevol tecla per continuar..." -ForegroundColor Cyan
            Read-Host
        }
    }
}
