;; Add Melpa location so we can install Magit.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives
   '("melpa" . "http://melpa.milkbox.net/packages/")
;;   '("melpa" . "http://melpa.org/packages/")
   t)

;; Work round Mac binding of meta key and #
(global-set-key (kbd "M-3") "#")
(global-set-key (kbd "C-x M-3") (quote server-edit))

(global-set-key [f8] (quote compile))
(global-set-key [f5] (quote revert-buffer))
(global-set-key (kbd "C-.") (quote pop-global-mark))
(global-set-key (kbd "C-^") (quote join-line))
(global-unset-key (kbd "C-x C-c")) ; don't want this happening by accident
(global-unset-key (kbd "C-x C-z")) ; or this
(global-set-key (kbd "C-x g") 'magit-status)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(cua-mode 1)
;; (tool-bar-mode -1)
(when (member "Droid Sans Mono" (font-family-list))
  (set-face-attribute 'default nil :font "Droid Sans Mono"))
;; (add-to-list 'default-frame-alist '(font . "Droid Sans Mono-10"))

(defun my-go-mode-hook ()
  ; Use goimports instead of go-fmt
  ; (setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'my-go-mode-hook)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (go-mode)))
 '(whitespace-style (quote (trailing))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(server-start)

;; ========= Set colours ==========

(set-foreground-color "white")
(set-background-color "black")
