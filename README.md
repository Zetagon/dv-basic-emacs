# Installation

Se till så att det inte finns en .emacs fil i ~
`
cd ~
git clone https://github.com/Zetagon/dv-basic-emacs.git
ln -s ~/dv-basic-emacs/.emacs ~/.emacs
emacs
`

Det finns lite beskrivningar av hur man använder den här konfigen och Emacs generellt i .emacs filen.

# Vim-användare
Emacs har ett utmärkt plugin för vim-användare med det utmärkta namnet
evil-mode. Det ger operativsystemet Emacs en väldigt bra editor(Vi)!

# Inkluderade plugins:
| Package      | Beskrivning                                                                                            |
|--------------|--------------------------------------------------------------------------------------------------------|
| use-package  | En package-manager                                                                                     |
| magit        | Ett smidigt git interface för Emacs. Rekommenderas att testa                                           |
| which-key    | När en du slår en halvfärdig knappkombination(ex. C-x) så kommer Emacs säga vilka alternativ som finns |
| ivy          | Fuzzy-finding. Gör allmänt livet lättare                                                               |
| company      | Auto-completion                                                                                        |
| haskell-mode |                                                                                                        |
| AucTeX       | Bra latex-mode                                                                                         |
|              |                                                                                                        |

Av-kommentera raden längst ner i .emacs filen för att börja använda evil-mode.
# Bidra till koden

Jag har slängt ihop den här konfigen och det finns säker hur många saker som helst som kan förbättras. Gör en pull-request eller öppna en issue!
