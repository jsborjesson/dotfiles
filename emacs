;; --- Setup package management ---
(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Always download missing packages
(setq use-package-always-ensure t)


;; --- Install and configure packages ---
;; Evil
(use-package evil
  :config
    (evil-mode t)
    (define-key evil-normal-state-map (kbd "U") 'undo-tree-redo))

(use-package evil-surround
  :config (global-evil-surround-mode t))

(use-package evil-commentary
  :config (evil-commentary-mode))

(use-package evil-visualstar
  :config (global-evil-visualstar-mode))

(use-package evil-org)



(use-package magit)

(use-package org
  :config
    (setq org-log-done t)
    (setq org-todo-keywords
      '((sequence "TODO" "WAITING" "IN-PROGRESS" "DONE"))))
    (setq org-todo-keyword-faces
      '(
        ("TODO" . (:foreground "red" :weight bold))
        ("WAITING" . (:foreground "orange" :weight bold))
        ("IN-PROGRESS" . (:foreground "sky" :weight bold))))


;; --- Settings ---
;; Read this file as elisp
(add-to-list 'auto-mode-alist '("emacs" . emacs-lisp-mode))

;; Turn off ugly GUI stuff
(menu-bar-mode -1)
(if (display-graphic-p)
  (progn
    (tool-bar-mode -1)
    (scroll-bar-mode -1)))

;; Enable Cmd key as Super(s)
(setq mac-command-modifier 'super)

;; Toggle full screen mode with Cmd-RET
(global-set-key (kbd "s-<RET>") 'toggle-frame-fullscreen)


(setq ring-bell-function 'ignore)

;; Start calendar on Monday
(setq calendar-week-start-day 1)

;; Enable line numbers
;; (global-linum-mode t)

;; IDO mode
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; Disable the splash screen
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)
