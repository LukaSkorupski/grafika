$SDL_url = "https://www.libsdl.org/release/SDL2-devel-2.0.22-mingw.zip"
$SDL_folder = "SDL2-2.0.22"
$SDLbgi_url = "https://downloads.sourceforge.net/project/libxbgi/SDL_bgi-2.5.1-win.zip"
$SDLbgi_folder = "SDL_bgi-2.5.1"

#Check if SDL_folder exists
if (Test-Path $SDL_folder) {
    Write-Warning "SDL folder already exists"
    $user_option = Read-Host "Do you want to delete the folder and continue? (y/n)"
    if ($user_option -eq "y") {
        Remove-Item $SDL_folder -Recurse -Force
    }
    else {
        Write-Error "Exiting"
        exit 1
    }
}
if (Test-Path $SDLbgi_folder) {
    Write-Warning "SDL_bgi folder already exists"
    $user_option = Read-Host "Do you want to delete the folder and continue? (y/n)"
    if ($user_option -eq "y") {
        Remove-Item $SDLbgi_folder -Recurse -Force
    }
    else {
        Write-Error "Exiting"
        exit 1
    }
}

Write-Host "Downloading SDL2"
Invoke-WebRequest -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36" -Uri $SDL_url -OutFile SDL.zip
Write-Host "Unziping SDL2.zip"
Expand-Archive -Path SDL.zip -Destination .

Write-Host "Downloading SDL_bgi"
Invoke-WebRequest -UserAgent "Wget" -Uri $SDLbgi_url -OutFile SDL_bgi.zip
Write-Host "Unziping SDL_bgi.zip"
Expand-Archive -Path SDL_bgi.zip -Destination .

Write-Host "SDL_bgi.dll -> C:\Dev-Cpp\MinGW64\lib"
#TODO
Write-Host "SDL_bgi.h -> $SDL_folder\x86_64-w64-mingw32\include\SDL2"
Copy-Item -Path "$SDLbgi_folder\src\SDL_bgi.h" -Destination "$SDL_folder\x86_64-w64-mingw32\include\SDL2"
Write-Host "graphics.h -> $SDL_folder\x86_64-w64-mingw32\include"
Copy-Item -Path "$SDLbgi_folder\src\graphics.h" -Destination "$SDL_folder\x86_64-w64-mingw32\include"
Write-Host "SDL2.dll -> ."
Copy-Item -Path "$SDL_folder\x86_64-w64-mingw32\bin\SDL2.dll" -Destination .
Write-Host "SDL_bgi.dll -> ."
Copy-Item -Path "$SDLbgi_folder\bin\Dev-Cpp\SDL_bgi.dll" -Destination .

#ja neznam koj genijalac je mislio da ce ovaj powershell zapravo biti koristan, al ovo je katastrofa