(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(require 'evil)
(evil-mode t)

(require 'org)
(setq org-log-done t)

(setq calendar-week-start-day 1)

(menu-bar-mode -1)
