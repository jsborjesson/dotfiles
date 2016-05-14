;; --- Install packages ---
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(defvar package-list
      '(
	evil
	magit
	))

(or
 (file-exists-p package-user-dir)
 (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; --- Configure packages ---
(require 'evil)
(evil-mode t)

(require 'org)
(setq org-log-done t)

;; --- Settings ---
;; Turn off ugly GUI stuff
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq ring-bell-function 'ignore)

;; Enable line numbers
(global-linum-mode t)

;; IDO mode
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; Disable the splash screen
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)
