;; -*- lexical-binding: t -*-

;; Alla rader markerade med ";--" på slutet representerar rader som krävs för evil-mode(ett plugin för att få vim bindings) och kan tas bort.

	    ;; Grundläggande terminologi:

	    ;; C-g betyder Ctrl + g.
	    ;; C-x C-f betyder: Håll ner Ctrl och tryck x sen f.
	    ;; C-x u bedyer: Tryck Ctrl + x, släpp controll och tryck u.

	    ;; Viktiga default Emacs-kommandon.
	    ;; | key-binding | Beskrivning                                      |
	    ;; |-------------+--------------------------------------------------|
	    ;; | C-g         | Avbryt                                           |
	    ;; | C-x C-f     | Hitta fil                                        |
	    ;; | C-x C-s     | Spara fil                                        |
	    ;; | C-x u       | Undo                                             |
	    ;; | C-x b       | Öppna tidigare öppnad fil(sen du startade Emacs) |

	    ;; Längst ner i den här filen finns några rader som gör att C-x, C-s, C-c och C-v fungerar som andra text-redigerare.


;; https://github.com/noctuid/evil-guide#keybindings-in-emacs
;;* Misc.

;;** use-package configuration
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize);;Maybe unnecessary

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;;** Evil mode                          ;--
;;*** Leader keybindings                ;--
(use-package undo-tree			;--
             :ensure t)			;--
(use-package evil-leader		;--
  :ensure t                            	;--
  :after (evil)				;--
  :config				;--
  (global-evil-leader-mode)		;--
  (setq evil-leader/leader "<SPC>")	;--
  (evil-leader/set-key			;--
   "bs" 'save-buffer			;--
   "." 'find-file			;--
   "bk" 'kill-this-buffer		;--
   "wc" 'delete-window			;--
   "ws" 'evil-window-split		;--
   "wv" 'evil-window-vsplit		;--
   "wh"  'evil-window-left		;--
   "wl"  'evil-window-right		;--
   "wk"  'evil-window-up		;--
   "wj"  'evil-window-down))		;--
;;*** Evil-config                                           ;--
(use-package evil			;--
  :ensure t				;--
  :after (undo-tree)			;--
  :init
  (setq evil-want-keybinding nil)
  :config (global-undo-tree-mode))	;--
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))
;;*** Evil escape                                           ;--
(use-package evil-escape		;--
  :ensure t				;--
  :after (evil)				;--
  :config				;--
  (setq-default evil-escape-key-sequence "jk") ;--
  (evil-escape-mode))			       ;--
;;*** surround                                           ;--
(use-package evil-surround		;--
  :ensure t				;--
  :after (evil)				;--
  :config				;--
  (global-evil-surround-mode 1))	;--
;;** Magit
(use-package magit
  :ensure t
  :config
  (evil-leader/set-key			;--
    "gs" 'magit-status)			;--
  )					
(use-package evil-magit			;--
  :ensure t				;--
  :after (magit)			;--
  :config)				;--
;;** Autocomplete
(use-package company
  :ensure t
  :config
  (global-company-mode)
  (evil-define-key nil evil-insert-state-map 
    "M-/" 'company-complete)		;--
  ) 

;;** which-key
(use-package which-key
  :ensure t
  :config
  (which-key-mode))


;;** Fuzzy finding
(use-package ivy
  :ensure t
  :bind ("C-s" . swiper)	;Is overriden by default at the bottom
  :config
  (ivy-mode)
  (evil-leader/set-key			;--
    "<SPC>" 'execute-extended-command	;--
    "bb" 'ivy-switch-buffer)		;--
  )
;;* Language-configs
;;** Haskell
(use-package haskell-mode
  :ensure t
  :bind
  (:map haskell-mode-map
	("C-c C-l" . haskell-process-load-file)))

(evil-define-key 'normal haskell-mode-map ;--
  ",l" 'haskell-process-load-file)	  ;--
;;** LaTeX
(use-package tex
  :ensure auctex
  :config
  (evil-leader/set-key-for-mode 'LaTeX-mode "," 'TeX-command-master) ;--
  )

  
(ivy-mode)
;;* Like-windows config
;; Se https://www.emacswiki.org/emacs/CuaMode 

(cua-mode t)				  ; Ctrl + x,c,v för att klippa, kopiera respektive klistra in
(global-set-key (kbd "C-s") 'save-buffer) ; Ctrl + s för att spara
(global-set-key (kbd "C-f") 'swiper)	  ; Ctrl + f för att söka

;; (evil-mode 1)                          ; Vim bindings. Ta bort semikolon i början för att aktivera           ;--
;;* Custom set variables

